/* array2d.h
  header file to include in the main code */
#ifndef ARRAY2D_H
#define ARRAY2D_H

#include <stdlib.h>

/* Function prototypes */
void ** malloc_array2d(size_t m, size_t n, size_t element_size);
void free_array2d(void ** pointer);

#endif
