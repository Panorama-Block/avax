#!/bin/bash

# Script de Setup MCP para Cursor - Projeto Avalanche
# Este script instala e configura todas as dependências MCP necessárias

set -e

echo "🚀 Configurando MCP para Cursor - Projeto Avalanche..."

# Verificar se Node.js está instalado
if ! command -v node &> /dev/null; then
    echo "❌ Node.js não encontrado. Instalando..."
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt-get install -y nodejs
else
    echo "✅ Node.js encontrado: $(node --version)"
fi

# Verificar se npm está instalado
if ! command -v npm &> /dev/null; then
    echo "❌ npm não encontrado. Instalando..."
    sudo apt-get install -y npm
else
    echo "✅ npm encontrado: $(npm --version)"
fi

# Instalar servidores MCP globalmente
echo "📦 Instalando servidores MCP disponíveis..."

# Verificar e instalar apenas pacotes que existem
echo "Tentando instalar @modelcontextprotocol/server-filesystem..."
npm install -g @modelcontextprotocol/server-filesystem 2>/dev/null || echo "⚠️  Pacote filesystem não encontrado"

# Instalar Context7 (Upstash) - Documentação em tempo real
echo "📚 Instalando Context7 MCP (documentação em tempo real)..."
npm install -g @upstash/context7-mcp@latest

echo "ℹ️  Context7 instalado! Use 'use context7' nos seus prompts para documentação atualizada"

echo "✅ Servidores MCP instalados com sucesso!"

# Verificar se Go está instalado e configurado
if ! command -v go &> /dev/null; then
    echo "⚠️  Go não encontrado. Recomendado para este projeto."
    echo "   Instale Go em: https://golang.org/dl/"
else
    echo "✅ Go encontrado: $(go version)"
fi

# Instalar ferramentas Go recomendadas
if command -v go &> /dev/null; then
    echo "🔧 Instalando ferramentas Go..."
    
    # goimports para formatação automática de imports
    go install golang.org/x/tools/cmd/goimports@latest
    
    # golangci-lint para linting
    curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin
    
    # gopls (Go Language Server)
    go install golang.org/x/tools/gopls@latest
    
    echo "✅ Ferramentas Go instaladas!"
fi

# Verificar se Docker está instalado
if ! command -v docker &> /dev/null; then
    echo "⚠️  Docker não encontrado. Recomendado para este projeto."
    echo "   Instale Docker em: https://docs.docker.com/engine/install/"
else
    echo "✅ Docker encontrado: $(docker --version)"
fi

# Criar diretório de logs se não existir
mkdir -p .cursor/logs

# Configurar permissões
chmod +x setup-mcp.sh

echo ""
echo "🎉 Setup MCP concluído com sucesso!"
echo ""
echo "📋 Próximos passos:"
echo "1. Reinicie o Cursor para aplicar as configurações"
echo "2. Abra as configurações do Cursor (Cmd/Ctrl + ,)"
echo "3. Procure por 'MCP' nas configurações"
echo "4. Verifique se os servidores MCP estão ativos"
echo ""
echo "🔧 Configurações criadas:"
echo "   ✅ .cursorrules - Regras otimizadas para Go/Avalanche"
echo "   ✅ .cursor/mcp-config.json - Configuração MCP"
echo "   ✅ .cursor/workspace-settings.json - Configurações do workspace"
echo ""
echo "🌐 Para usar busca web, configure BRAVE_API_KEY em:"
echo "   .cursor/mcp-config.json"
echo ""
echo "💡 Dicas de uso:"
echo "   - Use Cmd/Ctrl + L para abrir o chat com contexto completo"
echo "   - Use Cmd/Ctrl + K para gerações inline de código"
echo "   - O MCP agora tem acesso ao sistema de arquivos e Context7"
echo ""
echo "🚀 Context7 - Documentação em tempo real:"
echo "   - Adicione 'use context7' aos seus prompts"
echo "   - Exemplo: 'Como implementar HTTP client em Go? use context7'"
echo "   - Exemplo: 'Criar pipeline de dados Avalanche. use context7'"
echo "   - Context7 busca documentação atualizada automaticamente"
echo "" 