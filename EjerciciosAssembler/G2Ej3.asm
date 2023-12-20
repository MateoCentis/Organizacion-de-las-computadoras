.text
#li a0,0x111117ff
#li a1,0x11111cab
#compararlo con 
#lui a0,0x11111
#ori a0,a0,0x7ff    #Funciona bien, or hace or bitwise con los 0's 
#lui a1,0x11112
#ori a1,a1,-0x355 # complemento a dos sumado uno restado
#otro
#lui a0,0x11111
#addi a0,a0,0x7ff
#lui a1,0x11112
#addi a1,a1,-0x355 #complemento a dos sumado uno restado