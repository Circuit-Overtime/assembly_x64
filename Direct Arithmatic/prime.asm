.text
.globl main
main:
    # Prompt for number input
    li $v0, 4
    la $a0, msg_prompt
    syscall

    # Read the number
    li $v0, 5
    syscall
    move $t0, $v0  # $t0 holds the input number

    # Initialize variables
    li $t1, 2      # $t1 is the divisor, starts from 2
    li $t2, 1      # $t2 is the flag, 1 means prime, 0 means not prime

    # Check for edge cases (if the number is less than 2)
    li $t3, 2
    blt $t0, $t3, not_prime

    # Loop to check divisibility
    check_loop:
    
        # If divisor squared > number, it's prime
        div $t4, $t0, 2  # t4 = t0 / 2
        bgt $t1, $t4, end_loop

        # Check if the number is divisible by t1 (if t0 % t1 == 0)
        div $t0, $t1
        mfhi $t5  # $t5 will contain the remainder
        beq $t5, $zero, not_prime  # If remainder is 0, it's not prime

        # Increment the divisor
        addi $t1, $t1, 1

        # Continue loop
        j check_loop

    not_prime:
        # Set the flag to 0 (not prime)
        li $t2, 0

    end_loop:
        # Print result
        li $v0, 4
        beq $t2, 1, is_prime
        la $a0, msg_not_prime
        j print_result

    is_prime:
        la $a0, msg_prime

    print_result:
        syscall

    # Exit program
    li $v0, 10
    syscall

.data
msg_prompt:   .asciiz "Enter a number: \n"
msg_prime:    .asciiz "The number is prime.\n"
msg_not_prime:.asciiz "The number is not prime.\n"
