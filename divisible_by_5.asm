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
    
    # Check if the number is divisible by 5
    li $t1, 5
    div $t0, $t1
    mfhi $t2  # Move the remainder to $t2
    bnez $t2, not_divisible  # If remainder != 0, it’s not divisible by 5
    
    # If remainder == 0, it is divisible by 5
    li $v0, 4
    la $a0, msg_divisible
    syscall
    b end  # Skip to the end

not_divisible:
    # Print not divisible by 5 message
    li $v0, 4
    la $a0, msg_not_divisible
    syscall

end:
    # Exit the program
    li $v0, 10
    syscall

.data
msg_prompt:       .asciiz "Enter a number: \n" 
msg_divisible:    .asciiz "The number is divisible by 5.\n"
msg_not_divisible:.asciiz "The number is not divisible by 5.\n"

