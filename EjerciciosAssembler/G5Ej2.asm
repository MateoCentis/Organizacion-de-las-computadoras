.data 
valor1: .word 5
valor2: .word 9
.text
#se pasa por copia ya que le pasamos el valor con lw, si le pasariamos la direccion 
#en los registros, entonces seria por referencia
la a0,valor1 
la a1,valor2
jal intercambio #salto a intercambio
lw t2,(a0) #cargo los punteros en t2 y t3
lw t3,(a1)
sw t2,valor1,t6 #guardo t0 en valor1
sw t3,valor2,t6 #guardo t1 en valor2
li a7,10
ecall
intercambio:
#se cambian los punteros 
add t2,zero,a0 #auxiliar
add a0,zero,a1 #t0=t1
add a1,zero,t2 #t1=t2=t0
ret

