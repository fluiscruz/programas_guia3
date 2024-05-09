#!/bin/bash
echo ""
echo "El siguiente script suma dos valores numéricos naturales"
echo ""
# Las siguientes líneas piden al usuario ingresar la pimera y segunda variable
# numérica. Paralelamente estas se guardan en las variables val1 y val2
echo "Ingresar primer valor:"
read val1
echo "Ingresar segundo valor:"
read val2
# La siguiente linea suma e imprime el resultado
suma=$(expr $val1 + $val2)
echo ""
echo "La suma de los valores ingresados es:" $suma
echo ""
echo "*By: Luis Cruz"
