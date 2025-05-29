.data
str1: .asciiz "Chuoi 1: Chao ban! Ban la sinh vien nam thu nay?\n"
str2: .asciiz "Chuoi 2: Hihi, minh la sinh vien nam thu 1 ^-^\n"
input_prompt: .asciiz "Nhap vao mot chuoi: "
input_buffer: .space 100
output_buffer: .space 100

.text
main:
	li $v0, 4
	la $a0, str1
	syscall
	
	li $v0, 4
	la $a0, str2
	syscall