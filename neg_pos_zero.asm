.text
.globl main

main:
    # Prompt for a number
    li $v0, 4 
    la $a0, msg_prompt
    syscall
    
    # Read the number
    li $v0, 5
    syscall
    move $t0, $v0  # Store the input number in $t0
    
    # Check if the number is zero
    li $t1, 0       # Load 0 into $t1
    beq $t0, $t1, is_zero  # If $t0 is 0, branch to is_zero
    
    # Check if the number is positive
    bgtz $t0, is_positive  # If $t0 > 0, branch to is_positive
    
    # If the number is not zero or positive, it must be negative
    b is_negative

is_zero:
    # Print the zero message
    li $v0, 4
    la $a0, msg_zero
    syscall
    b end  # Skip the rest and exit

is_positive:
    # Print the positive message
    li $v0, 4
    la $a0, msg_positive
    syscall
    b end  # Skip the rest and exit

is_negative:
    # Print the negative message
    li $v0, 4
    la $a0, msg_negative
    syscall

end:
    # Exit the program
    li $v0, 10
    syscall

.data
msg_prompt:   .asciiz "Enter a number: \n" 
msg_zero:     .asciiz "The number is zero.\n" 
msg_positive: .asciiz "The number is positive.\n" 
msg_negative: .asciiz "The number is negative.\n"
