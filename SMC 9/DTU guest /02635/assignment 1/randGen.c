/* randGen.c
  generates independent random numbers either from an exponential distribution
  or from a Poisson distribution with parameter lambda. */

#include <stdio.h>
#include <ctype.h>                     // needed for toupper()
#include <time.h>                      // needed for time(NULL)

#include "array2d.h"                   // for memory allocation
#include "generators.h"                // for random variables sampling

// #define DEBUG
#define EPS 2.2e-16

/* main program */
int main(void) {
  /* output introduction banner */
  printf("-----------------------randgen.c-----------------------\n");
  printf("- generates a matrix of independent random numbers    -\n");
  printf("- either from an exponential or Poisson distribution. -\n");
  printf("-                                                     -\n");
  printf("- The matrix has dimensions m-by-n                    -\n");
  printf("- The user has to insert the dimensions and the type  -\n");
  printf("- of distribution.                                    -\n");
  printf("-------------------------------------------------------\n");
  printf("\n\n");

  /* variables for user input */
  size_t m,n;
  double lambda;
  char c;

  /* prompt for matrix dimensions and distribution type */
  printf("Please insert\n");
  printf("type (E = exp, P = Poisson): ");
  scanf("%c", &c);
  printf("lambda parameter: ");
  scanf("%lf", &lambda);
  printf("matrix dimensions (m,n): ");
  scanf("%lu,%lu", &m, &n);

  /* initialize random number generator */
  srand(time(NULL));
  /* specify generation type */
  if (c == 'E'){
    /* MEMORY ALLOCATION */
    double size;
    size_t data_size = sizeof(size);
    printf("%lu\n", data_size);
    double **gendata = (double **) malloc_array2d(m, n, data_size);
    printf("\n...generating random numbers from exponential distribution\n");

    /* DATA GENERATION */
    for (size_t i = 0; i < m; i++) {
      for (size_t j = 0; j < n; j++) {
        gendata[i][j] = expGen(lambda);
        /* print the random variable */
        printf("%2e|", gendata[i][j]);
      }
      /* new line after each column has been computed for a single row */
      printf("\n");
    }

    /* free memory and deallocate pointer */
    free_array2d((void **)gendata);
  }
  else{
    /* check for positive lambda when Poisson distribution is chosen */
    if (lambda < EPS) {
      printf("lambda not correct\n");
      return -1;
    }

    /* MEMORY ALLOCATION */
    int size;
    size_t data_size = sizeof(size);
    printf("%lu\n", data_size);
    int **gendata = (int**) malloc_array2d(m, n, data_size);
    printf("\n...generating random numbers from Poisson distribution\n");
    int method = 1;
    /* select either method 1 or 2 depending on the lambda value */
    if (lambda > 30) {
      method = 2;
    }

    /* DATA GENERATION */
    for (size_t i = 0; i < m; i++) {
      for (size_t j = 0; j < n; j++) {
        gendata[i][j] = poissonGen(lambda, method);
        printf("%2i ", gendata[i][j]);
      }
      printf("\n");
    }

    /* free memory and deallocate pointer */
    free_array2d((void **)gendata);
  }

  /* check for correctness of exponential distribution computing the sample mean */
  #ifdef DEBUG
  double z = 0.0;
  for (size_t i = 0; i < 100000; i++) {
    z += (c == 'E') ? expGen(lambda) : poissonGen(lambda, method);
  }
  z /= 100000.0;
  printf("mean = %e\n", z);
  if (c == 'E') printf("lambda^-1 = %e\n", pow(lambda, -1));
  else printf("lambda = %e\n", lambda);
  #endif

  return 0;
}

/* EOF */
