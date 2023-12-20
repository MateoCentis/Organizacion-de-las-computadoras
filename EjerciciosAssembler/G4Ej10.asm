#programa que de un vector de 30 palabras acumula en a0 aquellos que estan comprendidos entre 0x100 y 0x200
.data
V: 1,101,300,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,101,180,119,25,26,27,28,29,30
.align 2
.text
la a0,V #puntero que apunta a V1
addi t0,zero,0 #contador en 0
addi t5,zero,100 #valor menor
addi t6,zero,200 #valor mayor
do: slti t2,t0,30 #condiciones de corte por iteraciones
beq t2,zero,fin
lw a1,(a0)
bge a1,t6,menor
ble a1,t5,menor
add s1,s1,a1
menor:
addi a0,a0,4 #aumento puntero
addi t0,t0,1 #aumento contador
j do

fin: