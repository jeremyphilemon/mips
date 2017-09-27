# Print the factorials of the first five natural numbers.

.data
    fact_message: .asciiz " factorial is: "
    nextline: .asciiz "\n"

.text
    main:
        move $t0 $zero
        li $t1 4
        li $t3 1

    loop:
        bge $t1 $t0 fact
        j end

    fact:
        move $t4 $t3
        beq $t4 1 ifOne
        addi $t5 $t4 -1
        LOOP:
            mul $t4 $t5 $t4
            addi $t5 $t5 -1
            bge $t5 1 LOOP

        ifOne:
            li $t5 1

        li $v0 1
        move $a0 $t3
        syscall

        li $v0 4
        la $a0 fact_message
        syscall

        li $v0 1
        move $a0 $t4
        syscall

        li $v0 4
        la $a0 nextline
        syscall

        addi $t0 $t0 1
        addi $t3 $t3 1

        j loop

    end:
        li $v0 10
        syscall