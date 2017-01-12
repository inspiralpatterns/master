/*
question19.c
purpose
  compute an exponential moving average of a series of numbers.
  This function is defined recursively.

arguments
  const double * x                        pointer to input vector
  double * y                              pointer to output vector
  unsigned long n                         length of vectors
  double alpha                            costant (0 either 1)
*/

/* answers to question19:
  b. The function is defined recursively but it can't be recursively implemented
  though. That is because of its output type, i.e. it's not possible to return
  any previous result. Moreover, the arguments type calls for a iterative
  implementation where a static variable keeps track of the previous value of
  the exponential moving average. Doing so, a linear time complexity is achieved.

  c. The function is tested using a main program, where the user is prompted to
  enter the desired length. The macro preprocessor DEBUG allows for information
  to be printed.
*/

#include <stdio.h>
#include <stdlib.h>                       /* dynamic memory allocation */

#define DEBUG
#define N 5;

static double prev;

/* function prototype */
void ema(
  const double * x, /* pointer to x[0] */
  double * y, /* pointer to y[0] */
  unsigned long n, /* length of arrays */
  double alpha /* constant alpha */
);


/* main program for testing */
int main(int argc, char const *argv[]) {

  /* promt the user to enter the length */
  unsigned long n;
  double alpha;
  printf("enter (positive) length of arrays: ");
  scanf("%lu", &n);
  printf("enter (non-negative) constant alpha: ");
  scanf("%lf", &alpha);

  /* handle case for zero length and/or negative alpha using hard coding */
  if (!n) {
    n = N;
  }

  if (alpha < 0) {
    alpha = 0.5;
  }

  /* allocate memory for the arrays */
  double * x = malloc(n * sizeof(double));
  double * y = malloc(n * sizeof(double));

  /* set elements in x, base case x[i] = i */
  for (size_t i = 0; i < n; i++) {
    x[i] = i;
  }

  /* call the exponential moving average function */
  ema(x, y, n, alpha);

  /* free memory */
  free(x);
  free(y);
  x = y = NULL;

  return 0;
}


/* function declaration */
void ema(const double * x, double * y, unsigned long n, double alpha){
  /* keep track of the time complexity for the recursive function */
  for (unsigned long k = 0; k < n; k++) {
    if (!k) y[k] = x[k];

    else y[k] = alpha * x[k] + (1 - alpha) * prev;
    #ifdef DEBUG
    printf("%g %6g + %6g = %6g\n", x[k], alpha*x[k], (1 - alpha) * prev, y[k]);
    #endif

    /* update static variable */
    prev = y[k];
  }
}
