# 🚀 Guia Context7 - Documentação em Tempo Real

O Context7 é um servidor MCP da Upstash que revoluciona o desenvolvimento ao fornecer documentação **sempre atualizada** para suas solicitações de código.

## 🎯 O Problema que Resolve

❌ **Antes do Context7:**
- IA sugere APIs deprecadas
- Código baseado em versões antigas
- Exemplos que não funcionam
- Perda de tempo com documentação desatualizada

✅ **Com Context7:**
- Documentação sempre atual
- APIs e métodos verificados
- Exemplos funcionais
- Código idiomático e atualizado

## 🔧 Como Usar

### Sintaxe Básica
Adicione `use context7` ao final de qualquer prompt:

```
Como implementar rate limiting em Go? use context7
```

### 📚 Exemplos para Go/Blockchain

#### Desenvolvimento Go Básico
```
// HTTP Client com retry
Como criar um HTTP client robusto com retry logic em Go? use context7

// Concurrent processing
Implementar processamento concorrente de dados com workers em Go. use context7

// Error handling
Padrões de error handling idiomáticos em Go com wrapping. use context7

// Testing
Criar testes table-driven para função de validação. use context7
```

#### Desenvolvimento Blockchain/Avalanche
```
// RPC Client
Como conectar com RPC da Avalanche usando Go? use context7

// Transaction parsing
Parser de transações Avalanche em Go com validação. use context7

// Web3 integration
Integrar com bibliotecas Web3 Go para Avalanche. use context7

// Contract interaction
Interagir com smart contracts na Avalanche via Go. use context7
```

#### Docker & DevOps
```
// Multi-stage builds
Criar Dockerfile multi-stage otimizado para Go. use context7

// Health checks
Implementar health checks para aplicação Go no Docker. use context7

// Environment configuration
Gerenciar configurações de ambiente em Go. use context7
```

#### Performance & Monitoring
```
// Profiling
Como usar pprof para profiling de aplicação Go? use context7

// Metrics
Implementar métricas com Prometheus em Go. use context7

// Logging estruturado
Setup de logging estruturado com zap/logrus. use context7
```

## 🎨 Padrões de Uso Efetivos

### 1. Seja Específico com Bibliotecas
```
✅ MELHOR:
Como usar a biblioteca 'gin' para criar API REST em Go? use context7

❌ GENÉRICO:
Como criar API em Go? use context7
```

### 2. Inclua Contexto de Versão
```
✅ MELHOR:
Usar Go modules com Go 1.21+ para gerenciar dependências. use context7

❌ VAGO:
Como gerenciar dependências em Go? use context7
```

### 3. Combine com Contexto do Projeto
```
✅ PROJETO-ESPECÍFICO:
Implementar extração de dados blockchain Avalanche com rate limiting. use context7

✅ TÉCNICO-ESPECÍFICO:
Como otimizar performance de processamento de blocos em Go? use context7
```

## 🔥 Casos de Uso Avançados

### Debugging e Troubleshooting
```
// Race conditions
Como detectar e corrigir race conditions em Go? use context7

// Memory leaks
Debuggar memory leaks em aplicações Go com grandes volumes de dados. use context7

// Performance bottlenecks
Identificar bottlenecks em pipeline de processamento de blockchain. use context7
```

### Arquitetura e Design Patterns
```
// Clean architecture
Implementar clean architecture em aplicação Go blockchain. use context7

// Repository pattern
Pattern Repository para acesso a dados blockchain em Go. use context7

// Circuit breaker
Implementar circuit breaker para chamadas RPC externas. use context7
```

### Integração e APIs
```
// REST API design
Design de API REST para dados blockchain seguindo boas práticas. use context7

// GraphQL integration
Integrar GraphQL com resolvers para dados Avalanche. use context7

// WebSocket streams
Stream de dados blockchain em tempo real via WebSocket. use context7
```

## 📈 Resultados Esperados

### Antes vs Depois

**⏱️ Tempo de Desenvolvimento:**
- Antes: 30min pesquisando documentação
- Depois: 2min obtendo código funcionando

**🎯 Qualidade do Código:**
- Antes: 60% chance de usar padrões desatualizados
- Depois: 95% chance de código idiomático e atual

**🐛 Bugs:**
- Antes: Muitos bugs por APIs desatualizadas
- Depois: Código funcional desde o primeiro prompt

## 🚨 Dicas Importantes

### ⚡ Performance
- Context7 adiciona ~2-3s ao tempo de resposta
- Vale a pena pela qualidade da resposta
- Use para tarefas complexas, não para simples

### 🎯 Quando Usar
```
✅ USE para:
- Implementações de bibliotecas específicas
- Padrões de código complexos
- Integrações com APIs externas
- Setup de ferramentas/frameworks

❌ NÃO USE para:
- Perguntas conceituais simples
- Syntax básica da linguagem
- Matemática/lógica pura
```

### 📝 Formato de Prompts Ideal
```
[AÇÃO] + [CONTEXTO ESPECÍFICO] + [TECNOLOGIA] + use context7

Exemplos:
- Implementar + parser de blocos Avalanche + em Go + use context7
- Criar + pipeline de dados com workers + usando channels Go + use context7
- Otimizar + performance de consultas blockchain + com cache + use context7
```

## 🔧 Troubleshooting

### Context7 Não Funciona
```bash
# Verificar se está instalado
npm list -g @upstash/context7-mcp

# Reinstalar se necessário
npm install -g @upstash/context7-mcp@latest

# Verificar configuração MCP
cat .cursor/mcp-config.json
```

### Respostas Não Melhoram
1. **Seja mais específico** com bibliotecas/versões
2. **Inclua contexto** do que está tentando fazer
3. **Mencione o domínio** (blockchain, Go, etc.)

### Performance Lenta
1. **Use Context7 seletivamente** para tarefas complexas
2. **Combine** com prompts bem estruturados
3. **Evite** para perguntas simples

## 📊 Métricas de Sucesso

Com Context7 ativo, você deve ver:

- **80%+ redução** em tempo pesquisando docs
- **90%+ código funcionando** no primeiro try
- **75%+ menos debugging** de APIs incorretas
- **95%+ padrões idiomáticos** automaticamente

## 🎉 Exemplos de Sucesso

### Antes do Context7
```go
// Código potencialmente desatualizado
resp, err := http.Get(url)
if err != nil {
    log.Fatal(err) // Não idiomático
}
defer resp.Body.Close()
```

### Com Context7
```go
// Código atual e idiomático
ctx, cancel := context.WithTimeout(context.Background(), 30*time.Second)
defer cancel()

req, err := http.NewRequestWithContext(ctx, "GET", url, nil)
if err != nil {
    return fmt.Errorf("creating request: %w", err)
}

resp, err := client.Do(req)
if err != nil {
    return fmt.Errorf("making request: %w", err)
}
defer resp.Body.Close()
```

---

**🚀 Resultado:** Context7 transforma sua experiência de desenvolvimento, garantindo que você sempre trabalhe com as melhores práticas atuais! 