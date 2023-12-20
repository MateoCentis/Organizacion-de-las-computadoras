.main
lui t0,0x1234
#para poner en 0 los bits les haremos un and 
#0xFF9DF|FFF
lui t1,0xFF9E0 # 0xFF9DF + 1
addi t1,t1,-0x001 #FFF complemento a dos + 1
and t0,t0,t1 #al tener t1 0's en las ubicaciones pedidas, el and bitwise va a dar un 0 

#para setear en 1 los 4 menos significativos
lui t0,0x000
addi t0,zero,0xF #1111
or t1,t1,t0 #el or siempre va a dar 1 en las primeras 4 posiciones
