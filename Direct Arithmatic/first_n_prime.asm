.text
.globl main
main:
    # Prompt for n to be taken as input
    li $v0, 4
    la $a0, msg_prompt
    syscall

    # Read the number n
    li $v0, 5
    syscall
    move $t0, $v0  # $t0 holds the input number n

    # Initialize sum and prime counter
    li $t1, 0    # $t1 holds the sum of primes
    li $t2, 0    # $t2 counts how many primes have been found

    # Initialize candidate prime number
    li $t3, 2    # $t3 is the current number being tested for primality

find_primes:
    # Check if we have found n primes
    beq $t2, $t0, print_sum

    # Check if current number ($t3) is prime
    li $t4, 2    # $t4 is the divisor, starts from 2
    li $t5, 1    # $t5 is the flag, 1 means prime, 0 means not prime

check_prime_loop:
    # If divisor squared > candidate, it's prime
    mul $t6, $t4, $t4  # $t6 = $t4 * $t4
    bgt $t6, $t3, is_prime

    # Check if the candidate is divisible by the divisor ($t4)
    div $t3, $t4
    mfhi $t7  # $t7 will contain the remainder
    beq $t7, $zero, not_prime  # If remainder is 0, it's not prime

    # Increment the divisor
    addi $t4, $t4, 1

    # Continue checking divisibility
    j check_prime_loop

not_prime:
    # Set the flag to 0 (not prime)
    li $t5, 0

is_prime:
    # If the number is prime, add to sum and increment prime counter
    beq $t5, 0, next_candidate
    add $t1, $t1, $t3  # Add prime to sum
    addi $t2, $t2, 1   # Increment prime counter

next_candidate:
    # Move to the next number to check
    addi $t3, $t3, 1

    # Continue finding primes
    j find_primes

print_sum:
    # Print the sum of the first n primes
    li $v0, 1
    move $a0, $t1
    syscall

    # Exit program
    li $v0, 10
    syscall

.data
msg_prompt:   .asciiz "Enter the number of prime numbers to sum: \n"
