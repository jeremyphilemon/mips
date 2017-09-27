# Find the sevent element of the golden ratio series.

.text
    main:
        li $t0 1
        li $t1 1
        li $t2 2
        li $t7 4

    loop:
        bge $t7 $t0 goldenRatio
        j end

    goldenRatio:
        move $t4 $t2
        add $t2 $t1 $t2
        move $t1 $t4
        addi $t0 $t0 1
        j loop

    ifOne:
        li $t5 1

    end:
        li $v0 1
        move $a0 $t2
        syscall

        li $v0 10
        syscall