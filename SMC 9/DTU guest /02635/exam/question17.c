/*
question17.c
purpose
  implement a function that computes the cumulative sum of the elements of a
  given vector

arguments
  const double * x                        pointer to input vector
  double * y                              pointer to output vector

  unsigned long n                         length of vectors
*/

/* answers to question17:
  b. since the cumulative sum could be seen as the sum of the i-th element in
  the arrays plus the previous cumulative sum, it can be possible store the
  previous cumsum using a static variable. Doing so, a nested loop is avoided
  together with multiple calculations of the same values.
  Using only one loop, the function has linear time complexity.

  c. The function is tested using a main program, where the user is prompted to
  enter the desired length. The macro preprocessor DEBUG allows for information
  to be printed. Moreover, the same array configurations have been tested in
  MATLAB, yielding the same results.

*/

#include <stdio.h>
#include <stdlib.h>                       /* dynamic memory allocation */

#define DEBUG
#define N 5;

static unsigned long partial_sum;
static unsigned long counter;

/* function prototype */
void cumsum(
  const double * x,                       /* pointer to x[0] */
  double * y,                             /* pointer to y[0] */
  unsigned long n                         /* length of arrays */
);


/* main program for testing */
int main(int argc, char const *argv[]) {

  /* promt the user to enter the length */
  unsigned long n;
  printf("enter (positive) length of arrays: ");
  scanf("%lu", &n);

  /* handle case for zero length */
  if (!n) {
    n = N;
  }

  /* allocate memory for the arrays */
  double * x = malloc(n * sizeof(double));
  double * y = malloc(n * sizeof(double));

  /* set elements in x, base case x[i] = i */
  for (size_t i = 0; i < n; i++) {
    x[i] = i;
  }

  /* call the cumulative sum function */
  cumsum(x, y, n);
  #ifdef DEBUG
  printf("Total calls: %lu\n", counter);
  #endif

  /* free memory */
  free(x);
  free(y);
  x = y = NULL;

  return 0;
}

/* function declaration */
void cumsum(const double * x, double * y, unsigned long n){
  /* compute cumsum */
  for (unsigned long i = 0; i < n; i++) {
    counter += 1;
    y[i] = partial_sum + x[i];
    #ifdef DEBUG
    printf("%g\n", y[i]);
    #endif

    /* update static variable */
    partial_sum = y[i];
  }
}
