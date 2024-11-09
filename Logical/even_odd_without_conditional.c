#include <stdio.h>

int main() {
    int number;       // Variable to store the user's input
    const char *even = "Even";  // String for even numbers
    const char *odd = "Odd";    // String for odd numbers
    const char *result;         // Pointer to store the result string

    // Prompt user for input
    printf("Enter a number: \n");
    scanf("%d", &number);

    // Determine if the number is odd or even using the least significant bit (LSB)
    result = (number & 1) ? odd : even;

    // Print the result
    printf("%s\n", result);

    return 0;
}
