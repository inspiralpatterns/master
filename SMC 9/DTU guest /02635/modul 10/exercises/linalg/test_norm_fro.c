#include <stdlib.h>
#include <stdio.h>
#include "linalg.h"

#define DEBUG

int main(void){
    
    matrix_t * pm = NULL;
    unsigned long m,n;
    m = n = 3;
    
    /* Allocate a vector_t and fil it */
    pm = malloc_matrix(m,n);
#ifdef DEBUG
    print_matrix(pm);
#endif
    size_t i,j;
    for (i = 0; i < pm->m; i++) {
        for (j = 0; j < pm->n; j++) {
            pm->A[i][j] = i;
#ifdef DEBUG
            printf("%e  ", pm->A[i][j]);
#endif
        }
        printf("\n");
    }
    
    /* create a pointer to a double an call the Euclidean norm
     and print the exit code */
    int result;
    double * nrm = (double*) malloc(sizeof(double));
    result = norm_fro(pm, nrm);
    printf("norm is %e\n", *nrm);
    printf("exit code is %d\n", result);
    
    /* ERROR HANDLING */
    /* check for error handling when vector_t has dimension 0 */
    free_matrix(pm);
    pm = malloc_matrix(m,0);
    result = norm_fro(pm,nrm);
    printf("exit code is %d\n", result);
    /* check for error handling when pointer to vector_t is MULL */
    nrm = NULL;
    result = norm_fro(pm, nrm);
    printf("exit code is %d\n", result);
    
    /* deallocate the vector*/
    free_matrix(pm);
    pm = NULL;
    
    return EXIT_SUCCESS;
}

