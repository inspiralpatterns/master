/* solve.c
  Purpose:
    solves the system of equations Ax = b using dgesv routine from the
    LAPACK library

  Arguments:
    argv[1]                         file containing matrix `A`
    argv[2]                         file containing vector `b`

  Return value:
    EXIT_SUCCESS
*/

#include "linalg.h"
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#if defined(__MACH__) && defined(__APPLE__)
#include <Accelerate/Accelerate.h>
#else
#include <cblas.h>
#include <lapack.h>
#endif

/* prepocessor key for debug printing */
//#define DEBUG
#define PRINT

int main(int argc, char *argv[]) {

  /* 0. prompt the user about usage */
  if (argc < 3) {
    printf("arguments are not enough.\n");
    printf("usage: ./solve matrix.txt vector.txt\n");
    return EXIT_FAILURE;
  }

  /* 1. reading section */
  /* create pointers to structures */
  vector_t * pv = NULL;
  matrix_t * pm = NULL;

  /* read matrix and vector from input files and error handling */
  /* a. using assertions */
  assert(!(pm = read_matrix(argv[1])));
  assert(!(pv = read_vector(argv[2])));

  /* file error checking */
  pm = read_matrix(argv[1]);
  pv = read_vector(argv[2]);
  if (pm == NULL) {
    printf("%s: file not existing\n", argv[1]);
    return LINALG_FILE_ERROR;
  }
  else if (pv == NULL) {
    printf("%s: file not existing\n", argv[2]);
    return LINALG_FILE_ERROR;
  }

  /* Dimension mismatch error checking */
  /* a. matrix is not square */
  if (!(pm->m == pm->n)) {
    DIM_ERR_1;
    return LINALG_DIMENSION_MISMATCH;
  }
  /* b. length of vector is not equal as order of matrix */
  if (!(pm->m == pv->n)) {
    DIM_ERR_2;
    return LINALG_DIMENSION_MISMATCH;
  }

  #ifdef DEBUG
  print_matrix(pm);
  print_vector(pv);
  #endif


  /* 2. call the algebraic routine */
  /* 2.1: transpose A (LAPACK library assumes column-major ordering) */
  matrix_t * I = malloc_matrix(pm->m, pm->n);
  matrix_t * C = malloc_matrix(pm->m, pm->n);
  for (size_t i = 0; i < I->m; i++) {
    I->A[i][i] = 1;
  }
  #ifdef DEBUG
  print_matrix(I);
  #endif

  int * M = (int *) malloc(sizeof(int));            // order of A (i.e.  no of rows)
  *M = pm->m;
  int * NRHS = (int *) malloc(sizeof(int));         // numbers of right-hand sides
  *NRHS = 1;                                        // specific case: B is vector

  int * lda = (int *) malloc(sizeof(int));
  int * ldb = (int *) malloc(sizeof(int));
  int * ldc = (int *) malloc(sizeof(int));
  int * ldi = (int *) malloc(sizeof(int));
  *lda = pm->n;
  *ldb = pv->n;
  *ldc = C->n;
  *ldi = I->n;

  /* call cblas routine for general matrix matrix operations */
  cblas_dgemm(CblasRowMajor, CblasTrans, CblasNoTrans,
    *M, I->n, *M, 1.0, pm->A[0], *lda, I->A[0], *ldi, 1.0, C->A[0], *ldc);
  #ifdef DEBUG
  printf("...matrix transposed.\n");
  print_matrix(C);
  #endif

  /* copy transposed matrix and free memory */
  free(pm->A[0]);
  free(pm->A);
  pm = C;
  /* obs: free_matrix(pm) not called because pm is now pointer to matrix C*/
  free_matrix(I);
  I = NULL;
  #ifdef DEBUG
  printf("...pointer updated and memory freed.\n");
  print_matrix(pm);
  #endif

  /* create array of int for pivoting information */
  int * ipiv = (int *) malloc((*M)*sizeof(int));
  if ( ipiv == NULL ) { MEM_ERR; }
  #ifdef DEBUG
  printf("...pivoting vector created.\n");
  #endif

  /* create argument info for status returning */
  int * info = malloc(sizeof(int));
  /* 2.2 solve the system of equations using dgesv routine */
  /* obs: solution matrix X is stored in B */
  dgesv_(M, NRHS, pm->A[0], lda, ipiv, pv->v, ldb, info);

  /* check for success or fail if dgesv_ info is non zero */
  if (*info == 0) {
    
    /* 3. write the solution to an output file */
    int exit_code = write_vector("solution.txt",pv);
    /* error handling */
    if (!(exit_code == LINALG_SUCCESS)) {
      printf("unable to write solution onto a textfile.\n");
      return EXIT_FAILURE;
    }
    printf("Successful exit: solution has been computed.\n");
    #ifdef PRINT
    printf("Computed solution for the system is:\n");
    print_vector(pv);
    #endif
  }
  else if (*info < 0) { printf("The solution could not be computed.\n"); }
  else {printf("The solution could not be computed. A is not invertible.\n"); }

  return EXIT_SUCCESS;
}
