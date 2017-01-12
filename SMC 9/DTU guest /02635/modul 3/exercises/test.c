#include <stdio.h>

int main(void) {
  int arr[10] = {19,74,13,67,44,80,7,36,9,77}, *p = arr;
  int i = -1;
  double val = 0.0;

  while (i++ < 10){
    val += *(p++);
    printf("%.2d\n", *(p++));
  }

  val /= 10;
  printf("Value: %.2lf\n",val);
return 0;
}
