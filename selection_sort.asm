.data
    prompt:      .asciiz "Enter the number of elements: "
    enterElem:   .asciiz "Enter element: "
    sortedMsg:   .asciiz "Sorted array: "
    newLine:     .asciiz "\n"
    array:       .space 400  # Space for 100 integers (4 bytes each)

.text
main:
    li      $v0, 4          # Print string
    la      $a0, prompt
    syscall

    li      $v0, 5          # Read integer
    syscall
    move    $t0, $v0        # $t0 = number of elements (n)

    la      $t1, array      # Load base address of the array
    li      $t2, 0          # Index counter (i = 0)

input_loop:
    bge     $t2, $t0, sort_array  # If i >= n, go to sort
    li      $v0, 4          # Print string
    la      $a0, enterElem
    syscall

    li      $v0, 5          # Read integer
    syscall
    sw      $v0, 0($t1)     # Store the input in the array
    addi    $t1, $t1, 4     # Move to the next element
    addi    $t2, $t2, 1     # Increment index
    j       input_loop

sort_array:
    li      $t2, 0          # Outer loop index i = 0

outer_loop:
    bge     $t2, $t0, print_sorted # If i >= n, print sorted array
    move    $t3, $t2        # $t3 = i

    addi    $t4, $t2, 1     # $t4 = i + 1

inner_loop:
    bge     $t4, $t0, next_outer  # If j >= n, go to next outer iteration
    la      $t5, array      # Load base address of array
    sll     $t6, $t3, 2     # $t6 = i * 4
    add     $t5, $t5, $t6   # Address of array[i]
    lw      $t7, 0($t5)     # Load array[i]

    sll     $t8, $t4, 2     # $t8 = j * 4
    la      $t9, array      # Load base address of array again
    add     $t9, $t9, $t8   # Address of array[j]
    lw      $s0, 0($t9)     # Load array[j]

    blt     $s0, $t7, swap  # If array[j] < array[i], swap
    j       skip_swap

swap:
    sw      $s0, 0($t5)     # array[i] = array[j]
    sw      $t7, 0($t9)     # array[j] = temp (array[i])

skip_swap:
    addi    $t4, $t4, 1     # Increment j
    j       inner_loop

next_outer:
    addi    $t2, $t2, 1     # Increment i
    j       outer_loop

print_sorted:
    li      $v0, 4          # Print string
    la      $a0, sortedMsg
    syscall

    li      $t2, 0          # Reset index for printing
    la      $t1, array      # Load base address of array

print_loop:
    bge     $t2, $t0, exit   # If i >= n, exit
    lw      $a0, 0($t1)      # Load array[i]
    li      $v0, 1           # Print integer
    syscall

    li      $v0, 4           # Print string
    la      $a0, newLine
    syscall

    addi    $t1, $t1, 4      # Move to the next element
    addi    $t2, $t2, 1      # Increment index
    j       print_loop

exit:
    li      $v0, 10          # Exit
    syscall
