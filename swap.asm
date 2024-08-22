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
    
    # Swap the numbers using a temporary register $t2
    move $t2, $t0  # Store $t0 in $t2 (temporary)
    move $t0, $t1  # Copy $t1 into $t0
    move $t1, $t2  # Copy $t2 (original $t0) into $t1
    
    # Print the swap message
    li $v0, 4
    la $a0, msg_swap
    syscall
    
    # Print the first number after swapping
    li $v0, 4
    la $a0, msg1_swapped
    syscall
    
    li $v0, 1
    move $a0, $t0
    syscall
    
    # Print the second number after swapping
    li $v0, 4
    la $a0, msg2_swapped
    syscall
    
    li $v0, 1
    move $a0, $t1
    syscall
    
    # Exit
    li $v0, 10
    syscall
    
.data
msg1: .asciiz "Enter the first number: \n" 
msg2: .asciiz "Enter the second number: \n"
msg_swap: .asciiz "The numbers have been swapped.\n" 
msg1_swapped: .asciiz "First number after swapping: \n" 
msg2_swapped: .asciiz "Second number after swapping: \n"
