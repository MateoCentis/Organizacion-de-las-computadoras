.main
#a)t1<5
ori t0,zero,0x5
slt t6,t1,t0
bne t6,zero,no1
#b)t1==5 && t2==t3
beq t1,t0,entonces
entonces: beq t2,t3,res
#c)t1!=t2 || t1!=t3
bne t1,t2,res
bne t1,t3,res
#d)t1>6
bge t1,t0,res
#e)t1>10 && t1<30
ori t0,zero,0x11
bge t1,t0,luego
luego: ori t0,zero,0x30
	   slt t6,t1,t0 #t1<30
	   bne t6,zero,no1
res:
