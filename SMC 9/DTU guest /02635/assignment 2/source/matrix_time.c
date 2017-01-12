/* matrix_time.c
  Purpose:
    check the CPU time for n = [8,16,32,64,128,256] when allocating a matrix_t

  Arguments:
    none

  Return value:
    none
*/
#include "linalg.h"
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(void) {
  /* loop over powers of two */
  size_t i = 8;
  double cpu_time;
  clock_t T1, T2;

  /* create a matrix where to store results of cpu time computation for each n */
  matrix_t * cpu_results = malloc_matrix(8, 10000);
  int row = 0;

  for ( ; i <= 512; i *= 2) {
    /* a. check time for matrix and vector allocation */
    printf("CPU time for n = %lu:\n\n", i);
    for (size_t col = 0; col < 10000; col++) {
      /* repeat allocation/deallocation 1000 times */
      T1 = clock();
      matrix_t * pm = malloc_matrix(i, i);
      T2 = clock();
      cpu_time = ((double) T2 - T1) / CLOCKS_PER_SEC;
      cpu_results->A[row][col] = cpu_time*1e3;
      free_matrix(pm);
    }

    /* update row pointer to result matrix */
    row++;
  }

  /* write the results into a new text tile */
  int exit_code = write_matrix("matrix_cpu_result.txt", cpu_results);
  /* error handling */
  if (!(exit_code == LINALG_SUCCESS)) {
    printf("unable to write solution onto a textfile.\n");
    return EXIT_FAILURE;
  }
  else printf("write succedeed\n");
  free_matrix(cpu_results);

  return EXIT_SUCCESS;
}
