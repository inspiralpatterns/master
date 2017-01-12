/* time_test.c
  Purpose:
    check the CPU time for n = [8,16,32,64,128,256]

  Arguments:
    none

  Return value:
    none
*/

#include "linalg.h"
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#if defined(__MACH__) && defined(__APPLE__)
#include <Accelerate/Accelerate.h>
#else
#include <cblas.h>
#include <lapack.h>
#endif

int main(void) {
  /* loop over powers of two */
  size_t i = 8;
  double cpu_time;
  clock_t T1, T2;

  /* create a matrix where to store results of cpu time computation for each n */
  matrix_t * cpu_results = malloc_matrix(10, 3);
  int row = 0;

  for ( ; i <= 4096; i *= 2) {
    /* a. check time for matrix and vector allocation */
    printf("CPU time for n = %lu:\n\n", i);
    T1 = clock();
    matrix_t * pm = malloc_matrix(i, i);
    T2 = clock();
    cpu_time = ((double) T2 - T1) / CLOCKS_PER_SEC;
    printf("matrix allocation: %.6g ms\n", cpu_time*1e3);
    cpu_results->A[row][0] = cpu_time*1e3;

    T1 = clock();
    vector_t * pv = malloc_vector(i);
    T2 = clock();
    cpu_time = ((double) T2 - T1) / CLOCKS_PER_SEC;
    printf("vector allocation: %.6g ms\n", cpu_time*1e3);
    cpu_results->A[row][1] = cpu_time*1e3;

    /* b. check time for dgesv_ routine */
    T1 = clock();

    /*** begin code from solve.c ***/
    matrix_t * I = malloc_matrix(i, i);
    matrix_t * C = malloc_matrix(i, i);
    for (size_t j = 0; j < i; j++) {
      I->A[j][j] = 1;
    }

    int * M = (int *) malloc(sizeof(int)); *M = i;
    int * NRHS = (int *) malloc(sizeof(int)); *NRHS = 1;

    int * lda = (int *) malloc(sizeof(int)); *lda = i;
    int * ldb = (int *) malloc(sizeof(int)); *ldb = i;
    int * ldc = (int *) malloc(sizeof(int)); *ldc = i;
    int * ldi = (int *) malloc(sizeof(int)); *ldi = i;

    //printf("call to dgemm\n");
    cblas_dgemm(CblasRowMajor, CblasTrans, CblasNoTrans,
      *M, i, *M, 1.0, pm->A[0], *lda, I->A[0], *ldi, 1.0, C->A[0], *ldc);
    //printf("call succedeed\n");

    //printf("free pointer to allocated memory\n");
    free(pm->A[0]);
    //printf("free pointer to array of pointers\n");
    free(pm->A);
    pm = C;
    free_matrix(I); I = NULL;
    int * ipiv = (int *) malloc(i*sizeof(int));
    if ( ipiv == NULL ) { MEM_ERR; }
    int * info = malloc(sizeof(int));
    //printf("call to dgesv\n");
    dgesv_(M, NRHS, pm->A[0], lda, ipiv, pv->v, ldb, info);
    /* end of code from solve.c */

    T2 = clock();
    //printf("calculating cpu time...\n");
    cpu_time = ((double) T2 - T1) / CLOCKS_PER_SEC;
    printf("dgesv routine: %.6g ms\n", cpu_time*1e3);
    cpu_results->A[row][2] = cpu_time*1e3;
    printf("\n/*********************************/\n\n");

    /* update row pointer to result matrix */
    row++;
  }

  /* write the results into a new text tile */
  int exit_code = write_matrix("cpu_result.txt", cpu_results);
  /* error handling */
  if (!(exit_code == LINALG_SUCCESS)) {
    printf("unable to write solution onto a textfile.\n");
    return EXIT_FAILURE;
  }
  else printf("write succedeed\n");

  return EXIT_SUCCESS;
}
