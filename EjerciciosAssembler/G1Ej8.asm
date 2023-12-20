.data 
valor: .word 0xabcd0000
.text
	la s0,valor #Me guardo direccion en memoria del label
	lui t0,0x1234#cargo el segundo valor en un contenedor
	sw t0,4(s0) #Escribo ese valor en memoria
	#para cambiar valores (ej9)
	#Primero se guardan en registro los valores de memoria
	lw t1,0(s0)
	lw t2,4(s0)
	#Luego se reemplazan de forma al reves para intercambiarlos
	sw t2,0(s0)
	sw t1,4(s0)