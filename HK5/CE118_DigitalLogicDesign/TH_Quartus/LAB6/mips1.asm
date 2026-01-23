
addi $1, $0, 1 
addi $2, $0, 2 
addi $3, $0, 3 
sll $4, $2, 2 
add $5, $2, $3 
ori $6, $4, 2  
nor $7, $2, $5  
addi $6, $5, -3 
or $0, $0, $7 
sub $0, $7, $1 
srl $7, $7, 3 
sw $4, 4($0) 
lw $3, 4($0) 
and $1, $0, $7 
bne $7, $3, next 
addi $1, $0, 7 
addi $2, $0, 8 
addi $3, $0, 9 
next: 
addi $4, $0, 10 
beq $4, $5, next2 
addi $5, $0, 11 
addi $6, $0, 12 
next2: 
addi $7, $0, 13 
addi $7, $0, 14 