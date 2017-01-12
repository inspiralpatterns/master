/*
question18.c
purpose
  function that transposes a sparse matrix in-place, i.e. without allocation of
  a new one.

arguments
  sparse_triplet_t                     structure containing matrix information
*/

#include <stdlib.h>

/* definition of sparse triplet abstract data type */
typedef struct sparse_triplet {
unsigned long m; /* number of rows */
unsigned long n; /* number of columns */
unsigned long nnz; /* number of nonzeros */
unsigned long * I; /* pointer to array with row indices */
unsigned long * J; /* pointer to array with column indices */
double * V; /* pointer to array with values */
} sparse_triplet_t;


/* function prototype */
void trans_sparse_triplet(sparse_triplet_t * sp);

/* function definition */
void trans_sparse_triplet(sparse_triplet_t * sp){
  /* implementation strategy
  a. swap m with n;
  b. swap row and column indices
  */
  unsigned long tmp = sp->m;
  /* a. swap rows and columns number */
  sp->m = sp->n;
  sp->n = tmp;

  /* allocate memory of length equal to nnz*/
  unsigned long * buffer = malloc(sp->nnz * sizeof(*sp));

  /* b. copy I inside buffer, and swap I and J then */
  for (unsigned long i = 0; i < sp->nnz; i++) {
    buffer[i] = sp->I[i];
    sp->I[i] = sp->J[i];
    sp->J[i] = buffer[i];
  }

  /* free memory allocated */
  free(buffer);
  buffer = NULL;
}
