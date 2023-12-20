.main
addi a0,zero,0x41 #carga del valor en a0
addi s0,zero,0x2
rem t0,a0,s0
beq t0,zero,par
impar:
addi s1,zero,0x20
j fin
par:
addi s1,zero,0x10
fin:
