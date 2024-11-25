.data
number: .word 0  # The number whose digits will be summed (initialized to 0)
sum:    .word 0  # Variable to store the sum of digits

.text
.globl main

main:
    li $v0, 5        # Syscall for reading an integer
    syscall
    move $t0, $v0    # Move the input number to register $t0
    li $t1, 0        # Initialize sum to 0

sum_loop:
    beq $t0, $zero, end_sum  # If the number is 0, exit the loop
    div $t0, $t0, 10         # Divide the number by 10
    mfhi $t2                 # Get the remainder (last digit)
    add $t1, $t1, $t2        # Add the digit to the sum
    mflo $t0                 # Update the number with the quotient
    j sum_loop               # Repeat the loop

end_sum:
    sw $t1, sum              # Store the sum in memory
    li $v0, 10               # Exit the program
    syscall