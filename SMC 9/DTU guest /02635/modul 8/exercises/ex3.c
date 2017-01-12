/* function to read a sparse matrix in triplet form from a textfile
OBS: a sparse matrix C of size m-by-n can be represented as a set of triplets
of the form (x_coord, y_coord, val) */

#include <stdio.h>
#include <stdlib.h> // required for malloc

typedef struct sparse_triplet sparse; // make code reading easier
#define DEBUG

/* Structure representing a sparse matrix in triplet form */
struct sparse_triplet {
    unsigned long m;   /* number of rows     */
    unsigned long n;   /* number of columns  */
    unsigned long nnz; /* number of nonzeros */
    unsigned long * I; /* pointer to array with row indices    */
    unsigned long * J; /* pointer to array with column indices */
    double * V;        /* pointer to array with values         */
};

 sparse * read_sparse(const char * filename){

  /* open the file */
  FILE * pfile = NULL;
  pfile = fopen(filename, "r");
  if (pfile == NULL) {
    printf("Memory allocation error\n");
    return NULL; // the function return a pointer to struct!
  }

  /* allocating memory for the structure */
  sparse * matrix = malloc(sizeof(sparse));

  /* parse the first line of code and determine m, n and nnz */
  fscanf(pfile, "%lu %lu %lu", &matrix->m, &matrix->n, &matrix->nnz);

  #ifdef DEBUG
  printf("FOR DEBUG: \n");
  printf("%lu\n", matrix->m);
  printf("%lu\n", matrix->n);
  printf("%lu\n", matrix->nnz);
  printf("\n");
  #endif

  /* allocate memory for the row/columns indices and nonzero values */
  matrix->I = malloc(matrix->nnz * sizeof(matrix->m));
  matrix->J = malloc(matrix->nnz * sizeof(matrix->n));
  matrix->V = malloc(matrix->nnz * sizeof(matrix->nnz));

  /* read the remaining lines and fill the arrays */
  for (size_t i = 0; i < matrix->nnz ; i++) {
    fscanf(pfile, "%lu %lu %lf", matrix->I + i, matrix->J + i,
    matrix->V + i);

    /* convert indices to 0-based indices */
    matrix->I[i] --;
    matrix->J[i] --;
  }

  /* close the file */
  fclose(pfile);
  pfile = NULL;

  return matrix;
}

void free_sparse(sparse * matrix){
  free(matrix->I);
  free(matrix->J);
  free(matrix->V);

  /* free the whole structure */
  free(matrix);
  matrix = NULL;
}


/* main program to test the function */
int main(int argc, char const *argv[]) {

  char * filename = "triplet.txt";
  sparse * matrix = read_sparse(filename);

  /* print the result */
  printf("row | col | value \n");
  for (size_t i = 0; i < matrix->nnz; i++) {
    printf(" %lu     ", matrix->I[i]);
    printf("%lu     ", matrix->J[i]);
    printf("%.2lf\n", matrix->V[i]);
  }

  free_sparse(matrix);
  return 0;
}
