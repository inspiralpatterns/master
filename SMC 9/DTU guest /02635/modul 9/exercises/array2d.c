/* array2d.c
  MEMORY MANAGEMENT */

/* CHECK FOR VOID TYPE SO TO ALLOW DIFFERENT DATA TYPE */
#include "array2d.h"

/* memory allocation */
void ** malloc_array2d(size_t m, size_t n, size_t data_size){

  /* 'fast-matrix' allocation method, WSS p. 94 */
  /* pointer to array of pointers */
  void ** pointer;
  size_t i;
  /* allocate pointer array of length m */
  pointer = malloc(m*sizeof(data_size));
  if(pointer == NULL){
    return NULL;
  }
  /* allocate storage for m*n entries */
  pointer[0] = malloc(m*n*sizeof(data_size));
  if (pointer[0] == NULL) {
    free(pointer);
    return NULL;
  }
  /* set the pointers */
  for (i = 1; i < m; i++) {
    pointer[i] = pointer[0] + i*n;
  }

return pointer;
}


/* memory deallocation */
void free_array2d(void ** pointer) {
  if (pointer == NULL) return;
  free(pointer[0]);
  free(pointer);
  return;
}

/* EOF */
