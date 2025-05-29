	.data
prompt:	.asciiz "Enter one number: "

	.text
main:	jal getInt
	move $s0, $v0
	j showInt
	
getInt:	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 5
	syscall
	jr $ra
	
showInt: 
	addi $s0, $s0, 1
	li $v0, 1
	move $a0, $s0
	syscall
	
exit: