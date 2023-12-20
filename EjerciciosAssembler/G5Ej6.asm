.data
V: 1,2,3,4,5,6,7,8,9,10
.align 2
.text
la a0,V
addi a1,zero,10
jal invertirVectorPila
addi a7,zero,10
ecall 

invertirVectorPila:
addi t0,zero,0
addi t3,zero,4
mul t4,a1,t3 #t4=40
#addi t4,t4,-4
sub sp,sp,t4 #resto desplazamiento a la pila guardandome los valores a poner
pasarAPila: 
beq t0,a1,pasarAVector #mientras que t0 no llegue a 10
lw t1,(a0) #voy leyendo del vector 
sw t1,(sp) #voy guardando en la pila
addi sp,sp,4 #aumento la pila 
addi a0,a0,4 #aumento al vector
addi t0,t0,1 #aumento contador
j pasarAPila
pasarAVector: 
addi sp,sp,-4
hacer2:
#llego acá con el vector cargado en la pila
#a0 apunta al final del vector 
#sp apunta al final de la pila (apunta al que era el primer elemento del vector)
beq t0,zero,final
lw t1,(sp) #leo de la pila 
sw t1,(a0) #lo pongo al final del vector 
addi sp,sp,-4 #resto de la pila y el vector 
addi a0,a0,-4
addi t0,t0,-1 #resto contador
j hacer2
final:
ret

invertirVector:
#piso temporales
addi t3,zero,0
addi t2,zero,0
ori t0,zero,0
ori t2,zero,4
#puntero adelante a0
#puntero alfinal a2
mul t4,a1,t2 #multiplico contador por 4 para obtener desplazamiento
addi t4,t4,-4
add a2,t4,a0
do:
bge a0,a2,fin #mientras el puntero de adelante sea menor al del final ejecuta bucle
lw t1,(a0) #t1=primero
lw t3,(a2) #t3=ultimo
sw t1,(a2)
sw t3,(a0)
#aumento y resto punteros
addi a0,a0,4
addi a2,a2,-4
j do
fin:
ret
