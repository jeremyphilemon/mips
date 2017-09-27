# Find the sum of array[n].

.data
    input_n: .asciiz "Enter n: "
    input_int: .asciiz "Enter integer: "
    sum_prompt: .asciiz "The sum is: "
    array: .space 400

.text
    main:
        li $v0 4
        la $a0 input_n
        syscall

        li $v0 5
        syscall
        move $t0 $v0

        sll $a0 $v0 2
        li $v0 9
        syscall

        move $t1 $zero
        move $t2 $v0
        move $t3 $zero

    loop:
        bge $t1 $t0 end

        li $v0 4
        la $a0 input_int
        syscall

        li $v0 5
        syscall
        sw $v0 0($t2)

        add $t3 $t3 $v0

        addi $t1 $t1 1
        addi $t2 $t2 4

        j loop

    end:
        li $v0 4
        la $a0 sum_prompt
        syscall

        li $v0 1
        move $a0 $t3
        syscall

        li $v0 10
        syscall