.data#Identifica elementos que estaran en segmento de datos
valor: .word 0 #Indica que referenciamos una palabra (4 bytes)
.text
	#Se carga en el registro los siguientes valores
	lui x5,0x12345
	lui t1,0x345
	lui t2,0x5
	
	sw t0,valor,t6 #escribe en la direccion de memoria del label el valor de t0 usando t6 como un temporal
	
	la a7,valor
	sw t1,4(a7)
	sw t2,8(a7)
	
#c)Intervienen en las operaciones los registros: t0,t1,t2,a7
#d)antes de ejectuar el programa estaba en 0, luego termino en 0x100100c.
#e)se almacenaron los valores de t0,t1 y t2 en las direcciones desde el 0 hacia delante.
#f y g)si se cambia t0 por x5 no pasa nada
