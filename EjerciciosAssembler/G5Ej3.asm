.data 
V:
 11,20,31,41,50,61,70,81,90,101,110,121,130,141,150
.align 2

.text
 #Se le pasa a2,a1 y a0
 #se le pasa el vector y su dimension
la a0,V
addi a2,zero,2
addi a1,zero,15
jal cantidadPar #devuelve en a5 la cantidad par
addi a7,zero,10
ecall

cantidadPar:
#setea en 0 los contadores
ori t0,zero,0
ori a5,zero,0

do : 
#condiciones de corte
slt t6,t0,a1 #si t0<15 pone 1
beq t6,zero,fin #si t6 es 0 termina es decir t0 ya llego a 15

#leo del vector
lw t1,(a0)
#saco modulo
rem t2,t1,a2 #t2=t1 mod a2
#chequeo que sea par
bne t2,zero,finsi 
addi a5,a5,1
finsi:
addi a0,a0,4 #aumenta puntero a la proxima celda de V
addi t0,t0,1 #suma contador
j do
fin:  
ret