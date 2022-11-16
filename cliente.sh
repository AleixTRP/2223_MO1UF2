#!/bin/bash



IP_LOCAL="127.0.0.1"
PORT="2223"
SERVER_AD="localhost"

echo "Cliente TURIP "

echo "(1) SEND Handshake: HOLI TURIP"

IP_MD5=`echo $IP_LOCAL | md5sum | cut -d " " -f 1`

echo "HOLI_TURIP $IP_LOCAL" | nc $SERVER_AD $PORT


echo "(2) LISTEN: Comprobación Handshake"

MSG=`nc -l $PORT`

echo $MSG

if [ "$MSG" != "OK_TURIP" ]
then
	echo "ERROR 1: Handshake incorrecto"
	exit 1

fi
echo "(5) SEND: Nombre de Archivo"

echo "FILE_NAME vaca.vaca" | nc $SERVER_AD $PORT 

echo "(6) SEND FILE_NAME: Comprobación"

MSG=`nc -l $PORT`

