#Idea of the code is to use the LSB of the number to determine if it is even or odd.
#if the NUMBER is odd, then the LSB will be 1, the value of the LSB is multiplied with a constant offset of 5 (length of "Even" + null terminator)
#to get the address of the string "Odd" which is 5 bytes away from the address of the string "Even"
#If the LSB is 0, then the address of the string "Even" is used to print the message.


.data
prompt:    .asciiz "Enter a number: \n"  # Prompt message for the user
even:      .asciiz "Even"               # "Even" string
odd:       .asciiz "Odd"                # "Odd" string

new_line:  .asciiz "\n"                 # New line character
number:    .word 0                      # Space to store the entered number

.text
.globl main

main:
    # Print the prompt to enter a number
    li      $v0, 4                      # System call for print_string
    la      $a0, prompt                 # Load address of the prompt string
    syscall                             # Make the system call

    li      $t6, 5                      # Initialize $t6 with 5

    # Read the number from the user
    li      $v0, 5                      # System call for read_int
    syscall                             # Make the system call
    sw      $v0, number                 # Store the input number in memory

    # Load the entered number
    lw      $t0, number                 # Load the number into register $t0
    
    # Get the least significant bit (LSB)
    andi    $t1, $t0, 1                 # Perform bitwise AND with 1 to get the LSB (check if it's 1 or 0)
    mul $t6, $t6,$t1                    # Multiply $t6 by the LSB (1 or 0)

    # Load the base address of "even"
    la      $t2, even                   # Load base address of "Even"
    
    # Calculate the offset for "Odd"
    # Offset for "Odd" starts after 5 bytes (length of "Even" is 4 bytes) + 1 byte for space
    # offset will be calculated as the value of $t6 register which will be 0 or 5 
    addu    $t2, $t2, $t6               # Add the offset to base address of "Even"

    # Print the string at the computed address (either "Even" or "Odd")
    li      $v0, 4                      # System call for print_string
    move    $a0, $t2                    # Move the dynamically computed address to $a0
    syscall                             # Make the system call

    # Print the string at the computed address (either "Even" or "Odd")
    la      $t2, new_line               # Load the new line character
    li      $v0, 4                      # System call for print_string
    move    $a0, $t2                    # Move the new line to the print head
    syscall                             # Make the system call

    # End program
    li      $v0, 10                     # System call for exit
    syscall                             # Make the system call
