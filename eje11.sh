#!/bin/bash
echo ""
echo "El siguiente script guardara el trafico de datos recibidos por su"
echo "placa de red por intervalos de segundo en el archivo ./tmp/datos"
echo "por el tiempo en segundo que Ud. indique"
echo ""
# Leemos el tiempo de ejecucion y calculamos el tiempo de duracion del
# script
read tiempo
hora_fin=$(date -d "$tiempo seconds" +"%H:%M:%S")
echo ""
echo "Running..."

# Definimos el archivo sobre el cual guardaremos los datos y un archivo
# temporal
datos="./tmp/datos"
tmp="./tmp/tmp"

# Las siguientes lineas borran y crean el archivo nuevamente para que no
# guarde datos de anteriores ejecuciones
rm ./tmp/datos ./tmp/tmp
touch ./tmp/datos ./tmp/tmp

# Defino la primera entrada de mi archivo ./tmp/tmp
#hora=$(date +"%H:%M:%S")
#bytes_i=$(cat /sys/class/net/enp?s?/statistics/rx_bytes)
#echo $hora $bytes_i > $tmp

# Las siguientes lineas guardaran la hora y la cantidad de bytes recibidos
# en funcion al tiempo estimado en el archivo ./tmp/tmp. Luego restará la
# cantidad de bytes actuales con el último valor guardado en ./tmp/tmp y
# lo guardará en ./tmp/datos
while [ "$(date +"%H:%M:%S")" \< "$hora_fin" ]; do
	hora=$(date +"%H:%M:%S")
	bytes_now=$(cat /sys/class/net/enp?s?/statistics/rx_bytes)
	echo $hora $bytes_now >> $tmp
#	bytes_before=$(tail -n 1 "$tmp" | awk '{print $2}')
#	bytes_final=$((bytes_now - bytes_before))
#	echo $hora $bytes_final >> $datos
	sleep 1
done

echo ""
echo "Proceso terminado! Graficando..."

awk 'NR>1 {print $1, $2-prev; prev=$2}' ./tmp/tmp > ./tmp/datos

# La siguiente linea ejecuta el code python para graficar el archivo
# ./tmp/datos
python3 trafico_red.py

echo ""
echo "Si desea ver los datos, puede revisar el archivo ./tmp/datos"
echo ""
echo "*By: Luis Cruz"
