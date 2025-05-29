.data	
array1:	.word 	5, 6, 7, 8, 1, 2, 3, 9, 10, 4
size1:	.word 10

array2: .byte	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
size2:	.word 16

array3: .space	8
size3:	.word 8	

mang1: 	.asciiz "Mang 1: "
mang2: 	.asciiz "Mang 2: "
mang3: 	.asciiz "Mang 3: "
enter: 	.asciiz "\n"
space:	.asciiz " "
arr_f: 	.asciiz "1: Mang 1\n2: Mang 2\n3: Mang 3\nMang can tim: "
pos_f:	.asciiz "Vi tri can lay: "
phantu: .asciiz "Phan tu can tim: "
arr_out:	.asciiz "Mang can tim khong phu hop. Vui long nhap lai mang: "
pos_out: 	.asciiz "Vi tri can tim khong phu hop. Vui long nhap lai vi tri: "
pos_cf:	.asciiz " ("
pos_cb:	.asciiz ") "
.text

main:	#Mang 1
	li $v0, 4
	la $a0, mang1
	syscall
	
	li $t0, 0
	la $s0, array1		#Luu dia chi array1 vao $s0
	lb $s1, size1		#Luu byte size1 vao $s1
	subi $s1, $s1, 1 
	
LOOP1:	bgt $t0, $s1, EXIT1	#i chay [0; size1 - 1]

	sll $t1, $t0, 2
	add $t2, $t1, $s0
	lw $t3, 0($t2)		#$t3 = array1[i]
	
	li $v0, 1
	move $a0, $t3
	syscall
	
	li $v0, 4
	la $a0, space
	syscall
	
	addi $t0, $t0, 1
	j LOOP1

EXIT1:	#Mang 2
	li $v0, 4
	la $a0, enter
	syscall
	
	li $v0, 4
	la $a0, mang2
	syscall
	
	li $t0, 0
	la $s2, array2		
	lb $s3, size2
	subi $s3, $s3, 1
	
LOOP2:	bgt $t0, $s3, EXIT2

	add $t1, $t0, $s2			#La byte thi khong dich byte
	lb $t2, 0($t1)
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 4
	la $a0, space
	syscall
	
	addi $t0, $t0, 1
	j LOOP2
	
EXIT2:	#Mang 3
	li $v0, 4
	la $a0, enter
	syscall
	
	li $v0, 4
	la $a0, mang3
	syscall
	
	li $t0, 0
	la $s4, array3		
	lb $s5, size3
	subi $s5, $s5, 1
	
LOOP3:	bgt $t0, $s5, EXIT3

	add $t1, $t0, $s2
	lb $t2, 0($t1)			#array2[i]
	
	sub $s6, $s3, $t0
	add $t3, $s6, $s2
	lb $t4, 0($t3)			#array2[size2 - 1 - i]
	
	add $t5, $t2, $t4		#array3[i] = array2[i] + array2[size2 - 1 - i]
	
	add $t6, $t0, $s4
	sb $t5, 0($t6)
	
	li $v0, 1
	move $a0, $t5
	syscall
	
	li $v0, 4
	la $a0, space
	syscall
	
	addi $t0, $t0, 1
	j LOOP3
	
EXIT3:
	li $v0, 4
	la $a0, enter
	syscall
	
	li $v0, 4
	la $a0, arr_f
	syscall
	
	li $v0, 5
	syscall
	
	move $t6, $v0			#Mang can lay
	
	li $v0, 4
	la $a0, pos_f
	syscall
	
	li $v0, 5
	syscall
	
	move $t7, $v0			#Vi tri can lay
	
	
	#Xet mang
Mang:	beq $t6, 1, Mang1
	beq $t6, 2, Mang2
	beq $t6, 3, Mang3
	j Mang_out
	
Mang1:	blt $t7, 0, Vitri_out
	bgt $t7, $s1, Vitri_out
	sll $t5, $t7, 2			#Dich byte vi tri can tim
	add $t5, $t5, $s0
	lw $t4, 0($t5)
	
	li $v0, 4
	la $a0, phantu
	syscall
	
	li $v0, 1
	move $a0, $t4
	syscall
	
	j END
	
Mang2:	blt $t7, 0, Vitri_out
	bgt $t7, $s3, Vitri_out
	add $t6, $t7, $s2
	lb $t5, 0($t6)
	
	li $v0, 4
	la $a0, phantu
	syscall
	
	li $v0, 1
	move $a0, $t5
	syscall
	
	j END

Mang3:	blt $t7, 0, Vitri_out
	bgt $t7, $s5, Vitri_out
	add $t6, $t7, $s4
	lb $t5, 0($t6)
	
	li $v0, 4
	la $a0, phantu
	syscall
	
	li $v0, 1
	move $a0, $t5
	syscall
	
	li $v0, 4
	la $a0, pos_cf
	syscall 
	
	li $v0, 1
	move $a0, $t7
	syscall
	
	li $v0, 4
	la $a0, pos_cb
	syscall
	
	j END
	
Mang_out:	li $v0, 4
		la $a0, arr_out
		syscall
		
		li $v0, 5
		syscall
		move $t6, $v0
		
		j Mang
		
Vitri_out:	li $v0, 4
		la $a0, pos_out
		syscall
		
		li $v0, 5
		syscall
		move $t7, $v0
		
		beq $t6, 1, Mang1
		beq $t6, 2, Mang2
		j Mang3
		
END:
	
	
