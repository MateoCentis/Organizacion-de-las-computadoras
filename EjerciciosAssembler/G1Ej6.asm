.data
valor: .word 0x805215C9
.text
	la s0,valor
	lb a1,0(s0)
	lb a2,1(s0)
	lb a3,2(s0)
	lb a4,3(s0)

#para escribirlo de la otra forma reemplazar lbu por lb
#a)