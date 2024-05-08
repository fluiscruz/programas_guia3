#!/bin/bash
echo "El siguiente script suma dos valores numéricos naturales"
# Las siguientes líneas piden al usuario ingresar la pimera y segunda variable
# numérica. Paralelamente estas se guardan en las variables val1 y val2
echo "Ingresar primer valor númerico:"
read val1
echo "Ingresar segundo valor númerico:"
read val2
# La siguiente linea suma e imprime el resultado
let suma=$val1+$val2
echo "La suma de los valores ingresados es:" $suma
