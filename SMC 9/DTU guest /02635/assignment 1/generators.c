/* generators.c
  contains random variable generators using different distributions */

#include "generators.h"

double uniformGen(){
  /* random variable to return */
  double u;

  /* generate a pseudo-random integer */
  int i;
  i = rand();
  #ifdef DEBUG
  printf("pseudo-random integer: %i\n", i);
  #endif

  /* transformation for uniform ditribution on (0,1) */
  /* obs: data casting of RAND_MAX necessary */
  u = (double)(i + 1) / ((double)(RAND_MAX) + 2);
  #ifdef DEBUG
  printf("uniformly distributed variable: %e\n", u);
  #endif

  return u;
}


double expGen(double lambda){
  /* random variables */
  double u, z;

  /* compute uniform random variable u */
  u = uniformGen();

  /* compute exponential random variable using inverse transform sampling */
  z = - (log(1 - u) / lambda);
  #ifdef DEBUG
  printf("exponentially distributed variable: %e\n", z);
  #endif

  return z;
}

int poissonGen(double lambda, int method){
  /* swtich between the methods */
  if (method == 1){
    /* METHOD 1: using exponential distribution */
    /* requirements */
    double t = 0;
    int k = 0;

    /* data generation */
    double z;
    do {
      z = expGen(lambda);
      t += z;
      k++;
      #ifdef DEBUG
      printf("t = %lf\n", t);
      #endif
    } while(t <= 1);
    return k - 1;
  }
  else{
  /* METHOD 2: using rejection sampling */
  /* requirements */
  const double beta = M_PI / (sqrt(3.0 * lambda));
  const double alpha = beta * lambda;
  const double c = 0.767 - 3.36 / lambda;
  const double w = log(c) - lambda - log(beta);

  /* data generation */
  double u1, u2, x, k, v1, v2;
  do {
    /* first iteration: until x >= -0.5 */
    do {
      /* generate a sample u1 from uniform distribution */
      u1 = uniformGen();
      x = (alpha - log((1.0 - u1)/u1))/beta;
      #ifdef DEBUG
      printf("x = %e\n", x);
      printf("u = %e\n", u1);
      #endif
    } while(x < -0.5);

    /*set k for second interation */
    k = floor(x + 0.5);
    #ifdef DEBUG
    printf("%e\n", k);
    #endif

    /* second iteration: until v1 > v2 */
    /* generate a sample u2 from uniform distribution */
    u2 = uniformGen();
    double y = alpha - (beta * x);
    v1 = y + log(u2) - 2.0 * log(1.0 + exp(y));
    v2 = w + k * log(lambda) + lgamma(k + 1);
    #ifdef DEBUG
    printf("%e, %e\n",k * log(lambda),lgamma(k + 1));
    printf("v1, v2 = %e %e\n", v1, v2);
    #endif
    /* obs: log(k!) = log-gamma(k + 1) */
  } while(v1 > v2);
  return k;
  }
}

/* EOF */
