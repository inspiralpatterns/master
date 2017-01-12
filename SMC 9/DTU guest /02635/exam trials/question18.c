/*
purpose:
  compute the angle in radians between two vectors x and y

arguments:
  double * x:       pointer to x vector
  double * y:       pointer to y vector
  n:                length of the vectors

  double angle:    angle measure (in radians)
*/

#include <stdio.h>
#include <stdlib.h>                 /* dynamic allocation */
#include <math.h>                   /* sqrt function */


/* function prototype */
double angle(double * x, double * y, int n);


/* main program for testing */
int main(int argc, char const *argv[]) {

  /* allocate memory for the array */
  unsigned int n;
  printf("insert length of vectors: ");
  scanf("%d", &n);
  if (n < 1){
    printf("length not valid. default length: 10");
    n = 10;
  }
  double * x = (double *) malloc(n*sizeof(double));
  double * y = (double *) malloc(n*sizeof(double));


  /* fill the array with some numbers */
  for (int i = 0; i < n; i++) {
    x[i] = rand();
    y[i] = rand();
  }

  /* compute the angle */
  double theta = angle(x, y, n);
  printf("Angle in radians: %lf\n", theta);

  /* free the memory */
  free(x);
  free(y);
  x = y = NULL;

  return EXIT_SUCCESS;
}


/* function declaration */
double angle(double * x, double * y, int n) {
  double norm_x = 0.0, norm_y = 0.0, dot = 0.0;

  for (int i = 0; i< n; i++) {
   norm_x += x[i] * x[i];
   norm_y += y[i] * y[i];
   dot += x[i] * y[i];
  }
  norm_x = sqrt(norm_x);
  norm_y = sqrt(norm_y);

  double tmp = acos(dot / (norm_x * norm_y));
  /* possible issue: dividing by zero
  fix: testing for the value to be NaN and set acos(0) = MPI/2 */
  if (isnan(tmp)) return M_PI/2;
  else return tmp;
}
