.data
	#存储n的值
	variable: .word 20
	
.text
MAIN:
	#将n存储在a0
	lui t0,0x00002
	lw a0,0(t0)
	#s6存储当前算到第几个斐波那契数，初始值为2
	addi s6,zero,2
	#s10 s11存储f(n-1) f(n-2)
	addi s10,zero,1
	addi s11,zero,1
LOOP:
	#如果s6达到了20，则结束
	beq s6,a0,OVER
	#否则进行一次运算
	jal ra,FIB
	#s6++
	addi s6,s6,1
	jal zero,LOOP

OVER:	
	#将结果保存在s3
	addi s3,s9,0
	#进入死循环
	auipc ra,0
	jalr zero,ra,4
	
################
#利用s9，s10，s11计算斐波那契数
################
FIB:
	add s9,s10,s11
	addi s11,s10,0
	addi s10,s9,0
	jalr zero,ra,0
	
