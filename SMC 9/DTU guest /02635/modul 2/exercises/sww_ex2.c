#include <stdio.h>
#include <math.h>


int main(int argc, char const *argv[]) {

  double x = 1e-36;
  double tmp;

  tmp = sin(x*0.5);
  printf("%e\n", (2*tmp*tmp)/(x*x));

  return 0;
}
