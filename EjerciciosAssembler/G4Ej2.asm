.main
#multiplicar el valor de t1 por 61 y dejar el resultado en a0
addi t1,zero,0x50
#por desplazamientos
slli t2,t1,6 #multiplico por 64 t2=(a*64)
slli t3,t1,1 #multiplico por 2  t3=(a*2)
sub t4,t2,t3 #t4=t2-t3=64a-2a=62a
sub a0,t4,t1 #a0=t4-t1=62a-a=61a.

#a) con ciclos. a0 = 61*t1
 addi t1,zero,36 # inicializo un valor t1=36
 addi t2,zero,61 # inicializo 61  t2=61
 addi t3,zero,1 # inicializo 1 t3=1
 
do: add a0,a0,t1 # acumulo 36 a0+=t1 (como hay que multiplicar sumo por cada iteracion)
 sub t2,t2,t3 # dec 61 t2-=t3 (voy restando de la cant. que quiero multiplicar 1)
 bne t2,zero,do # Mientras t2!=0 (hasta llegar a 0)
fin: 