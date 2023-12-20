.data
V: 1,2,3
.align 2
.text
#paso por referencia un puntero al vector y su tamaño
la a0,V
addi a1,zero,3
jal promedioVector
addi a7,zero,10
ecall

promedioVector:
#contador y sumador en 0
ori t0,zero,0 
ori t2,zero,0
do:
beq t0,a1,fin #si t0==a1
lw t1,(a0) #leo del vector
add t2,t2,t1 #t2+=t1
#aumento contador y puntero
addi t0,t0,1
addi a0,a0,4
j do
fin:
#guardo el cociente en s1 y el resto en s2
div s1,t2,a1
rem s2,t2,a1
ret