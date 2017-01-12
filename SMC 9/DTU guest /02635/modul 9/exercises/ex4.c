/* ex4.c
  using the CBLAS routine dgemv for general matrix-vector multiplication.
*/

#include <stdlib.h>
#include <stdio.h>

#if defined(__MACH__) && defined(__APPLE__)
#include <Accelerate/Accelerate.h>
#else
#include <cblas.h>
#endif

int main(int argc, char const *argv[]) {
  double A[3][4] = {{1,2,3,4},{-2,1,-3,4},{5,6,7,8}};
  double Y[3] = {1,-1,1};
  double X[4] = {0};
  double alpha, beta;
  alpha = 1.0;
  beta = 0.0;
  double lda = 4;   // leading dimension, i.e. number of columns in row-major

  /*USING THE CBLAS_DAXPY ROUTINE */
  /* 1. computation of the matrix operation x = At * y */
  cblas_dgemv(CblasRowMajor, CblasTrans, 3, 4, alpha, *A, lda,
    Y, 1, beta, X, 1);

  printf("\n...computing x = A' * y\n");
  for (int i = 0; i < 4; i++) printf("x[%d] = % g\n", i, X[i]);


  /* 2. computation of the sum of all rows in A */
  double Z[4] = {1,1,1,1};    // to compute innner product
  double sum[3] = {0,0,0};    // to store the sum of the rows in A
  cblas_dgemv(CblasRowMajor, CblasNoTrans, 3, 4, 1.0, *A, lda,
    Z, 1, beta, sum, 1);

  printf("\n...computing the sum of all rows in A\n");
  for (int i = 0; i < 3; i++) printf("sum of A[%d] = % g\n", i, sum[i]);

  /* 3. computation of the sum of last three columns in A
  obs:
  - pointer to the last three column of A is *A+1;
  - slice has 3 rows, 3 columns, stride 3 and lda 4

  we therefore use the transpose version */
  double I[3] = {1,1,1};       // to compute inner product
  cblas_dgemv(CblasRowMajor, CblasTrans, 3, 3, alpha, *A+1, 4, I, 1, beta, sum, 1);

  printf("\n...computing the sum of the last three columns in A\n");
  for (int i = 0; i < 3 ; i++) printf("sum of column no. %d = % g\n", i+2, sum[i]);

  /* 4. computation of 2 * (A[0] + A[1]) + A[end]
  obs: using two different slices of A to implement the general formula */

  double B[4] = {1,1};
  double C[4] = {0};

  /* initialize C with the last row of A */
  for (int i = 0; i < 3 ; i++) C[i] = A[2][i];

  cblas_dgemv(CblasRowMajor, CblasTrans, 2, 4, 2.0, *A, 4, B, 1, 1.0, C, 1);
  printf("\n...computing 2 * (A[0] + A[1]) + A[end]\n");
  for (int i = 0; i < 4 ; i++) printf("A[3][%d] = % g\n", i+1, C[i]);

  return 0;
}
