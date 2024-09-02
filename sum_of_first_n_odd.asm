.text 
.globl main
main:
    # Prompt for n to be taken as input
    li $v0, 4
    la $a0, msg_prompt
    syscall

    # Read the number
    li $v0, 5
    syscall
    move $t0, $v0

    # Initialize sum to 0
    li $t1, 0
    # Initialize the first odd number (1)
    li $t2, 1
    # Counter for odd numbers
    li $t3, 0

    loop:
        # If $t3 >= $t0, end the loop
        bge $t3, $t0, end_loop

        # Add the current odd number to the sum
        add $t1, $t1, $t2

        # Increment to the next odd number by adding 2
        addi $t2, $t2, 2

        # Increment the counter
        addi $t3, $t3, 1

        # Continue loop
        j loop

    end_loop:
        # Print the sum
        li $v0, 1
        move $a0, $t1
        syscall

    # Exit program
    li $v0, 10
    syscall

.data
msg_prompt:   .asciiz "Enter a number: "
