.text 
.globl main
main:
    # Prompt for the first number (t0)
    li $v0, 4
    la $a0, msg1
    syscall

    # Read the first number (t0)
    li $v0, 5
    syscall
    move $t0, $v0

    # Prompt for the second number (t1)
    li $v0, 4
    la $a0, msg2
    syscall

    # Read the second number (t1)
    li $v0, 5
    syscall
    move $t1, $v0

    # Perform bitwise AND
    and $t2, $t0, $t1

    # Print the result of the AND operation
    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    # Perform bitwise OR
    or $t3, $t0, $t1

    # Print the result of the OR operation
    li $v0, 4
    la $a0, msg4
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    # Perform bitwise NOT using nor with $zero
    nor $t4, $t0, $zero

    # Print the result of the NOT operation
    li $v0, 4
    la $a0, msg5
    syscall

    li $v0, 1
    move $a0, $t4
    syscall

    # Perform AND immediate operation
    andi $t2, $t0, 1

    # Perform OR immediate operation
    ori $t3, $t0, 1

    # Perform shift left operation (shifting by 2 --> multiply by 4)
    sll $t4, $t0, 2

    # Perform shift right operation (shifting by 2 --> divide by 4)
    srl $t5, $t0, 2

    # Print the result of the AND immediate operation
    li $v0, 4
    la $a0, msg6
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    # Print the result of the OR immediate operation
    li $v0, 4
    la $a0, msg7
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    # Print the result of the shift left operation
    li $v0, 4
    la $a0, msg8
    syscall

    li $v0, 1
    move $a0, $t4
    syscall

    # Print the result of the shift right operation
    li $v0, 4
    la $a0, msg9
    syscall

    li $v0, 1
    move $a0, $t5
    syscall

    # Exit
    li $v0, 10
    syscall

.data
msg1: .asciiz "\n Enter the first binary logic number:"
msg2: .asciiz "\n Enter the second binary logic number: "
msg3: .asciiz "\n The result of the AND operation is:  "
msg4: .asciiz "\n The result of the OR operation is:  "
msg5: .asciiz "\n The result of the NOT operation is:  "
msg6: .asciiz "\n The result of the AND immediate operation is:  "
msg7: .asciiz "\n The result of the OR immediate operation is:  "
msg8: .asciiz "\n The result of the shift left operation is:  "
msg9: .asciiz "\n The result of the shift right operation is:  "
