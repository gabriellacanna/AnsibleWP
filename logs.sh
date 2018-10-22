#!/bin/bash


#entrando na pasta dos logs do tomcat

cd /opt/tomcatIaspi/logs

#setando variavel data e exportando para poder gerar o arquivo de log com a data.

dia=$(date +%Y-%m-%d)
anos3=$(date +%Y)
mess3=$(date +%m)

#compactando arquivo de logs e gerando um arquivo novo de volta.

gzip -9v -c catalina.out > catalina.$dia.gz && > catalina.out
mv catalina.*.gz /opt/tomcatIaspi/logs/logsdasemana

