#include <stdlib.h>
#include <stdio.h>
#define N 50

double * init_array(size_t n, double h) {
  double * p = malloc(n*sizeof(*p));
  printf("%x\n", p);
  if (p != NULL) {
    for (size_t i=0;i<n;i++){
    *(p++) = i*h;
    printf("%x\n", p);
    }
  }
  printf("p points to %g\n", *p);


  printf("%x\n", p);
  printf("p points to %g\n", *p);
  return p;
}

int main(void) {
  double h = 1.0;
  double *p = init_array(N,h);
  if (p == NULL) return EXIT_FAILURE;
  for (int k=0;k<N;k++) printf("%3d %6g\n",k,p[k]);
  free(p);
  return 0;
}
