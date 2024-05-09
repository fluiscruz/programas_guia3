#!/bin/bash
# Las siguientes líneas piden al usuario ingresar su rango y sueldo
echo ""
echo "El siguiente script repetirá un mensaje las veces que le indiques"
read val
echo ""
for ((i = 1; i <= $val; i++));
do
	echo "Este es el mensaje " $i
done
echo ""
echo "*By: Luis Cruz"
