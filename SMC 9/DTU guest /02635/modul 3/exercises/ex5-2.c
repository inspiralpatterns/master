#include <stdio.h>
#include <stddef.h>

int main() {

  double data[100] = {0};
  int i = 3;
  double sum = 0;

  for (int n = 0; n < sizeof(data)/sizeof(data[0]); n++) {
    data[n] = 1.0 / ((i-1)*i*(i+1));
    //printf("%d: %e\n", n, data[n]);
    i += 2;
  }

  for (int n = 0; n < sizeof(data)/sizeof(data[0]); n++) {
    if (n%2 == 0) {
      sum += data[n];
    }
    else {
      sum -= data[n];
    }
    //printf("%d: %e\n", n, sum);
  };

  printf("\nThe magic value: %e\n", 4*sum + 3);
  return 0;
}

/* obs: sizeof(data)/sizeof(data[0]) gives the number of elements in the array
given the total amount of memory over the single element one (in this case
8 bytes each since it's of type double) */
