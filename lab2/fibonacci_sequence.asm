.data
	#�洢n��ֵ
	variable: .word 20
	
.text
MAIN:
	#��n�洢��a0
	lui t0,0x00002
	lw a0,0(t0)
	#s6�洢��ǰ�㵽�ڼ���쳲�����������ʼֵΪ2
	addi s6,zero,2
	#s10 s11�洢f(n-1) f(n-2)
	addi s10,zero,1
	addi s11,zero,1
LOOP:
	#���s6�ﵽ��20�������
	beq s6,a0,OVER
	#�������һ������
	jal ra,FIB
	#s6++
	addi s6,s6,1
	jal zero,LOOP

OVER:	
	#�����������s3
	addi s3,s9,0
	#������ѭ��
	auipc ra,0
	jalr zero,ra,4
	
################
#����s9��s10��s11����쳲�������
################
FIB:
	add s9,s10,s11
	addi s11,s10,0
	addi s10,s9,0
	jalr zero,ra,0
	
