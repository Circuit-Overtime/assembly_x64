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
    
    # Prompt for the third number
    li $v0, 4 
    la $a0, msg3
    syscall
    
    # Read the third number
    li $v0, 5
    syscall
    move $t2, $v0  # Store the third number in $t2
    
    # Compare $t0 and $t1
    bge $t0, $t1, first_is_max_1  # If $t0 >= $t1, $t0 is currently max
    move $t3, $t1  # $t1 is greater, store in $t3 as current max
    b compare_with_third

first_is_max_1:
    # If $t0 >= $t1, store $t0 in $t3 as current max
    move $t3, $t0

compare_with_third:
    # Compare $t3 (current max) with $t2
    bge $t3, $t2, print_max  # If $t3 >= $t2, $t3 is the max
    move $t3, $t2  # $t2 is greater, store in $t3 as max

print_max:
    # Print the max message
    li $v0, 4
    la $a0, msg_max
    syscall
    
    # Print the maximum number
    li $v0, 1
    move $a0, $t3
    syscall
    
    # Exit the program
    li $v0, 10
    syscall

.data
msg1: .asciiz "Enter the first number: \n" 
msg2: .asciiz "Enter the second number: \n"
msg3: .asciiz "Enter the third number: \n"
msg_max: .asciiz "The maximum of the three numbers is: \n"
