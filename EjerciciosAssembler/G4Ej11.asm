#dado un vector te devuelve la cantidad de ceros que contiene
.data
V: 1,2,3,0,5,6,0,8,0,10
.align 2
.text
la a0,V
addi s0,zero,10
#Pongo en cero ambos contadores
addi t0,zero,0
addi t1,zero,0
do: beq s0,t0,fin
lw a1,(a0)
bne a1,zero,distinto
addi t1,t1,1
distinto:
#aumento contador y puntero
addi t0,t0,1
addi a0,a0,4
j do
fin: