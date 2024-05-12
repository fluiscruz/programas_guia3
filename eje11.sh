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

# Esta linea guardara el valor inicial de bytes que se recibe. Este
# valor servira como valor base
bytes_i=$(cat /sys/class/net/enp?s?/statistics/rx_bytes)

# Las siguientes lineas guardaran en el archivo ./tmp/tmp la hora y la
# cantidad de bytes recibidos acumulados en funcion al tiempo estimado
# al inicio.
while [ "$(date +"%H:%M:%S")" \< "$hora_fin" ]; do
	hora=$(date +"%H:%M:%S")
	bytes_now=$(cat /sys/class/net/enp?s?/statistics/rx_bytes)
	echo $hora $bytes_now >> $tmp
	sleep 1
done

echo ""
echo "Proceso terminado! Graficando..."

# Las siguientes lineas realizaran la diferencia consecutiva por linea
# del archivo ./tmp/tmp para calcular la cantidad real de bytes recibidos,
# tambien sumara el valor de bytes inicial recibidos $bytes_i y guardara
# los resultados en el archivo ./tmp/datos.
# Posteriormente, las siguientes lineas ejecutan dos code-python para
# graficar la cantidad de bytes recibidos por segundo y la cantidad
# acumulada de bytes recibidos por segundo
awk -v bytes=$bytes_i 'NR>1 {print $1, $2-prev+bytes; prev=$2}' ./tmp/tmp > $datos
python3 trafico_red.py &
python3 trafico_red_acum.py

echo ""
echo "Si desea ver los datos, puede revisar el archivo ./tmp/datos"
echo ""
echo "*By: Luis Cruz"
