#!/bin/bash
#entrando no diretório dos logs
cd /opt/tomcatIaspi/logs


#variaveis
dia=$(date +%Y-%m-%d)
anos3=$(date +%Y)
mess3=$(date +%m)
#copiando para o s3 os logs
aws s3 cp /opt/tomcatIaspi/logs/logsdasemana s3://teste-logs/$anos3/$mess3/ --recursive
result=$?

if [ $result -eq 0 ];then
	echo "Comandoexecutado com sucesso"
	rm -f catalina.*.gz && rm -f /opt/tomcatIaspi/logs/logsdasemana/catalina.*.gz
	echo logs removidos da pasta
else
	echo "Falha no envio de logs para o s3"
fi
