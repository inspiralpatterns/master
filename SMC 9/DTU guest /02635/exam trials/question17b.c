/*
purpose
  compute the matrix-vector product of a tridiagonal matrix of order n with a
  vector of length n. In such a matrix, alpha and beta are nonzero constants.
  obs: A is not explicitely stored.

arguments
  int n                                     order of matrix and vector
  double alpha                              nonzero constant
  double beta                               nonzero constant
  double * x                                pointer to vector x

  double * tdmv                             pointer to result vector
*/

#include <stdio.h>
#include <stdlib.h>                         /* dynamic allocation */

/* function prototype */
double * tdmv(int n, double alpha, double beta, double * x);

/* main program to test the function */
int main(int argc, char const *argv[]) {
  int n = 9;
  double * x = malloc(n * sizeof(double));
  double alpha = 1, beta = 1;

  /* initialize x vector to 1 */
  for (int i = 0; i < n; i++) {
    x[i] = 1;
  }

  /* call the routine */
  double * y = tdmv(n, alpha, beta, x);

  /* print for check */
  for (int_fast32_t i = 0; i < n; i++) {
    printf("%lf\n", y[i]);
  }

  return 0;
}

/* function declaration */
double * tdmv(int n, double alpha, double beta, double * x){
  /* allocate memory for result vector */
  double * y = (double *) malloc(n * sizeof(double));

  /* compute the loop over n */
  for (int i = 0; i < n; i++) {
    if (i == 0) y[i] = alpha*x[i] + beta*x[i+1];
    else if (i == n) y[i] = beta*x[i-1] + alpha*x[i];
    else y[i] = beta*x[i-1] + alpha*x[i] + beta*x[i+1];
  }

  return y;
}
