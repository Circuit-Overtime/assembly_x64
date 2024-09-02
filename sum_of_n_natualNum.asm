.text 
.globl main
main:
    #prompt for n to be taken as input
    li $v0, 4
    la $a0, msg_prompt
    syscall

    #read the number
    li $v0, 5
    syscall
    move $t0, $v0

    #initialize sum to 0
    li $t1, 0
    li $t2, 0

    #while loop to calculate sum of n natural numbers
    while:
     beq $t2, $t0, end_while
     add $t1, $t1, $t2

     #increment
     addi $t2, $t2, 1

     j while

    end_while:
     #print the sum
     li $v0, 1
     move $a0, $t1
     syscall


.data
msg_prompt:   .asciiz "Enter a number: \n" 