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
    # Loop counter variable
    li $t2, 1

    # Loop to calculate sum of squares of n natural numbers
    loop:
        # If $t2 > $t0, end the loop
        bgt $t2, $t0, end_loop

        # Calculate square of the current number in $t2 and add it to the sum
        mul $t3, $t2, $t2
        add $t1, $t1, $t3

        # Increment loop counter
        addi $t2, $t2, 1

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
