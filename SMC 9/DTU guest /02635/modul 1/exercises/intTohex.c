#include <stdio.h>

int main(void) {
  long num = 2343432205;    // note: use long because it ranges outside the int boundaries

  /*represent the integer number as hexadecimal
  - `l` represent the argument type
  - `X` makes hex values capitalized*/
  printf("%lX\n", num);
  return 0;
}
