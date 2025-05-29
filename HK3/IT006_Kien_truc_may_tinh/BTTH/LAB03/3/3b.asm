.data
i:	.asciiz "\nNhap i: "
j: 	.asciiz "Nhap j: "
arr:	.byte
size:	.byte
mang:	.asciiz "Nhap mang: "
mang_a:	.asciiz "Mang: "
phantu: .asciiz "Nhap so phan tu cua mang: "
space:	.asciiz " "
tran_i:	.asciiz "Gia tri i khong phu hop. Nhap lai i: "
value:	.asciiz "Gia tri A["
value_b:.asciiz "] = "
iout:	.asciiz " (i)"
jout: 	.asciiz " (j)"
mang_b:	.asciiz "\nMang sau khi cap nhat: "

.text
main:
	li $v0, 4
	la $a0, phantu
	syscall
	
	la $s3, arr
	lb $s2, size
	
	li $v0, 5
	syscall 			#nhap so phan tu
	move $s2, $v0
	
	li $v0, 4
	la $a0, mang
	syscall
	
	li $t0, 0
	
LOOP_in:
	beq $t0, $s2, EXIT_in
	add $t1, $t0, $s3
	
	li $v0, 5
	syscall				#Nhap phan tu mang
	sb $v0, 0($t1)
	
	addi $t0, $t0, 1
	j LOOP_in
	
EXIT_in:
	li $v0, 4
	la $a0, mang_a
	syscall

	li $t0, 0
	
LOOP_out:
	beq $t0, $s2, EXIT_out
	add $t1, $t0, $s3
	
	li $v0, 1
	lb $a0, 0($t1)
	syscall
	
	li $v0, 4
	la $a0, space
	syscall
	
	addi $t0, $t0, 1
	j LOOP_out
	
EXIT_out:
	li $v0, 4
	la $a0, i
	syscall
	
	li $v0, 5
	syscall				#Nhap i
	move $s0, $v0
	
	li $v0, 4
	la $a0, j
	syscall
	
	li $v0, 5
	syscall				#Nhap j
	move $s1, $v0
	
Check_i:	
	add $t0, $s2, -1
	bgt $s0, $t0, Recall_i	
	blt $s0, $0, Recall_i
	
	li $v0, 4
	la $a0, value
	syscall
	
	li $v0, 1
	move $a0, $s0
	syscall
	
	li $v0, 4
	la $a0, value_b
	syscall
	
	j LOOP_i

Recall_i:
	li $v0, 4
	la $a0, tran_i
	syscall
	
	li $v0, 5
	syscall				#Nhap i
	move $s0, $v0
	
	j Check_i
			
LOOP_i:	
	add $t0, $s0, $s3
	lb $t1, 0($t0)
	
	blt $s0, $s1, if		#i < j
	add $t1, $0, $s1
	j j_out	
	
if: 	add $t1, $0, $s0

i_out:	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 4
	la $a0, iout
	syscall
	
	j arr_b
	
j_out:	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 4
	la $a0, jout
	syscall
	
arr_b:	li $v0, 4
	la $a0, mang_b
	syscall
	
	add $t0, $s0, $s3
	sb $t1, 0($t0)
	
	li $t0, 0
	
LOOP_outb:
	beq $t0, $s2, EXIT_outb
	add $t1, $t0, $s3
	
	li $v0, 1
	lb $a0, 0($t1)
	syscall
	
	li $v0, 4
	la $a0, space
	syscall
	
	addi $t0, $t0, 1
	j LOOP_outb
	
EXIT_outb:
	
	
	
	
	
	
	
	
