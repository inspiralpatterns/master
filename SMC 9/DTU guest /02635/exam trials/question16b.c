/*
purpose:
  convert cartesian coordinates into polar representation. Check for bugs and
  correctness of the function

arguments:
  double x                                    x coordinate
  double y                                    y coordinate

  struct polar_coordinate *                   pointer to struct of polar representation
*/

#include <stdio.h>
#include <math.h>
#include <stdlib.h>

struct polar_coordinate {
  double theta;
  double r;
};


struct polar_coordinate * polar(double x, double y){
  struct polar_coordinate * pc = NULL;
  pc = malloc(sizeof(struct polar_coordinate));
  pc->r = sqrt(x*x + y*y); // compute radius
  pc->theta = atan2(y, x); // compute angle

  return pc;
}

int main(int argc, char const *argv[]) {
  double x = 1;
  double y = 1;

  struct polar_coordinate * pol;
  pol = polar(x, y);
  printf("Polar coordinates:\n");
  printf("radius = %lf\n", pol->r);
  printf("angle = %lf\n", pol->theta);

  return 0;
}


/* observation on original function:

struct polar_coordinate * polar(double x, double y){
  struct polar_coordinate pc;
  pc.r = sqrt(x*x + y*y); // compute radius
  pc.theta = atan2(y, x); // compute angle
  return &pc;
}

1. this function return some address on the stack, so it can't be correct;
2. in order for this function to return the structure, a new structure has to
be allocated and, doing so, such a structure is accessed using the operator
-> and the pointer can be directly returned;
3. the sizeof() operator allocates memory enough for the whole structure
*/
