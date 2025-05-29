	.text
	.globl main
main:
	li $v0, 4
	la $a0, prompt1
	syscall				# in prompt1

	li $v0, 5
	syscall

	move $s0, $v0			# nhap n
	
	li $t7, 1			# i = 1
	
	li $v0, 4
	la $a0, prompt2
	syscall				# in prompt2
	
loop:					# in fibo tu 1 -> n
	bgt $t7, $s0, exit		# i > n => break
	move $a0, $t7
	jal fibonacci			
	
	move $t0, $v0
	
	li $v0, 1
	move $a0, $t0
	syscall				# in kq fibo

	li $v0, 4
	la $a0, space 
	syscall				# in space

	addi $t7, $t7, 1		# tang i
	j loop				# lap

	.data
prompt1:
	.asciiz "Enter a value: "
prompt2:
	.asciiz "Fibonacci: "
space: 	
	.asciiz " "
	.text
	.globl fibonacci
fibonacci:
	addi $sp, $sp, -12
	sw $ra, 8($sp)
	sw $a0, 4($sp)			# Luu vao stack 

	slti $t0, $a0, 1
	beq $t0, $zero, L1 		# i >= 1 -> L1
	li $v0, 0			# i < 1 -> fibo(n) = 0
	addi $sp, $sp, 12		
	jr $ra
L1:
	slti $t0, $a0, 2
	beq $t0, $zero, L2		# i >= 2 -> L2
	li $v0, 1			# i < 2 -> fibo(n) = 1
	addi $sp, $sp, 12
	jr $ra
L2:
	addi $a0, $a0, -1		# fibo(n - 1)
	jal fibonacci
	sw $v0, 0($sp)			# Luu fibo(n - 1) vao thanh ghi
	lw $a0, 4($sp)			# Lay n ra khoi stack
	addi $a0, $a0, -2		# fibo(n - 2)
	jal fibonacci
	lw $t0, 0($sp)			# Lay fibo(n - 2) 
	add $v0, $v0, $t0		# fibo(n) = fibo(n - 1) + fibo(n - 2)

	lw $a0, 4($sp)			# Lay n
	lw $ra, 8($sp)			# Lay $ra
	addi $sp, $sp, 12		# Tra ve $sp
	jr $ra
	
exit:
