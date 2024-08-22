.text
.globl main

main:
    # Prompt for the first number
    li $v0, 4 
    la $a0, msg1
    syscall
    
    # Read the first number
    li $v0, 5
    syscall
    move $t0, $v0  # Store the first number in $t0
    
    # Prompt for the second number
    li $v0, 4 
    la $a0, msg2
    syscall
    
    # Read the second number
    li $v0, 5
    syscall
    move $t1, $v0  # Store the second number in $t1
    
    # Compare the two numbers
    bge $t0, $t1, first_is_max  # If $t0 >= $t1, jump to first_is_max

    # If $t0 < $t1, then $t1 is the max
    move $t2, $t1  # Store $t1 in $t2 as the maximum
    b print_max    # Skip to print_max
    
first_is_max:
    # If $t0 >= $t1, then $t0 is the max
    move $t2, $t0  # Store $t0 in $t2 as the maximum

print_max:
    # Print the max message
    li $v0, 4
    la $a0, msg_max
    syscall
    
    # Print the maximum number
    li $v0, 1
    move $a0, $t2
    syscall
    
    # Exit the program
    li $v0, 10
    syscall

.data
msg1: .asciiz "Enter the first number: \n" 
msg2: .asciiz "Enter the second number: \n"
msg_max: .asciiz "The maximum of the two numbers is: \n"
