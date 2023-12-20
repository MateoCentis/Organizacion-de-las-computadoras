.data 
valor: .word 0x805215c9
.text
		la s0,valor
		lhu a1,0(s0)
		lhu a2,2(s0)
		
#reemplazar lhu por lh

#En s0 se carga la direccion en memoria de valor
#luego se lee media palabra en forma unsigned de s0 y se la coloca en a1
