.text
#carga en t0 el valor 476
ori t0,zero,476 
#carga en t1 el valor 0xFF
ori t1,zero,0xFF
#carga en t2 1
lui t2,1
#carga en t3 4
ori t3,zero,4
#carga en t4 0xC3010
lui t4,0xC3010
#hace shift logico izquierdo de 16 bits a t0 y lo guarda en s0
slli s0,t0,16
#hace shift aritmetico derecho de 1 bit a t1 y lo guarda en s1
srai s1,t1,1
#hace shift logico derecho a t4 con los primeros 5 bits de t3 lo guarda en s2
srl s2,t4,t3
#hace shift logico derecho a t4 con los primeros 5 bits de t3 lo guarda en s3
sra s3,t4,t3
#hace shift logico izquierdo de 1 bit a t3 y lo guarda en t4
slli s4,t3,1
#s4=s4+t3
add s4,s4,t3
##hace shift logico izquierdo a t0 con los primeros 5 bits de s4 lo guarda en s5
sll s5,t0,s4
