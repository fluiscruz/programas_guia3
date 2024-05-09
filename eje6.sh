#!/bin/bash
# Las siguientes líneas piden al usuario ingresar su rango y sueldo
echo ""
echo "Digite el rango al cual pertenece (1 2 3)"
read rango
echo ""
echo "Digite el valor de su sueldo mensual"
read sueldo
echo ""
# Calculamos la asigancion en funcion del valor de rango y sueldo ingresados
case $rango in
	1) asig=$(echo "scale=2; $sueldo * 0.83" | bc);;
	2) asig=$(echo "scale=2; $sueldo * 1.20" | bc);;
	3) asig=$(echo "scale=2; $sueldo * 5.00" | bc);;
esac
echo "Su asignacion sera: " $asig " pesos argentinos"
echo ""
echo "By: Luis Cruz"
