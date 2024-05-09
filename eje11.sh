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

# Definimos el archivo sobre el cual guardaremos los datos
datos="./tmp/datos"

# Las siguientes lineas borran y cran el archivo nuevamente para que no
# guarde datos de anteriores ejecuciones
rm ./tmp/datos
touch ./tmp/datos

# Las siguientes lineas guardaran la hora y la cantidad de bytes recibidos
# en funcion al tiempo estimado
while [ "$(date +"%H:%M:%S")" \< "$hora_fin" ]; do
	hora=$(date +"%H:%M:%S")
	bytes=$(cat /sys/class/net/enp?s?/statistics/rx_bytes)
	echo $hora $bytes >> $datos
	sleep 1
done

echo ""
echo "Proceso terminado! Graficando..."
python3 trafico_red.py
echo "Si desea ver los datos, puede revisar el archivo ./tmp/datos"
echo ""
echo "*By: Luis Cruz"
