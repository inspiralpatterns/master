/* ex 2.c
  using the BLAS library to scale different part of a two-dimensional matrix
*/

  #include <stdlib.h>
  #include <stdio.h>
  #include "array2d.h"

  #if defined(__MACH__) && defined(__APPLE__)
  #include <Accelerate/Accelerate.h>
  #else
  #include <cblas.h>
  #endif

int main(int argc, char const *argv[]) {
  /* creating a 5-by-5 matrix using the fast allocation method */
  size_t m, n, size;
  m = n = 5;
  size = sizeof(double);
  // double ** A;
  // A = (double **) malloc_array2d(m, n, size);
  double A[m][n];

  /* set all elements to 1.0 */
  for (size_t i = 0; i < m; i++) {
    for (size_t j = 0; j < n; j++) {
      A[i][j] = 1.0;
      printf("%.2lf ", A[i][j]);
    }
    printf("\n");
  }

  /* USING THE DSCAL ROUTINE */
  /* 1. scale the second row by 2.5 */
  double a = 2.5;   // scaling factor
  int incx = 1;     // stride for a row
  int len = m;      // length of row in array
  cblas_dscal(len, a, *A+n, incx);
  printf("\n...scaling second row by 2.5\n");

  /* print the scaled matrix */
  for (size_t i = 0; i < m; i++) {
    for (size_t j = 0; j < n; j++) {
      printf("%.2lf ", A[i][j]);
    }
    printf("\n");
  }

  /* 2. scale the third column by 0.2 */
  a = 0.2;
  incx = 5;
  len = n;
  cblas_dscal(len, a, *A+2, incx);
  printf("\n...scaling third column by 0.2\n");


  /* print the scaled matrix */
  for (size_t i = 0; i < m; i++) {
    for (size_t j = 0; j < n; j++) {
      printf("%.2lf ", A[i][j]);
    }
    printf("\n");
  }

  /* scale diagonal elements by 2.0 */
  a = 2;
  incx = 6;
  len = n;
  cblas_dscal(len, a, *A, incx);
  printf("\n...scaling diagonal elements by 2\n");

  /* print the scaled matrix */
  for (size_t i = 0; i < m; i++) {
    for (size_t j = 0; j < n; j++) {
      printf("%.2lf ", A[i][j]);
    }
    printf("\n");
  }
  return 0;
}
