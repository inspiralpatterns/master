/* write a program that evaluates a function at n > 2 points between a lower
and an upper limit and writes them onto a .txt file */

#include <stdio.h>
#include <math.h>

int main(int argc, char const *argv[]) {
  int n;
  printf("Define n: ");
  scanf("%d", &n);
  /* check for n > 2 */
  if (n < 3) {
    printf("Warning: n too small\n");
    printf("Define n again: ");
    scanf("%d", &n);
  }

  /* set up variables */
  double x, xl, xu, f; // function parameter and boundaries
  printf("Define lower limit: ");
  scanf("%lf", &xl);
  printf("Define upper limit: ");
  scanf("%lf", &xu);

  /* create a new file which to write onto, same directory as the main */
  FILE *pfile = NULL;  // for correctness
  char * filename = "data.txt";
  pfile = fopen(filename, "w");


  for (int i = 1; i < n + 1; i++) {
    /* compute x value */
    x = xl + (i - 1)*((xu - xl)/(n - 1));
    /* compute function */
    f = exp(-x) + 0.5 * x;

    /* write the value pair onto the file */
    fprintf(pfile, "%lf %lf\n", x, f);
  }

  /* close the file */
  printf("...computation done\n");
  fclose(pfile);
  pfile = NULL;
  printf("...file saved and closed\n");

  return 0;
}
