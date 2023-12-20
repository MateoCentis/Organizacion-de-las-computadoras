.data
dato1: .word 10
dato2: .word 0
res: .space 4
.text
#carga en s8 y s9 el dato1 y dato2
	lw s8,dato1
	lw s9,dato2
#pone en 0 a t0 y t1
	and t0,t0,zero
	and t1,t1,zero
#si s8>=s9 voy a salto
	bge s8,s9,salto
#pongo t1 en 1
	ori t1,t1,1
salto: or t0,t0,t1 #no cambia
	sw t0,res,t6 #pone res en la tercera casilla de memoria con el valor de t0
	#en el caso de a) pone en 0
	#en el caso de b) pone en 1
	#en el caso de c) pone en 0
	#e) se hace un >=
	nop
	nop