.main#Para que FUNQUE
#Por defecto las constantes (campo inmediato) estan en complemento a 2
lui s1,0x12345#	(0xFEEDA) le sumo 1 para balancear con el complemento a 2 de abajo
#porque el complemento empieza en 1 por lo tanto al hacer la extension con signo queda 
#con un 1 restado
addi s1,s1,0x678#(0x987) haces la diferencia de cada valor hexa a 15 y le sumo uno
#para sacar el complemento a dos. Y con el menos volvemos al valor original 
# (pasa si es mayor a 800)