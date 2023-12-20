.data 
V:
 11,20,31,41,50,61,70,81,90,101,110,121,130,141,150
.align 2
A: .align 2
.text
la a0,V
la a1,A
addi s0,zero,0x2 #s0=2
do : slti t6,t0,15 #si t0<15 pone 1 sino 0
beq t6,zero,fin #si t6 es 0 termina es decir t0 ya llego a 15
#leo y aumento
lw t1,(a0) #carga el valor de la celda de memoria que corresponde a V en t1
addi a0,a0,4 #aumenta puntero a la proxima celda de V
rem t2,t1,s0 #t2=t1 mod s0
beq t2,zero,finsi #si es par vuelve al do, sino lo guarda y aumenta a1
sw t1,(a1) #la guarda en A
addi a1,a1,4 #aumenta puntero a la proxima celda de A
finsi:
addi t0,t0,1 #suma contador
j do
fin: addi a7,zero,10 
ecall 