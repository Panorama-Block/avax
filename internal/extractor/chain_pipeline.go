package extractor

import (
	"log"
	"sync"

	"github.com/Panorama-Block/avax/internal/api"
	"github.com/Panorama-Block/avax/internal/kafka"
	"github.com/Panorama-Block/avax/internal/types"
)

func StartPipeline(client *api.Client, producer *kafka.Producer) {
	chains, err := client.GetChains()
	if err != nil {
		log.Printf("Erro ao obter chains: %v", err)
		return
	}

	var wg sync.WaitGroup
	results := make(chan *types.Chain, len(chains))

	for _, chain := range chains {
		wg.Add(1)
		go func(chainID string) {
			defer wg.Done()
			chainData, err := client.GetChainByID(chainID)
			if err != nil {
				log.Printf("Erro ao buscar chain %s: %v", chainID, err)
				return
			}
			results <- chainData
		}(chain.ChainID)
	}

	wg.Wait()
	close(results)

	for chain := range results {
		producer.Send(chain)
	}
}
