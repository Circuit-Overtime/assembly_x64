    .data                   
    input_value:            .word   0x0000000F   # Example input value (can be upto a max value of 2^32-1)
    shift_amount:           .word   2            # Example shift amount (2)
    print_single_logical_left:  .asciiz "Single logical shift left: "
    print_single_logical_right: .asciiz "Single logical shift right: "
    #input_the_number: .ascizz "Enter the number: "
    newline:                .asciiz "\n"
    
    .text                   
    .globl main             
main:

    #to load the number from an user input we can run the following code
    #li $v0, 4
    #la $a0, input_the_number
    #syscall

    #li $v0, 5
    #syscall
    #move $t1, $v0



    # Load the hardcoded input value and shift amount
    lw  $t1, input_value      # Load the input value (15) into $t1
    lw  $t2, shift_amount     # Load the shift amount (2) into $t2

    # Perform a logical shift left (SLL) using a single register instruction
    sll $t1, $t1, 2           # Shift $t1 left by 2 bits, store result in $t1    

    # Print the shifted value for the left shift
    li  $v0, 4                # Load the print string syscall (4)
    la  $a0, print_single_logical_left  # Load the address of the string to be printed
    syscall                   # Make syscall to print the string

    li  $v0, 1                # Load the print integer syscall (1)
    move $a0, $t1             # Move the shifted value in $t1 to $a0 for printing
    syscall                   # Make syscall to print the integer

    # Print newline
    li  $v0, 4                # Print syscall
    la  $a0, newline          # Load the newline string
    syscall

    # Perform a logical shift right (SRL) using single register
    srl $t1, $t1, 1           # Shift $t1 right by 1 bit, store result in $t1

    # Print the shifted value for the right shift
    li  $v0, 4                # Load the print string syscall (4)
    la  $a0, print_single_logical_right  # Load the address of the string to be printed
    syscall                   # Make syscall to print the string

    li  $v0, 1                # Load the print integer syscall (1)
    move $a0, $t1             # Move the shifted value in $t1 to $a0 for printing
    syscall                   # Make syscall to print the integer

    # Print newline
    li  $v0, 4                # Print syscall
    la  $a0, newline          # Load the newline string
    syscall

    # Perform a logical shift left (SLLV) using the shift value from a register
    sllv $t0, $t1, $t2        # Shift $t1 left by the value in $t2 and store result in $t0
    
    # Print the result after left shift by register
    li  $v0, 4
    la  $a0, print_single_logical_left
    syscall

    li  $v0, 1
    move $a0, $t0
    syscall

    # Print newline
    li  $v0, 4
    la  $a0, newline
    syscall

    # Perform a logical shift right (SRLV) using the shift value from a register
    srlv $t0, $t1, $t2        # Shift $t1 right by the value in $t2 and store the value in $t0

    # Print the result after right shift by register
    li  $v0, 4
    la  $a0, print_single_logical_right
    syscall

    li  $v0, 1
    move $a0, $t0
    syscall

    # Print newline
    li  $v0, 4
    la  $a0, newline
    syscall

    # Using two registers to perform the left shift operation
    sll $t3, $t1, 3           # Shift $t1 left by 3 bits, store result in $t3

    # Print the result after left shift by 3 bits
    li  $v0, 4
    la  $a0, print_single_logical_left
    syscall

    li  $v0, 1
    move $a0, $t3
    syscall

    # Print newline
    li  $v0, 4
    la  $a0, newline
    syscall

    # Using two registers to perform the right shift operation
    srl $t0, $t3, 2           # Shift $t3 right by 2 bits, store result in $t0

    # Print the result after right shift by 2 bits
    li  $v0, 4
    la  $a0, print_single_logical_right
    syscall

    li  $v0, 1
    move $a0, $t0
    syscall

    # Print newline
    li  $v0, 4
    la  $a0, newline
    syscall

    # Exit the program
    li  $v0, 10               # Exit syscall
    syscall
