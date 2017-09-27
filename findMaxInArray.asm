# Find the maximum value in an array.

.data
array: .word 8, 2, 31, 81, 12, 10
size: .word 6
max: .word 0

.text
	main:

	start:
	lw $t3, size 
	la $t1, array 
	lw $s5, ($t1) 
	add $t1, $t1, 4 
	add $t3, $t3, -1 

	loop:
	lw $t4, ($t1) 

	ble $t4, $s5, L1
	addi $s5, $t4 0

	L1:
	add $t3, $t3, -1 
	addi $t1, $t1, 4 
	bnez $t3, loop 

	sw $s5, max
	lw $a0, max
	li $v0, 1
	syscall  

	li $v0, 10
	syscall