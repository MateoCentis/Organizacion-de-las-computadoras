.main
#a va a ser t0
#b va a ser t1
#c va a ser t2
#d va a ser t3
#e va a ser t4
#a=b
add t0,zero,zero #pongo a t0 en cero
add t0,t0,t1 #copio t1 en t0 t0=t1
#a=b+c
add t2,t0,t1 #t2=t0+t1
#a=a+1
addi t0,t0,1
#a=c+2
addi t0,t2,2
#a=b+c+d+e
add t0,t1,t2 #t0=t1+t2
add t0,t0,t3 #t0=t0+t3
add t0,t0,t4 #t0=t0+t4
#a=e-c
sub t0,t4,t2
#a=c+(b-d)
sub t5,t1,t3 #t5=t1-t3
add t0,t2,t5 #t0=t2+t5
#a=(b+c)-(d+e)
add t5,t1,t2 #t5=t1+t2
add t6,t3,t4 #t6=t3+t4
sub t0,t5,t6
#a=b*c
mul t0,t1,t2
#a=b/c
div t0,t1,t2
#a=3*e
add t0,t0,t4
add t0,t0,t4
add t0,t0,t4
#a=(b-c)*(d-e)
sub t5,t1,t2
sub t6,t3,t4
mul t0,t5,t6
#a=b*c*d
mul t5,t2,t3
mul t0,t5,t1
#a=(b+c)*(d/e)
add t5,t1,t2
div t6,t3,t4
mul t0,t5,t6