.data
	variable: .word 200110631	
.text
MAIN:
	#存储十进制数到a0中；副本保存在s2
	lui t0,0x00002
	lw,a0,0(t0)
	addi s2,a0,0
	addi s10,zero,0
	#是否完成除法的标志 为s11 否为0 是为1
	addi s11,zero,0
	#s4保存进制数字16
	addi s4,zero,16
Loop:	
	#s2是0，说明除法已经做完，跳转到OVER
	beq s2,zero,OVER
	#否则，执行DIVIDE
	jal ra,DIVIDE
	#然后，返回Loop
	jal zero,Loop
OVER:
	#将结果保存在s3
	addi s3,s8,0	
	#进入死循环
	auipc ra,0
	jalr zero,ra,4
	
###
#一次除法运算
#s2存储每次的被除数；s9存储每次的余数；s8保存前序结果；s10存储要左移的位数
###
DIVIDE:
	rem s9,s2,s4
	div s2,s2,s4

	sll s9,s9,s10	#将s9左移
	add s8,s8,s9	#将当前数值相加并保存在s8
	addi s10,s10,4

	jalr zero,ra,0	#子函数执行结束