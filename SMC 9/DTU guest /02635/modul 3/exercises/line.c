/* line.c
compute the approximate line integral of a function g(t) using trapezoidal
rule with n subintervals. The function is given together with the grid
coordinates defined by two-pair coordinates values */

#include <stdio.h>
#include <math.h>


int main(void) {
  double val, t;
  int n = 2;

  // define the grid coordinate (0,0) and (1,1)
  double xl, xu, yl, yu;
  double xt, yt;
  double gt, g_t1, g_t2;
  xl = 0; yl = 0; xu = 1; yu = 1;

  // evaluate g(t) for integration limits
  g_t1 = cos(1 - xl*yl);
  g_t2 = cos(1 - xu*yu);

  // compute the distance between the two points (needed in integration formula)
  double D = sqrt((xu-xl)*(xu-xl) + (yu-yl)*(yu-yl));

  /* Trapezoidal rule */
  // define the initial value
  val = 0.5*(g_t1 + g_t2);

  // loop over the number of intervals
  // obs: the loop serves to compute the sum of the evaluated f(a + i*h)
  for (int i = 1; i < n; i++) {

    // compute the values of t (considering a = t1 = 0)
    t = (double) i/n;

    /* write variables using parametrization of the line segment passing
    through the defined points (function of t) */
    xt = xl + t*(xu-xl);
    yt = yl + t*(yu-yl);

    gt = cos(1 - xt*yt);
    val += gt;
  }

  /* scale the resulting value
  obs: D is a constant so it's outside the integration and we divide by n
  because (b-a) = 1, so multiplying for h equates to dividing by the factor n */
  val *= D/n;

  printf("Repeated trapezoidal rule for %i subdivisons: %.4le\n",n,val);

  return 0;
}
