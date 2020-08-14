#!/bin/bash
#
# Script: Executa Força Bruta em Arquivos com Senhas em Formato - WINRAR
# Escrito por: Cesar Nunes
# Email: raynunes@gmail.com
# Data: 11/08/2020
#
clear
#
# Check root
if [ "`whoami`" != "root" ]; then
  echo "É necessário ser root para a instalação"
  echo ""
  echo "Atenção: Logue como usuário root e execute o script novamente"
  echo ""
  exit
fi
#
echo ""
echo "#####################################################################"
echo "#                                                                   #"
echo "#                      Seja Bem-Vindo!!!                            #"
echo "#                    Unrar Força Bruta Password                     #"
echo "#      Projeto para quebrar Password de Arquivos .rar               #"
echo "#                                        Versão: 1.0.0              #"
echo "#                                                                   #"
echo "#####################################################################"
echo ""
sleep 2
#
#Nome do Arquivo .rar:
narquivo="exemplo.rar"
#Nome e Localização Arquivo de senhas:
file="./dicionario01.txt"
#Localização da pasta de descompacção:
pdescompactacao="/home/pasta01"
#Logs de manipulação: 
log="./log.err"
logs="./log.log"
#
#
echo "" > $logs
while read -r line
 do
   unrar x $narquivo -p$line -y $pdescompactacao 1>> $logs 2> $log
   cat $logs
   recebe=`cat $logs | grep 'All OK'`
   test "$recebe" = "All OK"
		if [ $? == 0 ]
			then
				exit
		fi
done < "$file"
#
#