.data
prompt:    .asciz "Enter a number: \n"  # Prompt message for the user
even:      .asciz "Even"               # "Even" string
odd:       .asciz "Odd"                # "Odd" string

new_line:  .asciz "\n"                 # New line character
number:    .word 0                      # Space to store the entered number

.text
.global _start

_start:
    // Print the prompt to enter a number
    mov x0, 1                          // File descriptor for stdout
    ldr x1, =prompt                    // Address of the prompt string
    mov x2, 18                         // Length of the prompt string
    mov x8, 64                         // System call number for write
    svc 0                             // Make the system call

    // Read the number from the user
    mov x8, 63                         // System call number for read
    mov x0, 0                          // File descriptor for stdin
    ldr x1, =number                    // Address to store the input number
    mov x2, 4                          // Number of bytes to read
    svc 0                             // Make the system call

    // Load the entered number
    ldr w0, [number]                   // Load the number into register w0

    // Get the least significant bit (LSB)
    and w1, w0, 1                      // Perform bitwise AND with 1 to get the LSB (check if it's 1 or 0)

    // Determine if the number is odd or even
    mov x2, 5                          // Initialize x2 with 5
    mul x2, x2, w1                     // Multiply x2 by the LSB (1 or 0)
    
    // Load the base address of "even"
    ldr x3, =even                      // Load base address of "Even"
    
    // Calculate the offset for "Odd"
    // Offset for "Odd" starts after 5 bytes (length of "Even" is 4 bytes) + 1 byte for space
    // Offset will be calculated as the value of x2 register which will be 0 or 5
    add x3, x3, x2                    // Add the offset to base address of "Even"

    // Print the string at the computed address (either "Even" or "Odd")
    mov x0, 1                          // File descriptor for stdout
    mov x8, 64                         // System call number for write
    mov x2, 4                          // Length of the string to print (can be adjusted as needed)
    svc 0                             // Make the system call

    // Print the new line character
    ldr x1, =new_line                  // Load the new line character
    mov x2, 1                          // Length of the new line character
    mov x8, 64                         // System call number for write
    svc 0                             // Make the system call

    // End program
    mov x8, 93                         // System call number for exit
    mov x0, 0                          // Exit code
    svc 0                             // Make the system call

//Ayushman 13/09/2024