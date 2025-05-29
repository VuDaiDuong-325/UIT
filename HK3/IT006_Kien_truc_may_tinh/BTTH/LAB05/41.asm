addi $s0, $0, 6		#a
addi $s1, $0, 5		#b
sub $s2, $s0, $s1	#c = a - b
add $s3, $s0, $s1	#d = a + b

#Luu vao stack
addi $sp, $sp, -16
sw $s3, 0($sp)
sw $s2, 4($sp)
sw $s1, 8($sp)
sw $s0, 12($sp)