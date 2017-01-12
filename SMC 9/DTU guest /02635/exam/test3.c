
#include <stdio.h>

int main(int argc, char const *argv[]) {
  double data[4] = {5.0,-2.0,2.0,0.0};
  data[1] *= 2.0;
  printf("%lf\n", --data[1]);


typedef struct matrix {
  size_t m;
  size_t n;
  double **A;
} matrix_t;

matrix_t mat_arr[10];
(mat_arr+1)->m = 4;

for (size_t i = 0; i < 10; i++) {
  printf("%lu\n", (mat_arr+i)->m);
}

  return 0;
}
