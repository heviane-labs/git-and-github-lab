#!/bin/bash

# ==============================================================================
# Script: script-to-clone-all-repositories.sh
# Descrição: Clona ou atualiza todos os repositórios públicos de um usuário.
# Autor: Heviane
#
# Lembre-se de rodar dentro do terminal Git Bash, pois o PowerShell não 
# reconhece os comandos awk e sed do script.
#
## Como testar usando o PowerShell: 
### curl.exe -s https://api.github.com/users/heviane/repos | Select-String '(clone_url|ssh_url)'
### (curl.exe -s https://api.github.com/users/heviane/repos | ConvertFrom-Json) | Format-Table name, clone_url, ssh_url
## Como testar usando o Git Bash:
### curl -s https://api.github.com/users/heviane/repos | grep -E '"(clone_url|ssh_url)"'
#
# ==============================================================================

USERNAME="heviane"
PER_PAGE=100
PAGE=1
PROTOCOLO="${1:-https}"

if [ "$PROTOCOLO" = "ssh" ]; then
    URL_TYPE="ssh_url"
    echo "🔑 Modo selecionado: SSH"
elif [ "$PROTOCOLO" = "https" ]; then
    URL_TYPE="clone_url"
    echo "🌐 Modo selecionado: HTTPS"
else
    echo "⚠️ Protocolo '$PROTOCOLO' desconhecido. Utilizando HTTPS por padrão."
    URL_TYPE="clone_url"
fi

echo "🔍 Buscando repositórios de $USERNAME..."

while : ; do
    # Consulta a API do GitHub
    response=$(curl -s "https://api.github.com/users/${USERNAME}/repos?page=${PAGE}&per_page=${PER_PAGE}")

    # Verifica se atingiu limite de requisições ou usuário inválido
    if echo "$response" | grep -q '"message":'; then
        echo "⚠️ Erro retornado pela API do GitHub:"
        echo "$response" | sed -n 's/.*"message": *"\([^"]*\)".*/  -> \1/p'
        break
    fi

    # Filtra dinamicamente de acordo com o protocolo escolhido
    repositories=$(echo "$response" | awk -v campo="$URL_TYPE" '$0 ~ campo {print $2}' | sed -e 's/^"//g' -e 's/",$//g')

    # Se a página atual não retornar repositórios, encerra o loop
    [ -z "$repositories" ] && break

    for repo in $repositories; do
        # Extrai o nome da pasta do repositório (remove o caminho e o sufixo .git)
        repo_name=$(basename "$repo" .git)

        if [ -d "$repo_name" ]; then
            echo "🔄 Repositório '$repo_name' já existe. Atualizando com git pull..."
            git -C "$repo_name" pull
        else
            echo "📥 Clonando '$repo_name'..."
            git clone "$repo"
        fi
    done

    PAGE=$((PAGE + 1))
done

echo "✅ Todos os repositórios foram processados com sucesso!"