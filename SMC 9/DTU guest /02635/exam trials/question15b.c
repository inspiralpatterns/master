/*
purpose:
  write a function that approximates the derivative using forward-difference
  approximation. Investigation on the choice of h has to be made.

arguments:
  double x:                         input variable
  double h:                         input variable (for forward-difference)

  double df:                        output value for differentiation
*/


#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define EPSILON 1e-3

/* function prototype */
double df(double x, double h);


/* main program to test */
int main(int argc, char const *argv[]) {
  double h = 1e-2;
  double x = 0.6;

  double dfx = df(x, h);
  printf("%.4lf\n", dfx);
  return 0;
}


/* function definition */
double df(double x, double h){
  double fx = (2*x*x - 4*x) / (2*x*x + 2*x + 3);    /* function to derivate */
  double hx = x + h;                                /* derivative of f at x */
  double fhx = (2*hx*hx - 4*hx) / (2*hx*hx + 2*hx + 3);
  
  /* take derivative using forward-difference approximation */
  double dfx = (fhx - fx) / h;
  /* print both the derivative and h */
  printf("%lf, h = %lf\n", dfx, h);

  /*
  issues in choice of h:
  - too small h could lead to catastrophic cancellation;
  - too large h could lead to poor accuracy
  */

  if (dfx == isnan(dfx)  || dfx < 0) {
    /* try to compute the derivative using h + eps */
    return df(x, h + EPSILON);
  }

  return dfx;
}
