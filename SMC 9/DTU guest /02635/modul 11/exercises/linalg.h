/* DTU 02635 Mathematical Software Programming

  Basic linear algebra library
  Version: 1.0
*/
#ifndef LINALG_H
#define LINALG_H

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

/* Macros */
#define LINALG_FAILURE -1
#define LINALG_SUCCESS 0
#define LINALG_MEMORY_ERROR 1
#define LINALG_FILE_ERROR 2
#define LINALG_ILLEGAL_INPUT 3
#define LINALG_DIMENSION_MISMATCH 4
#define MEM_ERR fprintf(stderr,"%s: failed to allocate memory\n",__func__)
#define FILE_ERR(x) fprintf(stderr,"%s: failed to open file %s\n",__func__,x)
#define INPUT_ERR fprintf(stderr,"%s: received NULL pointer as input\n",__func__)
#define DIM_ERR_1 fprintf(stderr,"%s: dimensions mismatch. A is not square\n",__func__)
#define DIM_ERR_2 fprintf(stderr,"%s: dimensions mismatch. Length of b != order of matrix A\n",__func__)


/* Structure representing a vector */
typedef struct vector {
  unsigned long n;   /* length of vector                     */
  double * v;        /* pointer to array of length n         */
} vector_t;

/* Structure representing a matrix */
typedef struct matrix {
  unsigned long m;   /* number of rows                       */
  unsigned long n;   /* number of columns                    */
  double ** A;       /* pointer to two-dimensional array     */
} matrix_t;

/* Structure representing a sparse matrix in triplet form */
typedef struct sparse_triplet {
	unsigned long m;   /* number of rows                       */
	unsigned long n;   /* number of columns                    */
	unsigned long nnz; /* number of nonzeros                   */
	unsigned long * I; /* pointer to array with row indices    */
	unsigned long * J; /* pointer to array with column indices */
	double * V;        /* pointer to array with values         */
} sparse_triplet_t;

/**********************/
/* Prototypes         */
/**********************/

/* Allocation/deallocation */
vector_t * malloc_vector(unsigned long n);
void free_vector(vector_t * pv);
matrix_t * malloc_matrix(unsigned long m, unsigned long n);
void free_matrix(matrix_t * pm);
sparse_triplet_t * malloc_sparse_triplet(unsigned long m, unsigned long n, unsigned long nnz);
void free_sparse_triplet(sparse_triplet_t * pst);

/* File input/output */
vector_t * read_vector(const char * filename);
int write_vector(const char * filename, const vector_t * pv);
matrix_t * read_matrix(const char * filename);
int write_matrix(const char * filename, const matrix_t * pm);
sparse_triplet_t * read_sparse_triplet(const char * filename);
int write_sparse_triplet(const char * filename, const sparse_triplet_t * pst);

/* Printing */
void print_vector(vector_t * pv);
void print_matrix(matrix_t * pm);
void print_sparse_triplet(sparse_triplet_t * pst);

#endif
