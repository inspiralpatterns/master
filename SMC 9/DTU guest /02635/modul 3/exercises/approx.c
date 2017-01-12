/* approx.c
compute the approximation of a rectangular grid, given the dimensions of the
matrix (M rows, N columns) and both left- and upper-corner */

#include <stdio.h>
#include <math.h>

int main(void){
  double xl, yl, xu, yu;
  double xval, yval;
  int M, N;
  printf("Insert the coordinates (xl,yl): ");
  scanf("%lf,%lf", &xl, &yl);
  printf("Insert the coordinates (xu,yu): ");
  scanf("%lf,%lf", &xu, &yu);
  printf("Insert the matrix dimensions M,N: ");
  scanf("%i,%i", &M, &N);

  /* test case: calculate the function value for f = cos(1- x*y) at a finite
  number of grid point in our rectangular matrix */

  // compute a loop over all the colums (i increasing)
  for (int i = 0; i < M; i++) {
    // calculate the value of y coordinate
    yval = yl + ((double)(i)/(M-1))*(yu-yl);
    // compute a loop over all the rows (j increasing)
    for (int j = 0; j < N; j++) {
      xval = xl + ((double)(j)/(N-1))*(xu-xl);

      // print each coordinate pair-value
      printf("The coordinate for H[%i][%i] are: (%lf, %lf)\n", i, j, xval, yval);
      printf("The value for the function cos(1 - xy) evaluated for (x,y) is: %lf\n",
              cos(1 - xval*yval));
    }
  }
}
