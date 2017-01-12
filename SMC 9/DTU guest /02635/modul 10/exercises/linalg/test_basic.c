#include <stdlib.h>
#include <assert.h>
#include "linalg.h"

int main(void) {

  vector_t * pv=NULL;
  matrix_t * pm=NULL;
  sparse_triplet_t * pst=NULL;

  /* Allocate a vector_t, write to file, deallocate */
  pv = malloc_vector(10);
  print_vector(pv);
  assert(write_vector("test_vector.txt",pv) == LINALG_SUCCESS);
  free_vector(pv);
  pv = NULL;

  /* Allocate a matrix_t, write to file, deallocate */
  pm = malloc_matrix(3,5);
  print_matrix(pm);
  assert(write_matrix("test_matrix.txt",pm) == LINALG_SUCCESS);
  free_matrix(pm);
  pm = NULL;

  /* Allocate a sparse_triplet_t, write to file, deallocate */
  pst = malloc_sparse_triplet(3,5,12);
  print_sparse_triplet(pst);
  assert(write_sparse_triplet("test_sparse_triplet.txt",pst) == LINALG_SUCCESS);
  free_sparse_triplet(pst);
  pst = NULL;

  /* Read data from files and deallocate */
  assert(pv = read_vector("test_vector.txt"));
  free_vector(pv);
  assert(pm = read_matrix("test_matrix.txt"));
  free_matrix(pm);
  assert(pst = read_sparse_triplet("test_sparse_triplet.txt"));
  free_sparse_triplet(pst);

  /* Verify that illegal input is handled correctly */
  assert(write_vector("test.txt",NULL) == LINALG_ILLEGAL_INPUT);
  assert(write_matrix("test.txt",NULL) == LINALG_ILLEGAL_INPUT);
  assert(write_sparse_triplet("test.txt",NULL) == LINALG_ILLEGAL_INPUT);

  /* Verify error handling */
  assert(!(pv = read_vector("@$^%.txt")));
  assert(!(pm = read_matrix("@$^%.txt")));
  assert(!(pst = read_sparse_triplet("@$^%.txt")));

  return EXIT_SUCCESS;
}
