/*
question20.c
purpose:
  check if two vectors are orthogonal and return a boolean.
  obs: orthogonal for zero inner product.

arguments
  double * x                                  pointer to first vector
  double * y                                  pointer to second vector
  unsigned long n                             length of vectors

  int result                                  1 if true, 0 otherwise

*/

/* answers to question20:
  b. for simple case as shown in the main code, the function works as expected.
  Using the vectors given in part b) of the question, since we're adding two
  opposite nearly equal quantities we get approximation error and the inner
  product is non equal to zero. Since we're testing for equality, a good trade-off
  could be define a very small quantity and set the inner product to zero when
  smaller that EPS.
  Doing so, the result is the expected one.
*/



#include <stdio.h>
#include <stdlib.h>                       /* dynamic memory allocation */

#define DEBUG
//#define SIMPLE_TEST
#define HARD_TEST

#define N 5;
#define EPS 2.2e-16

/* function prototype */
int orthogonal(
const double * x, /* pointer to x[0] */
const double * y, /* pointer to y[0] */
unsigned long n /* length of arrays */
);


/* main program for testing */
int main(int argc, char const *argv[]) {

  unsigned long n = 2;


  /* allocate memory for the arrays */
  double * x = malloc(n * sizeof(double));
  double * y = malloc(n * sizeof(double));

  #ifdef SIMPLE_TEST
  n = 10;
  /* set elements in x, base case x[i] = i and y[i] = 0 */
  for (size_t i = 0; i < n; i++) {
    x[i] = i;
    y[i] = 0;
  }
  #endif

  #ifdef HARD_TEST
  x[0] = 0.1;
  x[1] = 0.3;
  y[0] = 3;
  y[1] = -1;
  #endif

  /* call the exponential moving average function */
  int is_orthogonal = orthogonal(x, y, n);
  printf("Vector are%s orthogonal\n", is_orthogonal? "" : " not" );

  /* free memory */
  free(x);
  free(y);
  x = y = NULL;

  return 0;
}


/* function definition */
int orthogonal(const double * x, const double * y, unsigned long n){
  /* define dot product (vector vector multiplication) */
  double dot = 0.0;

  for (unsigned long i = 0; i < n; i++) {
    dot += x[i] * y[i];
    #ifdef HARD_TEST
    printf("%.20lf\n", x[i] * y[i]);
    #endif
  }

  #ifdef HARD_TEST
  printf("Inner product is%g\n", dot);
  if (dot < EPS) dot = 0;
  printf("Approximation error due to floating point arithmetic\n");
  #endif

  return dot == 0? 1 : 0;
}
