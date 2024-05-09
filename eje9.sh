#!/bin/bash
# Las siguientes líneas piden al usuario ingresar su rango y sueldo
echo ""
echo "El siguiente script le indicará el modelo de su CPU"
echo ""
lscpu | grep 'Model name'
echo ""
echo "By: Luis Cruz"
