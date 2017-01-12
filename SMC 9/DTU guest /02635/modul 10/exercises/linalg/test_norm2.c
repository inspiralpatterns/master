#include <stdlib.h>
#include <stdio.h>
#include "linalg.h"

#define DEBUG

int main(void){

    vector_t * pv = NULL;

    /* Allocate a vector_t and fil it */
    pv = malloc_vector(5);
#ifdef DEBUG
    print_vector(pv);
#endif
    size_t i;
    for (i = 0; i < pv->n; i++) {
        pv->v[i] = i;
#ifdef DEBUG
        printf("%e\n", pv->v[i]);
#endif
    }

    /* create a pointer to a double an call the Euclidean norm
     and print the exit code */
    int result;
    double * nrm = (double*) malloc(sizeof(double));
    result = norm2(pv, nrm);
    printf("norm is %e\n", *nrm);
    printf("exit code is %d\n", result);

    /* ERROR HANDLING */
    /* check for error handling when vector_t has dimension 0 */
    free_vector(pv);
    pv = malloc_vector(0);
    result = norm2(pv,nrm);
    printf("exit code is %d\n", result);
    /* check for error handling when pointer to vector_t is MULL */
    nrm = NULL;
    result = norm2(pv, nrm);
    printf("exit code is %d\n", result);

    /* deallocate the vector*/
    free_vector(pv);
    pv = NULL;

    return EXIT_SUCCESS;
}
