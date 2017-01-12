/* write a program that prompts the user to defining two triangles and (ii)
check if two triangles are congruent. */

#include <stdio.h>
#include <math.h>
#include <stdlib.h>

/* definition of the smallest value within double numerical precision in order
to compare different sides of triangles */
#ifndef __DBL_EPSILON__
#define __DBL_EPSILON__ 2.22044e-16
#endif

/* define a function in the head preprocessor to check if two sides are equal
within the numerical precision */
#define ALMOST_ZERO(x,y) (fabs(x-y) < __DBL_EPSILON__)


/* obs: check ex3.c for explanation about structures defined hereafter */
typedef struct triangle Triangle;
typedef struct point Point;

struct point{
  double x;
  double y;
};

struct triangle{
  Point A;
  Point B;
  Point C;
};

/* definition of get_triangle() function */
Triangle* get_triangle(){
  // allocate a temporary structure to fill
  Triangle *tri = (Triangle*) malloc(sizeof(Triangle));
  //prompt the user to define points
  printf("Insert point A (x,y): ");
  scanf("%lf,%lf", &tri->A.x, &tri->A.y);
  printf("Insert point B (x,y): ");
  scanf("%lf,%lf", &tri->B.x, &tri->B.y);
  printf("Insert point C (x,y): ");
  scanf("%lf,%lf", &tri->C.x, &tri->C.y);

  return tri;
}

/* main function */
int main(void){
  // define pointers to structures defining the triangles
  Triangle *tri1 = NULL;
  Triangle *tri2 = NULL;

  // prompting the user to define two triangles
  tri1 = get_triangle();
  tri2 = get_triangle();

  /* check if the two triangles are congruent
  obs: there are five different ways to check for it.
  The side side side (SSS) is implemented here. */



  return 0;
}
