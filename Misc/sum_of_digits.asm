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
    move $t0, $v0

    # Initialize sum to 0
    li $t1, 0

    # Loop to calculate the sum of the digits
    loop:
        # Check if the number is 0, if yes, end loop
        beq $t0, $zero, end_loop

        # Get the last digit of the number (t0 = t0 % 10 diving by 10 to get remainder)
        div $t0, $t0, 10
        # getting the remainder into 22 --> $t2 now contains the last digit
        mfhi $t2  

        # Add the last digit to the sum
        add $t1, $t1, $t2

        # Continue loop (t0 is already updated by the div operation)
        j loop

    end_loop:
        # Print the sum of the digits
        li $v0, 1
        move $a0, $t1
        syscall

    # Exit program
    li $v0, 10
    syscall

.data
msg_prompt:   .asciiz "Enter a number: "
