.data #Programa que te da el mayor de una lista
V: 40,200,130,50,100,400,31,21
.align 0
.text
la a0,V #a0 apunta V
addi t1,zero,0

do: slti t6,t5,8 #si t0<3 pone en 1 sino en 0
beq t6,zero,fin #si t6 es 0 termina, es decir, t0 ya llego a 3
lw t0,(a0) #t0=V[i]
addi a0,a0,4 #aumento el puntero de desplazamiento
ble t0,t1,entonces #si t0<=t0(anterior) va a entonces
add a2,zero,t0 #si t0 es mayor lo cargo en a2
add t1,zero,t0 #pongo t1 con t0
entonces: 
addi,t5,t5,1 #suma contador
j do
fin: 
sw a2,(a0) #lo guardo en memoria al final del vector
addi a7,zero,10
ecall
