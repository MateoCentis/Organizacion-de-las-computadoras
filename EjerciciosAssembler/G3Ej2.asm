.text 
#a)t1==t2
beq t1,t2,no1
#b)t1<=t2 ==> t2>t1
slt t0,t2,t1 #pongo t0 en 1 si t1>t2, sino en 0
beq t0,zero,no1 #si t1 no era mayor a t2, es decir, t1<=t2 va a no1
#c)t1>=t2
bge t1,t2,no1
#d)t1 != t2
bne t1,t2,no1
#e)t1 < t2
slt t0,t1,t2
bne t0,zero,no1
#d)t1>t2
slt t0,t2,t1
beq t0,zero,no1



