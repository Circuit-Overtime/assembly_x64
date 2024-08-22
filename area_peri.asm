.data
msg_prompt:     .asciiz "Enter the radius of the circle: \n"
msg_area:       .asciiz "The area of the circle is: \n"
msg_perimeter:  .asciiz "The perimeter of the circle is: \n"
pi_value:       .float 3.14159

.text
.globl main

main:
    # Prompt for the radius
    li $v0, 4 
    la $a0, msg_prompt
    syscall
    
    # Read the radius (integer input)
    li $v0, 5
    syscall
    move $t0, $v0  # Store the radius in $t0
    
    # Convert radius to floating-point (since we'll use floating-point operations)
    mtc1 $t0, $f0  # Move radius to $f0
    cvt.s.w $f0, $f0  # Convert integer to float
    
    # Calculate area: π * r^2
    mul.s $f1, $f0, $f0  # r^2 in $f1
    lwc1 $f2, pi_value  # Load π into $f2
    mul.s $f3, $f1, $f2  # Area = π * r^2 in $f3
    
    # Print area message
    li $v0, 4
    la $a0, msg_area
    syscall
    
    # Print area value
    li $v0, 2
    mov.s $f12, $f3  # Move the area to $f12 for printing
    syscall
    
    # Calculate perimeter: 2 * π * r
    mul.s $f4, $f2, $f0  # π * r in $f4
    li.s $f5, 2.0  # Load 2.0 into $f5
    mul.s $f6, $f5, $f4  # Perimeter = 2 * π * r in $f6
    
    # Print perimeter message
    li $v0, 4
    la $a0, msg_perimeter
    syscall
    
    # Print perimeter value
    li $v0, 2
    mov.s $f12, $f6  # Move the perimeter to $f12 for printing
    syscall
    
    # Exit the program
    li $v0, 10
    syscall
