.data
    prompt: .asciiz "Enter a number: "
    even_msg: .asciiz "The number is even.\n"
    odd_msg: .asciiz "The number is odd.\n"

.text
.globl main

main:
    # Display prompt
    li $v0, 4
    la $a0, prompt
    syscall

    # Read input number
    li $v0, 5
    syscall
    move $t0, $v0  # Store input number in $t0

    # Divide the number by 2 to find the remainder
    li $t1, 2
    divu $t0, $t1
    mfhi $t2  # $t2 contains the remainder (0 for even, 1 for odd)

    # Compute message address based on remainder
    # Offset between messages
    li $t3, 20  # Length of odd_msg
    li $t4, 1   # Offset between even_msg and odd_msg (20 - 19)

    # Calculate offset to select between messages
    mul $t5, $t2, $t4  # $t5 = $t2 * 1 (0 or 1)

    # Load base address of even_msg
    la $a0, even_msg
    add $a0, $a0, $t5  # Offset to select between even_msg and odd_msg

    # Print the selected message
    li $v0, 4
    syscall

    # Exit program
    li $v0, 10
    syscall
