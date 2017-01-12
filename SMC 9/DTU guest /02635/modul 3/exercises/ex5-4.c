#include <stdio.h>
#include <stddef.h>
#include "math.h"

int main() {

  // create multidimensional array and set it to zero
  double data[5][11] = {{0}};
  double* pdata = *data;
  double init = 2.0f;

  for (int n = 0; n < 11; n++) {
    // initialize elements in the first column
    *(pdata+n) = init;
    printf("%.2lf | ", *(pdata+n));

    // initialize each row depending on values stored in first column
    data[1][n] = 1.0/init;
    printf("%.2lf | ", data[1][n]);
    for (int j = 2; j < 5; j++) {
      data[j][n] = pow(init, j);
      printf("%.2lf | ", data[j][n]);
    }

    init += 0.1f;
    printf("\n-----------------------------------\n");
  }

  return 0;
}
