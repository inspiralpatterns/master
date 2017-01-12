/*
purpose:
  compute the space complexity of the recursive implementation

strategy:
  calculate the maximum depth of the recursion (i.e. the depth of the tree that
  is created when the function calls itself). For this purpose, the function
  has been sligthly modified so that a global variable stack keeps traks of
  the number of levels in the recursion.
  obs: since the function is defined recursively, all the necessary states of
  the function are saves, making the implicit stack grows. The aim is to fetch
  the nature of this growth.

outcome:
  since the depth grows with the number of values of Fibonacci series, it is
  meant to have a linear space complexity. That is because the first part of the
  tree (n-1) is evaluated before moving to the right part (n-2). Doing so, there
  will be never more than n level of recursion.
*/

#include <stdio.h>
#include "linalg.h"

/* define main variables for implicit stack */
static unsigned long stack = 1;
static unsigned long depth = 1;

/* Fibonacci function in recursive implementation */
unsigned long fibonacci(unsigned long n, unsigned long stack) {

  printf("Fib: %lu %lu\n", n, stack);
  /* save the largest value as depth
  obs: if we print the last value of the stack, we'll be printing one because
  once the deepest level is solved, the recursion moves one level above */
  depth = stack >= depth? stack : depth;

  /* recursion base */
  if ( n == 0 ) return 0;
  else if ( n == 1 ) return 1;
  /* recursive definition
  obs: stack is increasing at each new level, or depth, of recursion */
  else return fibonacci(n - 1, stack + 1) + fibonacci(n - 2, stack + 1);
}


int main(void) {

  unsigned long max;
  printf("Insert the max number of digit for the Fibonacci series: ");
  scanf("%lu", &max);

  /* define accessories variables */
  unsigned long result;
  unsigned long row = 0;      // keep track of matrix row

  /* allocate memory to save cpu time and function calls result */
  vector_t * data_vector = malloc_vector(max + 1);

  /* loop over consecutive n for a Fibonacci series of n numbers */
  for (unsigned long n = 0; n < max + 1; n++){

    result = fibonacci(n, stack);

    /* write data into the matrix */
    //printf("write in %lu row\n", row);
    data_vector->v[row] = depth;

    /* print some information on the screen */
    printf("Fibonacci series of %lu elements with max value %lu\n",
    n, result);
    printf("Depth in the implicit stack: %lu\n", depth);

    /* reset and/or update variables */
    row++;

  }

  /* write matrix onto a texfile */
  int exit_code = write_vector("stack.txt", data_vector);
  /* error handling */
  if (!(exit_code == LINALG_SUCCESS)) {
    printf("unable to write solution onto a textfile.\n");
    return EXIT_FAILURE;
  }
  else printf("write succedeed\n");
  free_vector(data_vector);

  return EXIT_SUCCESS;
}
