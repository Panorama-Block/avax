package metrics

import (
	"context"
	"log"
	"time"

	"github.com/Panorama-Block/avax/internal/api"
	"github.com/Panorama-Block/avax/internal/event"
	"github.com/Panorama-Block/avax/internal/service"
	"github.com/Panorama-Block/avax/internal/types"
)

// StakingService coleta métricas de staking (validators, delegators, total stake)
// Intervalo padrão: 30m (configurável via STAKING_METRICS_INTERVAL)

type StakingService struct {
    *BaseService
}

func NewStakingService(
    apiClient *api.API,
    eventManager *event.Manager,
    collectionInterval time.Duration,
    options ...service.ServiceOption,
) *StakingService {
    lookback := collectionInterval // staking não precisa lookback extenso
    base := NewBaseService(apiClient, eventManager, "staking-metrics-service", collectionInterval, lookback, options...)
    return &StakingService{BaseService: base}
}

func (s *StakingService) Start() error {
    if err := s.BaseService.Start(); err != nil {
        return err
    }
    // Worker único
    s.RunWorker(0, s.collectionWorker)
    return nil
}

func (s *StakingService) collectionWorker(ctx context.Context, id int) {
    ticker := time.NewTicker(s.GetCollectionInterval())
    defer ticker.Stop()

    s.collectMetrics(ctx)

    for {
        select {
        case <-ctx.Done():
            log.Printf("[%s] worker %d stopping", s.GetName(), id)
            return
        case <-ticker.C:
            s.collectMetrics(ctx)
        }
    }
}

func (s *StakingService) collectMetrics(ctx context.Context) {
    chains := s.GetChains()
    if len(chains) == 0 {
        log.Printf("[StakingService] no chains configured")
        return
    }

    for _, chainID := range chains {
        apiClient := s.GetAPI()
        metrics, err := apiClient.Client.GetStakingMetrics(chainID)
        if err != nil {
            log.Printf("[StakingService] error fetching staking metrics for %s: %v", chainID, err)
            continue
        }

        event := types.Event{
            Type: types.EventStakingMetricsUpdated,
            Data: metrics,
        }
        if err := s.GetEventManager().PublishEvent(event); err != nil {
            log.Printf("[StakingService] error publishing staking metrics: %v", err)
        } else {
            log.Printf("[StakingService] published staking metrics for %s", chainID)
        }
    }
} 