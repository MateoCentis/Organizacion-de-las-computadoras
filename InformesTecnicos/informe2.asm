.data

# Configuramos todos los registros de control en memorias
RCxREG: .byte 0 # Recepcion de datos
TXxREG: .byte 0 # Transmision de datos
SPxBRGH: .byte 0 # Baud Rate Generator Parte alta
SPxBRGL: .byte 0 # Baud Rate Generator Parte baja
TXxSTA: .byte 0 # Registro de control de transmision de datos
RCxSTA: .byte 0 # Registro de control de recivo de datos
BAUDxCON:.byte 0 # Registro de control para configurar el baud rate

ACKNOWLEDGE: .asciz "$PMTK001,604,3*32"
	.align 0
SELECT_DATO: .asciz "$PMTK314,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0*29"
	.align 0
CHECK_GPGLL: .asciz "$GPGLL,"
	.align 0

.text

#Configuramos el registro de control de transmision
la a1, TXxSTA
andi a2, 0x80# 10000000b #valor a configurar  #acordate de setear BRGh a 0 (low speed baud rate) 
sb a2, (a1)

#Configuramos el registro de control de recepcion
la a1, RCxREG
andi a2, 0x0#valor a configurar 
sb a2, (a1)


# Calculamos el baud rate por default, luego debemos calcular el baud rate aumentado
# El baud rate por default es 9600, trabajamos en modo 8 bits, asincrono, sin high baud rate activado
# Suponiendo una frecuencia de oscilacion de 18.432 MHz, necesitamos a SPBRG con un valor de 29
la a1, BAUDxCON
andi a2, # 0001000b Solo activamos el bit de clock en rising edge
sb a2, (a1)

la a1, SPxBRGL 
addi a2, zero, 29
sb a2, (a1)

la a1, SPxBRGH 
add a2, zero, zero
sb a2, (a1)

# Habilitamos el registro de transmision
la a1, TXxREG
lb a0, (a1)
ori a0, a0, 0x8 # 00001000
sb a0, (a1)

# Habilitamos el registro de recepcion
la a1, RCxREG
lb a0, (a1)
ori a0, a0, 0x90 # 10010000
sb a0, (a1)

# Hacemos un comando acknowledge para responder el comando PMTK000 Test del GPS
# Para recibir el comando Test se utiliza el codigo que se detalla en recepcion de datos para leer datos
# del registro RCxSTA. 
la a0, ACKNOWLEDGE
bucleAck:
	lb a1, (a0)
	beq a1, zero, finBucleAck
  slli a1,a1,1 # agrego el bit de parada
	sb a1, TXxREG
	# Se espera a que se reciba el dato
	addi a0, a0, 4
	j bucleAck
finBucleAck:

# Seleccionamos el tipo de dato
la a0, SELECT_DATO
selectDato:
	lb a1, (a0)
	beq a1, zero, finBucleSelect
  slli a1,a1,1 # agrego el bit de parada
	sb a1, TXxREG
	# Se espera a que se reciba el dato
	addi a0, a0, 4
	j selectDato
finBucleSelect:

 

# Aqui comenzamos a recibir los datos
# Primero se realiza la comprobacion del dato
# Tenemos 1 bit de parada por cada caracter recibido
# Ademas el registro s10 lo utilizamos para guardar la suma total de caracteres para el checksum 

iniciarComprobarDatos:
  la t0,GPGLL # cargo direccion datos a comparar
  la t1,RCxREG # cargo la direccion del puerto de recepcion
  add s10, zero, zero # Pongo en zero el contador del checksum

comprobarDatos:
  lb t3, (t0)  # guardo el dato a comparar
  beq t3, zero, recibirDatos # si termino la cadena a $GPGLL, comienzo a recibir los datos

  lw t2, (t1) # guardo el dato del puerto
  srli t2,t2,1 # saco el bit de parada
  bne t3,t2, iniciarComprobarDatos # Si son distintos, vuelvo a empezar

  add s10,s10, t2 # sumo para el checksum

  addi t0, t0, 1 # sumo 1 byte al puntero

  j comprobarDatos 

recibirDatos:
  # Luego de haber comprobado los datos, prodemos a aumentar el baud rate
  # Se requiere un baud rate de 19200. Por lo tanto el nuevo divisor debe ser 14. 
  la a1, SPxBRGL 
  addi a2, zero, 14
  sb a2, (a1)

  # Luego de aumentar el badu rate, empezamos a recibir los datos
  lb t3, 42  # guardo el caracter * que indica inicio del checksum
  lw t0, 0x112000 # lugar de memoria donde se guardan los datos

recibirDatosBucle: 

  lw t2, (t1) # guardo el dato del puerto
  srli t2,t2,1 # saco el bit de parada
  beq t3, t2, checksumDatos # si encuentro *, comienzo el checksum

  sb t2, (t0) #Guardo el dato recibido

  add s10,s10, t2 # sumo para el checksum

  addi t0, t0, 1 # sumo 1 byte al puntero

  j recibirDatosBucle

checksumDatos:
  lw s1, (t1) # parte baja checksum
  srli s1,s1,1 # saco el bit de parada
  lw s2, (t1) # parte alta checksum
  srli s2,s2,1 # saco el bit de parada
  slli s2,s2,4 # corro 4 bits a la izquierda la parte alta
  add s3, s2, s1 # sumo parte alta y baja
  beq s3, s10, datosCorrectos # si ambos datos son iguales, el dato esta correcto y se lo utiliza
  # sino se lo descarta

datosCorrectos:
  ecall

datosIncorrectos:
  ecall


