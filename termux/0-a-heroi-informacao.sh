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
#        AUTHOR:  Emerson Rocha, rocha@ieee.org
#       COMPANY:  EticaAI
#       LICENSE:  Public DOmain
#       VERSION:  1.0
#       CREATED:  2019-05-08 18:03 BRT
#      REVISION:  ---
#===============================================================================

if (( $EUID == 0 )); then
    echo "EXECUTANDO COMO SUPER USUARIO: sim (pode ser perigoso!)"
    # echo "Cuidado! Parece que esta executando como superusuario sudo."
else
    echo "EXECUTANDO COMO SUPER USUARIO: nao"
fi