echo "Leia-me; nao fui feito para ser executado com ./0-a-heroi.sh"
exit 1
#===============================================================================
#
#          FILE:  0-a-heroi.sh
#
#         USAGE:  cat 0-a-heroi.sh
#
#   DESCRIPTION:  Script escrito como apoio ao rascunho do documento 
#                 "Do zero ao seu perfil profissional no GitHub usando apenas
#                 Smartphone Android e internet móvel" iniciado em 2019-05-07
#                 na comunidade de Facebook "Ligação Africa Brasil (Programação
#                 e informática)"
#
#       OPTIONS:  ---
#  REQUIREMENTS:  Android 5.0+
#                 Termux (https://termux.com/)
#          BUGS:
#                 No Android 6+ este guia precisa de atualizacao, vide
#                 - https://wiki.termux.com/wiki/Internal_and_external_storage
#                 - https://wiki.termux.com/wiki/Termux-setup-storage
#         NOTES:  ---
#        AUTHOR:  Emerson Rocha <rocha@ieee.org>
#       COMPANY:  EticaAI
#       LICENSE:  Public Domain
#       VERSION:  1.0
#       CREATED:  2019-05-08 17:48 BRT
#      REVISION:  ---
#===============================================================================

#===============================================================================
# PASSO 0                                                                      #
#===============================================================================
# Este guia foi feito pensando em Android 5.0+ e Termux. Pode precisar de
# alteracoes para ser executado sem alteracoes em outros Sistemas Operacionais
# e e terminais.
#
# - Site oficial:
#   - https://termux.com/
# - Download no Google Play:
#    - https://play.google.com/store/apps/details?id=com.termux
# - Download no F-Droid:
#    - https://f-droid.org/packages/com.termux/
#
# Os arquivos citados neste documento provavelmetne podem ser baixados de:
# - https://eticaai.github.io/eticaai-shell-scripts/termux/0-a-heroi.sh
# - https://eticaai.github.io/eticaai-shell-scripts/termux/0-a-heroi-informacao.sh
#

#===============================================================================
# PASSO 1                                                                      #
#===============================================================================
# Temos um script que pode ser executado automaticamente dar informacoes
# extras. Talvez ele ajuda a ver se voce ja tem os requisitos
# Caso o script estena na pasta local, pode ser executado pelo comando a seguir:

# Permissao de execucao
chmod +x 0-a-heroi-informacao.sh

# Executa os testes
./0-a-heroi-informacao.sh

#===============================================================================
# PASSO 2                                                                      #
#===============================================================================
# Nota: testado com Termux sem extensoes adicionais em 2019-05-08, note:
#       - tamanhos de download podem mudar com passar do tempo
#       - Download pode variar por cada pacote incluri tambem dependencias

## Atualiza o termux
# TODO: documentar quanto espaco isso requer
apt update
apt -y upgrade

### Instalar openssh
# Download: 1723 KB
# Espaço em disco: 7053 KB
pkg install -y openssh

### Instalar git
# Download: 3498 KB
# Espaço em disco: 15,8 MB
pkg install -y git

### Instalar termux-api
## Usada neste tutorial para o termux-clipboard-set (No Linux 'xclip -selection')
# Download: 15,2 KB
# Espaço em disco: 15,2 KB
pkg install termux-api

#===============================================================================
# PASSO 3: criar chave privada/publica & preparar git para usar Nome + Email
#===============================================================================
# Documentacao extra
# - Padrão do GitHub
#   - https://help.github.com/en/articles/set-up-git
#   - https://help.github.com/en/articles/working-with-ssh-key-passphrases
# - Especifica do Termux
#   - https://wiki.termux.com/wiki/Remote_Access

## Gere um pair de chave publico privada.
# Troque "teste@etica.ai" pelo seu e-mail real
ssh-keygen -t rsa -b 4096 -C "teste@etica.ai"

## Configura Nome da pessoa e-mail padrao para todos os repositorios
git config --global user.name "Meu Nome Profissional"
git config --global user.email "teste@etica.ai"

# TODO: explicar se a pessoa quer usar com ou sem senha
eval "$(ssh-agent -s)"

#===============================================================================
# PASSO 4: adiciona chave ao GitHub                                            #
#===============================================================================
# Documentacao Extra
# - https://help.github.com/en/articles/adding-a-new-ssh-key-to-your-github-account

## Copie o conteúdo do arquivo que esta em '~/.ssh/id_rsa.pub' para sua area
## de transferencia
# (nao funcionou) termux-clipboard-set < ~/.ssh/id_rsa.pub
cat ~/.ssh/id_rsa.pub

# Caracteres da sua chave publica serão exibidos em tela
# copie tudo entre "ssh-rsa ABC123(...)YZ== seu-email@email.com"

### Adicionar Chaves SSH (isto é no site do GitHub com um navegador de internet)
## 1. Acesse https://github.com/settings/keys
## 2. Clique em "New SSH key", botão no topo
## 3. Cole o que está na sua área de transferencia para caixa 'Key'

#===============================================================================
# PASSO 5: Testar conexção com GitHub                                          #
#===============================================================================
# Documentacao extra
# - Padrão do GitHub
#   - https://help.github.com/en/articles/testing-your-ssh-connection


ssh -T git@github.com
# The authenticity of host 'github.com (192.30.253.112)' can't be established.
# RSA key fingerprint is SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.
# Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
# Warning: Permanently added 'github.com,192.30.253.112' (RSA) to the list of known hosts.
# Enter passphrase for key '/data/data/com.termux/files/home/.ssh/id_rsa':
# Hi fititnt! You've successfully authenticated, but GitHub does not provide shell access.
