#!/bin/bash
# Las siguientes líneas piden al usuario ingresar el numero a evaluar
echo ""
echo "Escoge un número natural entre 1 y 10"
read val1
echo ""
# Comparamos el numero ingresado con un numero aleatorio
random_val=$RANDOM
if [ $val1 -eq $random_val ]; then
	echo $val1 " y " $random_val " son iguales"
elif
	[ $val1 -gt $random_val ]; then
	echo $val1 " es mayor que " $random_val
else
	echo $val1 " es menor que " $random_val
fi
echo ""
echo "*By: Luis Cruz"
