/*
purpose:
  implement a non-recursive Fibonacci function, i.e. an iterative implementation.
  Test time complexity then.

strategy:
  a loop can be performed, that uses the last and the last but one numbers
  in order to return the new Fibonacci values. In order not to lose the two
  previous values, a couple of static variables could be defined.

outcome:
  since the iterative version of Fibonacci function uses a loop to carry on the
  calculation, it needs n operation for n digits of the series, yielding to a
  linear time complexity.
  Since only the static variables and the function arguments are allocated at
  the very first function call, space used does not depend on the number of
  Fibonacci digits, yielding to a constant space complexity.
*/

#include <stdio.h>
#include <time.h>
#include "linalg.h"

static unsigned long last, lastButOne;
static unsigned long counter;
static double cputime;

unsigned long fibonacci(unsigned long n){
  /* sample case: n < 2 */
  counter = 1;
  if (n == 0) return 0;
  if (n == 1 || n == 2) return 1;

  /* case for every n > 2 */
  unsigned long fib;
  last = 1;
  lastButOne = 0;
  printf("Series: 0 1 ");

  /* check CPU time in order to compare with recursive implementation */
  clock_t T1, T2;
  T1 = clock();
  for (size_t i = 2; i <= n; i++) {
    fib = last + lastButOne;

    /* update static variables */
    lastButOne = last;
    last = fib;
    counter++;
    /* obs: wrong order means wrong sequence! */

    printf("%lu ", fib);
  }
  T2 = clock();
  cputime = (double) (T2 - T1) / CLOCKS_PER_SEC;

  printf("\n");

  /* return the last computed Fibonacci digit */
  return fib;
}


/* main program to test the function and find time complexity */
int main(void) {

  unsigned long max;
  printf("Insert the max number of digit for the Fibonacci series: ");
  scanf("%lu", &max);

  unsigned long result;
  unsigned long row = 0;      // keep track of matrix row

  /* allocate memory to save cpu time and function calls result */
  vector_t * cpu_vector = malloc_vector(max + 1);

  /* loop over consecutive n for a Fibonacci series of n numbers */
  for (unsigned long n = 0; n < max + 1; n++){

    printf("Fibonacci series of %lu elements.\n", n);
    result = fibonacci(n);

    printf("%lu function calls\n", counter);
    printf("cpu time: %.12lf\n", cputime);

    cpu_vector->v[row] = cputime;
    row++;
  }

  /* write matrix onto a texfile */
  int exit_code = write_vector("cputime.txt", cpu_vector);
  /* error handling */
  if (!(exit_code == LINALG_SUCCESS)) {
    printf("unable to write solution onto a textfile.\n");
    return EXIT_FAILURE;
  }
  else printf("write succedeed\n");
  free_vector(cpu_vector);

  return EXIT_SUCCESS;
}
