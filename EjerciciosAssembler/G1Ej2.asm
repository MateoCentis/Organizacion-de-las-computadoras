.text
	lui a1,0x10010 #Carga en el registro a1 la direccion de memoria pasada en hexa
	lw t0,0(a1) #Guarda en el registro pasado el valor almacenado en la direccion de memoria
				#pasada
	lw t1,4(a1) 
	lw t2,8(a1)
	lw s0,12(a1)

#Cargar registros para probar las lecturas