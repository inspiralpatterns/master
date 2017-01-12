/* randGen.c
  generates independent random numbers either from an exponential distribution
  or from a Poisson distribution with parameter lambda. */

#include <stdio.h>
#include <stdlib.h>                    // needed for rand() and srand()
#include <math.h>                      // needed for lgamma()
#include <ctype.h>                     // needed for toupper()
#include <time.h>                      // needed for time(NULL)

//#define DEBUG
#define EPS 2.2e-16

/* function prototypes */
double uniformGen();                                  // generate from uniform distribution
double expGen(double lambda);                         // generate from an exponential distribution
double poissonGen(double lambda, int method);         // generate from a Poisson distribution



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

double poissonGen(double lambda, int method){
  /* swtich between the methods */
  if (method == 1){
    /* METHOD 1: using exponential distribution */
    /* requirements */
    double t = 0;
    double k = 0;

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

      /*set k for second interation */
      k = floor(x + 0.5);
    } while(k < 0);

    /* second iteration: until v1 > v2 */
    /* generate a sample u2 from uniform distribution */
    u2 = uniformGen();
    double y = alpha - (beta * x);
    v1 = y + log(u2/pow((1.0 + exp(y)),2));
    v2 = w + k * log(lambda) + lgamma(k + 1);
    #ifdef DEBUG
    printf("%e, %e, \n",k * log(lambda),lgamma(k + 1));
    printf("v1, v2 = %e %e\n", v1, v2);
    #endif
    /* obs: log(k!) = log-gamma(k + 1) */
  } while(v1 > v2);
  return k;
  }
}

/* observation on generation
1. the first approach counts how many arrivals there are in an interval by simulating the times between
them until the time overcomes the interval. The expected run time, however, is proportional
to the parameter lambda, so that for large arguments leads to slow performances:
2. the second approach has expected run time independent of the variable lambda, but it could
be not completely efficient to generate a large number of samples. Nevertheless, this algorithm
should be used for values of lambda larger than 30;
*/


/* main program */
int main(int argc, char const *argv[]) {
  /* output introduction banner */
  printf("-----------------------randgen.c-----------------------\n");
  printf("- generates a matrix of independent random numbers    -\n");
  printf("- either from an exponential or Poisson distribution. -\n");
  printf("-                                                     -\n");
  printf("- The matrix has dimensions m-by-n                    -\n");
  printf("- The user has to insert the dimensions and the type  -\n");
  printf("- of distribution.                                    -\n");
  printf("-------------------------------------------------------\n");
  printf("\n\n");

  /* variables for user input */
  int m,n;
  double lambda;
  char c;

  /* prompt for matrix dimensions and distribution type */
  printf("Please insert\n");
  printf("type (E = exp, P = Poisson): ");
  scanf("%c", &c);
  printf("lambda parameter: ");
  scanf("%lf", &lambda);
  printf("matrix dimensions (m,n): ");
  scanf("%d,%d", &m, &n);

  /* check for positive lambda */
  if (lambda < EPS) {
    printf("lambda not correct\n");
    return -1;
  }

  /* create array using dynamic memory allocation and check for any failure */
  double *gendata = malloc(m*n*sizeof(double));
  if(!gendata){
    printf("Memory allocation failed.\n");
    return EXIT_FAILURE;
  }

  /* DATA GENERATION */
  /* obs: insert loop for each item in matrix*/

  /* initialize random number generator */
  srand(time(NULL));
  /* specify generation type */
  if (c == 'E'){
    printf("\n...generating random numbers from exponential distribution\n");
    double z;
    z = expGen(lambda);
    printf("z = %e\n", z);
  }
  else{
    printf("\n...generating random numbers from Poisson distribution\n");
    double k = 0.0;
    int method;
    printf("Select the method\n");
    printf("1 = using exp, 2 = rejection sampling: ");
    scanf("%i", &method);
    for (size_t i = 0; i < 100000; i++) {
      k += poissonGen(lambda, method);
    }
    k /= 100000.0;
    printf("mean = %e\n", k);
    printf("lambda = %e\n", lambda);

    // k = poissonGen(lambda, method);
    // printf("k = %e\n", k);
  }

  /* print 2-D array of random numbers*/

  /* free memory */
  free(gendata);
  gendata =  NULL;

  return 0;
}

/* EOF */
