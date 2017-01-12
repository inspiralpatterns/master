#include <stdio.h>

int main() {

  // create array where to store input values and their reciprocal
  double numbers[5] = {0};
  double reciprocal[5] = {0};
  // create pointer to array - use it in the code
  double* pnumbers = NULL;
  short i = 0;

  printf("Insert 5 values - could be either integer or double\n");
  while (i < 5) {
    pnumbers = numbers + i;
    printf("no. %d: ", i+1);
    scanf("%lf", pnumbers);

    // calculate reciprocal and store it
    reciprocal[i] = 1.0 / *pnumbers;

    // counter update
    ++i;
  }

  i = 0;
  double sum = 0;
  while (i < 5) {
    pnumbers = reciprocal + i;
    printf("%lf", *pnumbers);

    // get sum of reciprocals
    sum += *pnumbers;

    // for aesthetics
    i == 4? printf("\n") : printf(" ");

    ++i;
  }

  printf("Their sum is %lf\n", sum);
  return 0;
}
