.data
n:	.asciiz "Nhap n: "
mang:	.asciiz "Nhap mang: "
danhap:	.asciiz "Mang da nhap: "
kcmax:	.asciiz "Khoang cach lon nhat: "
phantu:	.asciiz "Phan tu xuat hien nhieu nhat trong mang: "
space:	.asciiz " "
enter: 	.asciiz "\n"
arr: .space 100

.text
main:	#1
	li $v0, 4
	la $a0, n
	syscall
	
	li $v0, 5
	syscall
	
	move $s0, $v0		#nhap n
	
	li $v0, 4
	la $a0, mang
	syscall
	
	la $s1, arr
	li $t0, 0
	
NHAP:
	beq $t0, $s0, END_NHAP
	
	add $t1, $t0, $s1
	
	li $v0, 5
	syscall 
	
	sb $v0, 0($t1)
	
	addi $t0, $t0, 1
	j NHAP
	
END_NHAP:
	li $v0, 4
	la $a0, danhap
	syscall
	
	li $t0, 0
	
XUAT:
	beq $t0, $s0, END_XUAT
	
	add $t1, $t0, $s1
	lb $t2, 0($t1)
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 4
	la $a0, space
	syscall
	
	addi $t0, $t0, 1
	j XUAT
	
END_XUAT: # 2
	li $v0, 4
	la $a0, enter
	syscall 
	
	li $t0, 0
	add $t1, $t0, $s1
	lb $t2, 0($t1)			# arr[0]
	
	move $a0, $t2			# max = arr[0]
	move $a1, $t2			# min = arr[0]
	
	li $t0, 1		# i = 1
	
KC:	
	beq $t0, $s0, END_KC
	
	add $t1, $t0, $s1
	lb $t2, 0($t1)			# arr[i]
	
	blt $a0, $t2, MAX
	bgt $a1, $t2, MIN
	
cont:	addi $t0, $t0, 1
	j KC
	
MAX:	move $a0, $t2
	j cont

MIN:	move $a1, $t2
	j cont
	
END_KC:
	sub $t0, $a0, $a1
	
	li $v0, 4
	la $a0, kcmax
	syscall 
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 4
	la $a0, enter
	syscall
	
	#3
	
	la $a0, phantu
	syscall
	
	li $t0, 0
	add $t1, $t0, $s1
	lb $t2, 0($t1)			#arr[0]
	
	li $t5, 0			# j = 0
	li $t6, 0			# app = 0
	
AP0:
	beq $t5, $s0, END_AP0
	
	add $t1, $t5, $s1
	lb $t4, 0($t1)			# arr[j]
	
	bne $t2, $t4, p0		# arr[i] # arr[j]
	addi $t6, $t6, 1
	
p0:	addi $t5, $t5, 1
	j AP0
	
END_AP0: 
	move $s2, $t2			# gia tri app 
	move $s3, $t6			# so lan app 

	li $t0, 1

LOOP:
	beq $t0, $s0, END_LOOP
	
	add $t1, $t0, $s1
	lb $t2, 0($t1)			#arr[i]
	
	li $t5, 0			# j = 0
	li $t6, 0			# app = 0
	
AP:	
	beq $t5, $s0, END_AP
	
	add $t1, $t5, $s1
	lb $t4, 0($t1)			# arr[j]
	
	bne $t2, $t4, pl		# arr[i] # arr[j]
	addi $t6, $t6, 1
	
pl:	addi $t5, $t5, 1
	j AP
	
END_AP: 
	blt $s3, $t6, gan
	
tt:	
	addi $t0, $t0, 1
	j LOOP
	
gan:
	move $s2, $t2
	move $s3, $t6
	j tt
	
END_LOOP:
	li $v0, 1
	move $a0, $s2
	syscall
	
	
	
	
	
	