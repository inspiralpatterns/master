/*
purpose:
  compute the difference of neighboring elements of a vector and returns the
  result in a different vector

arguments:
  double * x:       pointer to an input array
  n:                length of the array

  double * diff:    pointer to an array that contains the result
*/

#include <stdio.h>
#include <stdlib.h>       /* dynamic allocation */

/* difference function prototype */
double * diff(double * x, int n);


/* main program for testing */
int main(int argc, char const *argv[]) {

  /* allocate memory for the array */
  unsigned int n;
  printf("insert length of array: ");
  scanf("%d", &n);
  if (n < 1){
    printf("length not valid. default length: 10");
    n = 10;
  }
  double * x = (double *) malloc(n*sizeof(double));

  /* fill the array with some numbers */
  for (int i = 0; i < n; i++) {
    x[i] = i;
  }

  /* call the difference function */
  double * difference = diff(x, n);

  for (int i = 0; i < n-1; i++) {
    printf("%lf\n", difference[i]);
  }


  /* free memory */
  free(x);
  free(difference);
  x = difference = NULL;

  return EXIT_SUCCESS;
}

/* difference function declatarion */
double * diff(double * x, int n){
  /* allocate memory for the new vector */
  double * y = (double * ) malloc((n-1)*sizeof(double));

  /* compute the difference and store it */
  for (int i = 0; i < n-1; i++) {
    y[i] = x[i+1] - x[i];
  }

  return y;
}
