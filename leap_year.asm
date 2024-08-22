.text
.globl main

main:
    # Prompt for the year
    li $v0, 4 
    la $a0, msg_prompt
    syscall
    
    # Read the year
    li $v0, 5
    syscall
    move $t0, $v0  # Store the input year in $t0
    
    # Check if the year is divisible by 4
    li $t1, 4
    div $t0, $t1
    mfhi $t2  # Move the remainder to $t2
    bnez $t2, not_leap  # If remainder != 0, it’s not a leap year

    # Check if the year is divisible by 100
    li $t1, 100
    div $t0, $t1
    mfhi $t2  # Move the remainder to $t2
    bnez $t2, leap_year  # If remainder != 0, it’s a leap year

    # Check if the year is divisible by 400
    li $t1, 400
    div $t0, $t1
    mfhi $t2  # Move the remainder to $t2
    bnez $t2, not_leap  # If remainder != 0, it’s not a leap year

leap_year:
    # Print leap year message
    li $v0, 4
    la $a0, msg_leap
    syscall
    b end  # Skip to the end

not_leap:
    # Print not a leap year message
    li $v0, 4
    la $a0, msg_not_leap
    syscall

end:
    # Exit the program
    li $v0, 10
    syscall

.data
msg_prompt: .asciiz "Enter a year: \n" 
msg_leap: .asciiz "The year is a leap year
