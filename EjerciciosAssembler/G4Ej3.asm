.data 
V:
 10,20,30,40,50,60,70,80,90,100,110,120,130,140,150
.align 2
A: .align 2
.text
la a0,V
la a1,A
do : slti t6,t0,15 #si t0<15 pone 1 sino 0
beq t6,zero,fin #si t6 es 0 termina es decir t0 ya llego a 15
lw t1,(a0) #carga el valor de la celda de memoria que corresponde a V en t1
sw t1,(a1) #la guarda en A
addi a0,a0,4 #aumenta puntero a la proxima celda de V
addi a1,a1,4 #aumenta puntero a la proxima celda de A
addi t0,t0,1 #suma contador
j do
fin: addi a7,zero,10 
ecall 