/* 02635
  MATHEMATICAL SOFTWARE PROGRAMMING
  FINAL EXAM
  accessory code to questions 1-16

*/

#include <stdio.h>

/* define static variable for time complexity */
static unsigned int counter;

/* define static variables for implicit stack */
static unsigned long stack = 1;
static unsigned long depth = 1;

/* 7, slightly modified prototype to allow for space complexity */
unsigned long fun(unsigned long n, unsigned long stack);
/* 9, function prototype */
double * quad_eval(double a, double b, double c, double x);

/* testing program */
int main(int argc, char const *argv[]) {

  /* test associative property for integers */
  // int a = 2, b = 3, c = 4;
  // printf("%d, %d\n", (a+b)+c, a+(b+c));

  /* checking recursion time and space complexity */
  for (unsigned long n = 0; n < 100; n++) {
    // printf("-----------------\n");
    // printf("\n\nn = %lu\n", n);
    counter = 0;
    // printf("Value: %lu\n", fun(n,stack));
    // printf("TOTAL FUNCTION CALLS: %i\n\n", counter);
    // printf("Depth in the implicit stack: %lu\n", depth);
  }

  /* checking implementation problem for 9 */
  double a = 1.0, b = 1.0, c = 1.0, x = 2.0;
  printf("%lf\n", *quad_eval(a, b, c, x));

  return 0;
}


/* 7, function definition */
unsigned long fun(unsigned long n, unsigned long stack) {
  counter += 1;

  /* keep track of stack and depth */
  depth = stack >= depth? stack : depth;

  /* recursive function */
  if (n == 0) return 0;
  return fun(n-1, stack+1) + 2*n - 1;
}

/* 9, function definition */
double * quad_eval(double a, double b, double c, double x) {
  double *pv;       /* obs: a pointer is allocated each time but not freed */
  double val = b;
  pv = &val;
  val += a*x;
  val *= x;
  val += c;
  return pv;
}
