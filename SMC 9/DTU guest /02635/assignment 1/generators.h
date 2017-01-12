/* generators.h
  header file for generator.c */

  #ifndef GENERATORS_H
  #define GENERATORS_H

  #include <stdlib.h>                    // needed for rand() and srand()
  #include <math.h>                      // needed for lgamma()

  /* Function prototypes */
  /* function prototypes */
  double uniformGen();                                  // generate from uniform distribution
  double expGen(double lambda);                         // generate from an exponential distribution
  int poissonGen(double lambda, int method);         // generate from a Poisson distribution

  #endif
