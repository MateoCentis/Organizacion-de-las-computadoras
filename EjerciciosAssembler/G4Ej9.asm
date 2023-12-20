.data #programa que cuenta en a0 cuantos valores son mayores que 400
V: 3,4,5,6,7,8,9,10,100,300,401,100,2,34,5,6,7,1000,2000 #e tiene que haber
.align 2
.text
la a1,V #a1 apunta al comienzo del vector
addi t2,zero,400
do: slti t6,t5,20 #hasta 20
beq t6,zero,fin #condicion de corte
lw t0,(a1)	#carga en t0 el valor de a1
ble t0,t2,menor #si t0<=t2 va a menor que es lo que queremos
#si entra aca es mayor por lo tanto aumento a0
addi a0,a0,1 #acumulo en a0
menor:
addi a1,a1,4 #aumento puntero
addi t5,t5,1 #aumento contador
j do
fin:
