#!/bin/bash


PORT="2223"


echo "Servidor Transfer Unite Recursive International Protocol: TURIP"

echo "(0) LISTEN"
MSG=`nc -l $PORT`

HANDSHAKE=`echo $MSG | cut -d " " -f 1`
IP_CLIENT=`echo $MSG | cut -d " " -f 2`

echo "(3) SEND: Comprobación"

if [ "$HANDSHAKE" != "HOLI_TURIP" ]
then
	echo "ERROR 1: Handshake incorrecto"
	
	echo "KO_TURIP" | nc $IP_CLIENT $PORT

	exit 1
fi
	echo "OK_TURIP" | nc $IP_CLIENT $PORT

echo "(4) LISTEN"

MSG=`nc -l $PORT`

PREFIX=`echo $MSG | cut -d " " -f 1`
FILE_NAME=`echo $MSG | cut -d " " -f 2`

if [ "$PREFIX" != "$FILE_NAME" ]
then	
	echo "ERROR 2: File_Name incorrecto"
	echo "KO_FILE_NAME" | nc $IP_CLIENT $PORT

	exit 1
fi
	echo "OK_FILE_NAME" | nc $IP_CLIENT $PORT



