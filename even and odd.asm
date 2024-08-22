.data
    prompt: .asciiz "Enter a number: "
    even_msg: .asciiz "The number is even.\n"
    odd_msg: .asciiz "The number is odd.\n"

.text
.globl main

main:
    # Display prompt
    li $v0, 4
    la $a0, prompt
    syscall

    # Read input number
    li $v0, 5
    syscall
    move $t0, $v0

    # Check if the number is even or odd
    #if t0 has a msb with 0 then bitwise AND with 1 will result in 0 which will result
    #in a branch statement to even
    #if t0 has a msb with 1 then bitwise AND with 1 will result in 1 which will result
    #in a jump to odd
    andi $t1, $t0, 1
    beqz $t1, even 
    j odd

even:
    # Display even message
    li $v0, 4
    la $a0, even_msg
    syscall
    j exit

odd:
    # Display odd message
    li $v0, 4
    la $a0, odd_msg
    syscall

exit:
    # Exit the program
    li $v0, 10
    syscall
