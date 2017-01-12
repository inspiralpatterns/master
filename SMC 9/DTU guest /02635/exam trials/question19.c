/*
purpose:
  compute the derivative of a polynomial (also a polynomial of degree n-1)

arguments:
  struct polynomial poly:           polynomial to be computed

  struct polynomial derivative:     derivative of input polynomial
*/

#include <stdio.h>
#include <stdlib.h>               /* dynamic memory allocation */

/* structure definition for polynomial */
struct polynomial {
  int n;                          /* order of polynomial */
  double * coeff;                 /* coefficients */
};

/*obs: assuming that coefficients are stored counting from the last, so that
during the derivative the last coefficient will be the one belonging to the
highest order term */

/* function prototype */
struct polynomial derivative(struct polynomial poly);


/* main program for testing */
int main(int argc, char const *argv[]) {
  /* get order of polynomial, assuming n always positive */
  int n;
  printf("insert order of polynomial: ");
  scanf("%d", &n);

  /* create structure poly */
  struct polynomial poly;
  poly.n = n;
  /* allocate memory for coefficients */
  poly.coeff = (double *) malloc((poly.n + 1) * sizeof(double));
  /* assign random coefficients */
  for (int i = 0; i < poly.n + 1; i++) {
    /* using rand() */
    poly.coeff[i] = (double) rand()/RAND_MAX;
    /* print for checking */
    printf("coefficient a%d: %lf\n", i == 0? 0 : i, poly.coeff[i]);
  }

  /* call function to compute derivative of polynomial */
  struct polynomial d = derivative(poly);
  printf("printing coefficient for derivative:\n");
  for (int i = 0; i < d.n + 1; i++) {
    /* print for checking */
    printf("coefficient a%d: %lf\n", i == 0? 0 : i, d.coeff[i]);
  }

  return EXIT_SUCCESS;
}


/* function definition */
struct polynomial derivative(struct polynomial poly){
  /* allocate memory for a new struct */
  struct polynomial derivative;
  derivative.n = poly.n - 1;
  derivative.coeff = (double *) malloc((derivative.n + 1) * sizeof(double));
  printf("%d\n", derivative.n);

  /* strategy: differentiate each term of the polynomial */
  printf("differentiate each term of polynomial\n");
  for (int i = 0; i < derivative.n + 1; i++) {
    derivative.coeff[i] = poly.coeff[i+1] * (i+1);
  }

  printf("\n\nderivative computed\n\n");
  return derivative;
}
