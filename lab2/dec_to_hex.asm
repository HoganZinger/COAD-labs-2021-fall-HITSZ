.data
	variable: .word 200110631	
.text
MAIN:
	#�洢ʮ��������a0�У�����������s2
	lui t0,0x00002
	lw,a0,0(t0)
	addi s2,a0,0
	addi s10,zero,0
	#�Ƿ���ɳ����ı�־ Ϊs11 ��Ϊ0 ��Ϊ1
	addi s11,zero,0
	#s4�����������16
	addi s4,zero,16
Loop:	
	#s2��0��˵�������Ѿ����꣬��ת��OVER
	beq s2,zero,OVER
	#����ִ��DIVIDE
	jal ra,DIVIDE
	#Ȼ�󣬷���Loop
	jal zero,Loop
OVER:
	#�����������s3
	addi s3,s8,0	
	#������ѭ��
	auipc ra,0
	jalr zero,ra,4
	
###
#һ�γ�������
#s2�洢ÿ�εı�������s9�洢ÿ�ε�������s8����ǰ������s10�洢Ҫ���Ƶ�λ��
###
DIVIDE:
	rem s9,s2,s4
	div s2,s2,s4

	sll s9,s9,s10	#��s9����
	add s8,s8,s9	#����ǰ��ֵ��Ӳ�������s8
	addi s10,s10,4

	jalr zero,ra,0	#�Ӻ���ִ�н���