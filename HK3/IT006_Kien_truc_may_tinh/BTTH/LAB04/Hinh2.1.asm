.data
sumofex: 	.asciiz "(a - b) + (c - d) = "
exofsum:	.asciiz "(a + b) - (c + d) = "
enter:		.asciiz "\n"
.text
main:
	li $v0, 5
	syscall
	move $s0, $v0
	
	li $v0, 5
	syscall
	move $s1, $v0
	
	li $v0, 5
	syscall
	move $s2, $v0
	
	li $v0, 5
	syscall
	move $s3, $v0
	
	move $a0, $s0
	move $a1, $s1
	move $a2, $s2
	move $a3, $s3
	jal proc_example
	
	move $t0, $v0
	
	li $v0, 4
	la $a0, exofsum
	syscall
	
	move $a0, $t0
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, enter
	syscall
	
	li $v0, 4
	la $a0, sumofex
	syscall
	
	li $v0, 1
	move $a0, $v1
	syscall
	
	j exit
	
proc_example:
	add $t0, $a0, $a1
	add $t1, $a2, $a3
	sub $s0, $t0, $t1
	
	sub $t2, $a0, $a1
	sub $t3, $a2, $a3
	add $s1, $t2, $t3
	
	move $v0, $s0
	move $v1, $s1
	
	jr $ra	
	
exit:
