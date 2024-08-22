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
    
    # Addition
    add $t2, $t0, $t1  # t2 = t0 + t1
    
    # Print the sum message
    li $v0, 4
    la $a0, msg_sum
    syscall
    
    # Print the sum
    li $v0, 1
    move $a0, $t2
    syscall
    
    # Subtraction
    sub $t3, $t0, $t1  # t3 = t0 - t1
    
    # Print the difference message
    li $v0, 4
    la $a0, msg_diff
    syscall
    
    # Print the difference
    li $v0, 1
    move $a0, $t3
    syscall
    
    # Multiplication
    mul $t4, $t0, $t1  # t4 = t0 * t1
    
    # Print the product message
    li $v0, 4
    la $a0, msg_prod
    syscall
    
    # Print the product
    li $v0, 1
    move $a0, $t4
    syscall
    
    # Division
    div $t0, $t1  # Divide $t0 by $t1
    mflo $t5      # Move the quotient to $t5
    mfhi $t6      # Move the remainder to $t6
    
    # Print the quotient message
    li $v0, 4
    la $a0, msg_quot
    syscall
    
    # Print the quotient
    li $v0, 1
    move $a0, $t5
    syscall
    
    # Print the remainder message
    li $v0, 4
    la $a0, msg_rem
    syscall
    
    # Print the remainder
    li $v0, 1
    move $a0, $t6
    syscall

    # Exit
    li $v0, 10
    syscall
    
.data
msg1: .asciiz "Enter the first number: \n" 
msg2: .asciiz "Enter the second number: \n" 
msg_sum: .asciiz "The sum of the numbers is: \n" 
msg_diff: .asciiz "The difference of the numbers is: \n" 
msg_prod: .asciiz "The product of the numbers is: \n" 
msg_quot: .asciiz "The quotient of the numbers is: \n" 
msg_rem: .asciiz "The remainder of the numbers is: \n" 
