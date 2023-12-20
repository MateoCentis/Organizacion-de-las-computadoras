.text
	#carga los siguientes valores en t0,t1 y t2
	ori t0,zero,0x476
	ori t1,zero,0x552
	ori t2,zero,0x22
	#lo que se esta haciendo aca es chequear por mayor y menor luego usando el beq
	
	#(set less than):si t1 es menor a t0 pone a t6 en 1, sino en 0
	
	#slt t6,t1,t0 #como es t1 es mayor va a poner a t6 en 0
	#(branch if equal): si t6 y zero son iguales va al label no1
	#beq t6,zero,no1 #como son iguales va a ir al label no1
	bge t1,t0,no1 #se reemplaza las dos lineas de arriba por bge que hace branch si t1>t0
	
	#slt t6,t2,t0 #va a poner a t6 en 1 ya que t2 es menor a t0
	#beq t6,zero,no2 #chequea que zero y t6 sean iguales pero no lo son 
	bge t2,t0,no2 #hace lo mismo que las dos lineas de arriba
	or a0,zero,t0 #copia t0 en a0
	j fin
no2:or a0,zero,t2 #copia t2 en a0
	j fin
	
no1:#slt t6,t2,t1 #pone a t6 en 1 porque t2 es menor a t1
	#beq t6,zero,no2 #pregunta si t6 es igual a zero pero da falso por lo tanto no va a no2
	bge t2,t1,no2 #reemplazo de nuevo con bge 
	or a0,zero,t1 #carga t1 en a0
fin:
	ori a7,x0,10 #al terminar le carga 10 a a7
	ecall