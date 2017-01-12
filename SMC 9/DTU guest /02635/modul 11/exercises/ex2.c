/*
purpose:
  compute the time complexity of the recursive implementation

strategy:
  given different calls to the same function, see how many times the function
  is called, check for CPU time and try to fetch some behaviour.

outcome:
  the cost is at most exponential, since it can be shown that in a double
  logarithmic plot, the number of function calls is upper bounded by the
  exponential of 2^n, while it is lower bounded by the exponential of 2^(n/2).
  That is because the number of function calls at least is doubling when n
  is doubling.

  The time complexity can't be linear because its growing rate is much lower
  than the recursive function calls one, and can't be polynomial neither since
  the number of function calls is not bounded for lower n
*/

#include <stdio.h>
#include <time.h>
#include "linalg.h"

/* define main variable for counter
obs: this way, it can be seen both by the function and the main */
static unsigned long counter;

/* Fibonacci function in recursive implementation */
unsigned long fibonacci(unsigned long n) {

  /* update counter every function call */
  counter += 1;

  /* recursion base */
  if ( n == 0 ) return 0;
  else if ( n == 1 ) return 1;
  /* recursive definition */
  else return fibonacci(n-1) + fibonacci(n-2);
}


int main(void) {

  unsigned long max;
  printf("Insert the max number of digit for the Fibonacci series: ");
  scanf("%lu", &max);

  /* define accessories variables */
  clock_t T1, T2;
  double CPU;
  unsigned long result;
  unsigned long row = 0;      // keep track of matrix row

  /* allocate memory to save cpu time and function calls result */
  matrix_t * data_matrix = malloc_matrix(max + 1, 2);

  /* loop over consecutive n for a Fibonacci series of n numbers */
  for (unsigned long n = 0; n < max + 1; n++){
    /* reset the counter before traking the function calls */
    CPU = 0;
    unsigned long k = 0;      // keep track of repetitions

    /* repeat the computation a number of times in order to get a better time
    accuracy (strategy: repeat until CPU time collected is larger than 1 sec) */
    do {
      T1 = clock();
      result = fibonacci(n);
      T2 = clock();
      CPU += (double) (T2 - T1) / CLOCKS_PER_SEC;

      /* update repetitions counter */
      k++;

    } while (CPU < 1.0);

    /* scale CPU by the number of repetitions */
    CPU /= k;
    counter /= k;

    /* write data into the matrix */
    printf("write in %lu row\n", row);
    data_matrix->A[row][0] = CPU;
    data_matrix->A[row][1] = counter;

    /* print some information on the screen */
    printf("Fibonacci series of %lu elements with max value %lu\n",
    n, result);
    printf("Number of calls: %lu\n", counter);
    printf("Time elapsed: %.8lf ms\n\n", CPU*1e3/100);

    /* reset and/or update variables */
    counter = 0;
    row++;

  }

  /* write matrix onto a texfile */
  int exit_code = write_matrix("data.txt", data_matrix);
  /* error handling */
  if (!(exit_code == LINALG_SUCCESS)) {
    printf("unable to write solution onto a textfile.\n");
    return EXIT_FAILURE;
  }
  else printf("write succedeed\n");
  free_matrix(data_matrix);

  return EXIT_SUCCESS;
}
