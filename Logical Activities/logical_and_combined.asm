.data
    input_value_one:    .word   0x0000000F   # Example input value (can be up to a max value of 2^32-1)
    input_value_two:    .word   0x0000000F   # Example input value (can be up to a max value of 2^32-1)
    prompt_one:         .asciiz "Input the first number: "
    prompt_two:         .asciiz "Input the second number: "
    solution_one:       .asciiz "\nThe solution with 3 registers is: "
    solution_two:       .asciiz "\nThe solution with 2 registers is: "
    solution_three:     .asciiz "\nThe solution with 1 register is: "
.text
.globl main
main:
    # Prompt the user to input the first number
    la   $a0, prompt_one  # Load the first prompt message
    li   $v0, 4           # Print string syscall
    syscall

    # Read the first number
    li   $v0, 5           # Read integer syscall
    syscall
    move $t0, $v0         # Store the first input in $t0

    # Prompt the user to input the second number
    la   $a0, prompt_two  # Load the second prompt message
    li   $v0, 4           # Print string syscall
    syscall

    # Read the second number
    li   $v0, 5           # Read integer syscall
    syscall
    move $t1, $v0         # Store the second input in $t1

    # --- Solution 1: Using 3 registers ---
    # Perform AND operation using 3 registers
    and  $t2, $t0, $t1    # $t2 = $t0 AND $t1

    # Display the solution with 3 registers
    la   $a0, solution_one  # Load solution_one message
    li   $v0, 4             # Print string syscall
    syscall

    # Print the result
    move $a0, $t2          # Move the result to $a0
    li   $v0, 1            # Print integer syscall
    syscall

    # --- Solution 2: Using 2 registers ---
    # Perform AND operation using 2 registers (overwrite $t0)
    and  $t0, $t0, $t1     # $t0 = $t0 AND $t1

    # Display the solution with 2 registers
    la   $a0, solution_two  # Load solution_two message
    li   $v0, 4             # Print string syscall
    syscall

    # Print the result
    move $a0, $t0          # Move the result to $a0
    li   $v0, 1            # Print integer syscall
    syscall

    # --- Solution 3: Using 1 register ---
    # Save the second input in a temporary register to preserve it
    move $t2, $t1          # $t2 = $t1 (backup second input)

    # Perform AND operation using 1 register
    and  $t0, $t0, $t2     # $t0 = $t0 AND $t2

    # Display the solution with 1 register
    la   $a0, solution_three  # Load solution_three message
    li   $v0, 4               # Print string syscall
    syscall

    # Print the result
    move $a0, $t0          # Move the result to $a0
    li   $v0, 1            # Print integer syscall
    syscall

    # Exit the program
    li   $v0, 10           # Exit syscall
    syscall
