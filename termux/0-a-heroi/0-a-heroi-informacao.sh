#!/bin/bash
#===============================================================================
#
#          FILE:  0-a-heroi-informacao.sh
#
#         USAGE:  ./0-a-heroi-informacao.sh
#
#   DESCRIPTION:  Script escrito como apoio ao rascunho do documento 
#                 "Do zero ao seu perfil profissional no GitHub usando apenas
#                 Smartphone Android e internet móvel" iniciado em 2019-05-07
#                 na comunidade de Facebook "Ligação Africa Brasil (Programação
#                 e informática)"
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Emerson Rocha <rocha@ieee.org>
#       COMPANY:  EticaAI
#       LICENSE:  Public Domain
#       VERSION:  1.0
#       CREATED:  2019-05-08 18:03 BRT
#      REVISION:  ---
#===============================================================================

if (( $EUID == 0 )); then
    echo "ROOT: sim (pode ser perigoso!)"
    # echo "Cuidado! Parece que esta executando como superusuario sudo."
else
    echo "ROOT: nao"
fi

echo "TESTANDO CONEXCAO COM GITHUB, inicio"
echo "ssh -T git@github.com"
ssh -T git@github.com
echo "TESTANDO CONEXCAO COM GITHUB, fim"

echo "TODO: melhorar 0-a-heroi-informacao.sh"