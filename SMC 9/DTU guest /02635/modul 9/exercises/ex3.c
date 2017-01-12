/* ex3.c
  using the BLAS routine daxpy for simple vector operations and for row and
  column manipulation in matrix
*/

#include <stdlib.h>
#include <stdio.h>

#if defined(__MACH__) && defined(__APPLE__)
#include <Accelerate/Accelerate.h>
#else
#include <cblas.h>
#endif

int main(int argc, char const *argv[]) {
  /* create a two-dimensional array */
  double A[4][3] = {{1,2,3},{4,5,6},{7,8,9},{10,11,12}};

  /* print the matrix */
  for (size_t i = 0; i < 4; i++) {
    for (size_t j = 0; j < 3; j++) {
      printf("%.2lf ", A[i][j]);
    }
    printf("\n");
  }

  /*USING THE CBLAS_DAXPY ROUTINE */
  /* 1. subtract 4.0 * A[0] from A[1] */
  cblas_daxpy(3, -4.0, *A, 1, *A+3, 1);
  printf("\n...subtract 4.0 * A[0] from A[1]\n");

  /* print the scaled matrix */
  for (size_t i = 0; i < 4; i++) {
    for (size_t j = 0; j < 3; j++) {
      printf("%.2lf ", A[i][j]);
    }
    printf("\n");
  }

  /* 2. subtract 7.0 * A[0] from A[2] */
  cblas_daxpy(3, -7.0, *A, 1, *A+(3*2), 1);
  printf("\n...subtract 4.0 * A[0] from A[2]\n");

  /* print the scaled matrix */
  for (size_t i = 0; i < 4; i++) {
    for (size_t j = 0; j < 3; j++) {
      printf("%.2lf ", A[i][j]);
    }
    printf("\n");
  }

  /* 3. subtract 10.0 * A[0] from A[3] */
  cblas_daxpy(3, -10.0, *A, 1, *A+(3*3), 1);
  printf("\n...subtract 4.0 * A[0] from A[3]\n");

  /* print the scaled matrix */
  for (size_t i = 0; i < 4; i++) {
    for (size_t j = 0; j < 3; j++) {
      printf("%.2lf ", A[i][j]);
    }
    printf("\n");
  }

  /* 4. subtract the second column from the third column */
  cblas_daxpy(4, -1.0, *A+1, 3, *A+2, 3);
  printf("\n...subtract *A+1 from *A+2\n");

  /* print the scaled matrix */
  for (size_t i = 0; i < 4; i++) {
    for (size_t j = 0; j < 3; j++) {
      printf("%.2lf ", A[i][j]);
    }
    printf("\n");
  }

  return 0;
}
