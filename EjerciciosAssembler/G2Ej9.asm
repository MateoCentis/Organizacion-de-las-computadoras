.text
#En los 3 primeros ori carga esos valores a los registros t0,t1 y t2
ori t0,zero,0x465 
ori t1,zero,0x0ff
ori t2,zero,0x123
#guarda en a0 el and entre t0 y t2
and a0,t0,t2
#guarda en a1 el and entre t1 y el valor pasado
andi a1,t1,0x35
#guarda en a2 el or entre t1 y t0
or a2,t1,t0
#guarda en a3 el or entre t1 y 1
ori a3,t1,1
#le suma 1 a t1 y guarda en a4
addi a4,t1,1
#hace xor a t0 consigo mismo y guarda en 5
xor a5,t0,t0
xori a6,t0,0x371
xori a7,a6,0x371
not s1,a0
