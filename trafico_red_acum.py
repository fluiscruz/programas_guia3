#!/usr/bin/python3
import matplotlib.pyplot as plt
fuente=open("./tmp/tmp","r")
x=[]
y=[]
cont=[]
cont2=0

for linea in fuente.readlines()[1:]:
    if linea == "\n":
        break
    graf = linea.split(" ")
    xn=graf[0]
    yn=int(graf[1]) / 1000
    cont2=cont2+1
    x.append(xn)
    y.append(yn)
    cont.append(cont2)

plt.plot(cont,y,"r")
plt.xlabel('tiempo (s)')
plt.ylabel('Acumulated Wireless RX (KByte)')
plt.title('Monitor de Tráfico Acumulado GNU/Linux')
plt.grid(True)
plt.savefig("rx_traffic_acum.png")
plt.show()
fuente.close()
