#include <stdio.h>
#include <stddef.h>

int main(int argc, char const *argv[]) {
  /* addressing elements in a multidimensional array using the name itself */

  // declaration of a square matrix
  int numbers[3][3] = {
    {1,2,3},
    {4,5,6},
    {7,8,9},
  };
  /* USING ARRAY DEFINITION*/
  printf("using the array name...\n\n");
  /* addressing directly the position */
  printf("%d is the value of the third element\n", numbers[0][2]);

  /* this results the address of the subarray no. 2
  that's because numbers[i] is of type *int, i.e. a pointer to an address */
  printf("%p is the address of the second subarray\n", numbers[1]);

  /* addressing the first byte in the array*/
  printf("%p is the address of the first byte\n", numbers);

  /* this results in the value of the first element */
  printf("%d is the first element\n", **numbers);

  /* this gets the size of every single element
  obs: data casting is necessary to avoid warning because size_t type is long */
  printf("%d is the size of each element in the array\n", (int)(sizeof(numbers)/sizeof(numbers[0])));


  /* USING A POINTER*/
  printf("using a pointer p...\n\n");
  int* pointer = *numbers;
  printf("%d is the value that pointer points to\n", *pointer);
  printf("but he points to this address: %p\n", pointer);
  printf("that is, coincidence, the address of the first byte\n");

  return 0;
}
