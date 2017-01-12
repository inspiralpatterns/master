#include "math.h"
#include <stdio.h>

int main(int argc, char const *argv[]) {
  int x = 13;
  int y = 6;

  int z;
  int zz;

  /* obs: main difference between BITWISE and LOGICAL operators! */
  z = x & y;
  zz = x && y;

  printf("%d is bitwise\n", z);
  printf("%d is logical\n", zz);

  int new = -164;
  int new_result = new >> 2;

  printf("%d is the right-shift bitwise result\n", new_result);
  /* obs: the sign bit is propagated in the right shift, so that the bits
  introduced to the right are filled with 1's */

  return 0;
}
