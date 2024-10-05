.data
    prompt:     .asciiz "Enter the number of elements: "
    input:      .word 0                # To store the number of elements
    array:      .space 40              # Space for 10 integers (4 bytes each)
    newline:    .asciiz "\n"

.text
.globl main

main:
    # Prompt for number of elements
    li      $v0, 4                    # syscall for print_string
    la      $a0, prompt               # load address of prompt
    syscall

    # Read the number of elements
    li      $v0, 5                    # syscall for read_integer
    syscall
    sw      $v0, input                # store the number of elements in input

    # Load the number of elements
    lw      $t1, input                # $t1 = number of elements

    # Read elements into the array
    la      $t0, array                # Load address of array
    li      $t2, 0                     # i = 0

read_loop:
    # Check if we have read enough elements
    bge     $t2, $t1, sort_array       # If i >= number of elements, go to sorting

    # Read each integer
    li      $v0, 5                    # syscall for read_integer
    syscall
    sw      $v0, 0($t0)               # Store the integer in array[i]

    # Update the address and index
    addi    $t0, $t0, 4                # Move to the next word in array
    addi    $t2, $t2, 1                # i++
    j       read_loop                  # Repeat for next element

sort_array:
    # Reset $t0 to the start of the array
    la      $t0, array                # Load address of array
    # Load the length of the array
    lw      $t1, input                # $t1 = length of the array

    # Outer loop counter (i)
    li      $t2, 0                    # i = 0

outer_loop:
    # Check if i < length - 1
    sub     $t3, $t1, 1                # $t3 = length - 1
    bge     $t2, $t3, end_outer_loop   # if i >= length - 1, exit outer loop

    # Inner loop counter (j)
    li      $t4, 0                    # j = 0

inner_loop:
    # Check if j < length - i - 1
    sub     $t5, $t1, $t2              # $t5 = length - i
    sub     $t5, $t5, 1                 # $t5 = length - i - 1
    bge     $t4, $t5, end_inner_loop   # if j >= length - i - 1, exit inner loop

    # Load array[j] and array[j + 1]
    sll     $t6, $t4, 2               # $t6 = j * 4 (word size)
    add     $t7, $t0, $t6              # $t7 = address of array[j]
    lw      $t8, 0($t7)                # $t8 = array[j]
    lw      $t9, 4($t7)                # $t9 = array[j + 1]

    # Compare array[j] and array[j + 1]
    ble     $t8, $t9, no_swap          # if array[j] <= array[j + 1], no swap

    # Swap array[j] and array[j + 1]
    sw      $t9, 0($t7)                # array[j] = array[j + 1]
    sw      $t8, 4($t7)                # array[j + 1] = array[j]

no_swap:
    addi    $t4, $t4, 1                # j++
    j       inner_loop                 # Jump to inner loop

end_inner_loop:
    addi    $t2, $t2, 1                # i++
    j       outer_loop                 # Jump to outer loop

end_outer_loop:
    # Print sorted array
    li      $v0, 4                    # syscall for print_string
    la      $a0, newline               # print newline before array
    syscall

    # Reset $t0 to the start of the array for printing
    la      $t0, array                # Load address of array
    li      $t2, 0                     # Reset i for printing

print_loop:
    bge     $t2, $t1, exit_program      # If i >= number of elements, exit

    # Load the integer from the array
    lw      $a0, 0($t0)                # Load array[i] into $a0
    li      $v0, 1                     # syscall for print_integer
    syscall

    # Print a space
    li      $v0, 4                     # syscall for print_string
    la      $a0, newline               # Print newline after each integer
    syscall

    addi    $t0, $t0, 4                 # Move to the next element
    addi    $t2, $t2, 1                 # i++
    j       print_loop                  # Jump to print next element

exit_program:
    # Exit program
    li      $v0, 10                    # syscall for exit
    syscall
