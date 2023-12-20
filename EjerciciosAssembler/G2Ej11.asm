.main
#multiplica por 17 un número que esta en a0 sin mul y otro que multiplique por 24
#Poner los resultados en a1

addi t0,zero,5
#Multiplico por 16 y luego le sumo uno más para multiplicar por 17
slli a1,t0,4 #multiplico por 16
add a1,t0,a1 #sumo uno

#multiplico por 32 y luego le resto por 8
slli a1,t0,5 #esto es por 16
slli a2,t0,3 #esto es por 8
sub a1,a1,a2 #resto