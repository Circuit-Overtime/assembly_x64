.text
.globl main
main:
    # Prompt for n to be taken as input
    li $v0, 4
    la $a0, msg_prompt
    syscall

    # Read the number n
    li $v0, 5
    syscall
    move $t0, $v0  # $t0 holds the input number n

    # Edge case: if n is 0, exit
    beq $t0, $zero, exit

    # Initialize first two Fibonacci numbers
    li $t1, 0    # F(0)
    li $t2, 1    # F(1)

    # Print F(0)
    li $v0, 1
    move $a0, $t1
    syscall

    # If n == 1, exit after printing F(0)
    li $t3, 1
    beq $t0, $t3, exit

    # Print F(1)
    li $v0, 1
    move $a0, $t2
    syscall

    # Initialize loop counter
    li $t4, 2  # Start from the 3rd Fibonacci number

    # Loop to calculate and print Fibonacci numbers up to n
    loop:
        # If counter equals n, exit loop
        beq $t4, $t0, exit_loop

        # Calculate next Fibonacci number: F(n) = F(n-1) + F(n-2)
        add $t5, $t1, $t2  # $t5 = F(n)

        # Print the current Fibonacci number
        li $v0, 1
        move $a0, $t5
        syscall

        # Update F(n-2) and F(n-1)
        move $t1, $t2
        move $t2, $t5

        # Increment the loop counter
        addi $t4, $t4, 1

        # Continue loop
        j loop

    exit_loop:
        # Exit program
        exit:
        li $v0, 10
        syscall

.data
msg_prompt:   .asciiz "Enter the number of Fibonacci numbers to print: \n"
