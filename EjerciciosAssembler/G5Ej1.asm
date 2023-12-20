#setea registros
ori a0,zero,12
ori a1,zero,7
ori a2,zero,35

#primero se corre el stack pointer y luego se almacena el dato
addi sp,sp,-12
sw a0,0(sp)
sw a1,4(sp)
sw a2,8(sp)

add a0,a1,a2 #a0=a1+a2
addi a1,a1,7 #a1+=7
addi a2,a2,-20 #a2-=20

lw a0,0(sp)
lw a1,4(sp)
lw a2,8(sp) 
addi sp,sp,12

addi a7,zero,10
ecall

#i)los cargados con ori
#ii)la direccion de la pila -12, no sé modifican
#iii)Se almacenan en los valores de la pila respectivamente
#iv)Los valores pisados por las operaciones
#v) se modifican los valores porque los leemos de la pila
#y tienen los valores originales
#vi) se hacen los cambios tal que se avanz 12 posiciones