.data #programa que multiplica por 8 un vector
V: -1,2,3,4,5,6,7,8,9,10
.align 2
.text
la a0,V
do: slti t6,t5,10
beq t6,zero,fin
lw t0,(a0)	
slli t1,t0,3
sw t1,(a0)
addi a0,a0,4
addi t5,t5,1
j do
fin:
