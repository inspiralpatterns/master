/* write a program that prompts the user to enter three points defining a
triangle and (ii) check if a point (x,y) is inside a triangle. */

#include <stdio.h>
#include <math.h>
#include <stdlib.h>

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

/* main function */
int main(void){
  // allocate memory for structure defining triangle
  Triangle *tri = (Triangle*) malloc(sizeof(Triangle));
  // allocate memory for point to be checked
  Point *toCheck = (Point*) malloc(sizeof(Point));

  //prompt the user to define points
  printf("Insert point A (x,y): ");
  scanf("%lf,%lf", &tri->A.x, &tri->A.y);
  printf("Insert point B (x,y): ");
  scanf("%lf,%lf", &tri->B.x, &tri->B.y);
  printf("Insert point C (x,y): ");
  scanf("%lf,%lf", &tri->C.x, &tri->C.y);

  printf("Insert point to check (x,y): ");
  scanf("%lf, %lf", &toCheck->x, &toCheck->y);
  /* obs: could also be a for loop if we define an array of Point */

  /* check if the point is inside a triangle
  obs: it suffices to check if barycentric coordinates are non-negative.
  Precisely: if a point lies in the interior of the triangle, all of the
  Barycentric coordinates lie in the open interval (0,1). */

  double lambda1, lambda2, lambda3;

  /* calculate barycentric coordinates */
  double den = ((tri->B.y - tri->C.y)*(tri->A.x - tri->C.x) +
    (tri->C.x - tri->B.x)*(tri->A.y - tri->C.y));
  lambda1 = ((tri->B.y - tri->C.y)*(toCheck->x - tri->C.x) +
    (tri->C.x - tri->B.x)*(toCheck->y - tri->C.y))/den;
  lambda2 = ((tri->C.y - tri->A.y)*(toCheck->x - tri->C.x) +
    (tri->A.x - tri->C.x)*(toCheck->y - tri->C.y))/den;
  lambda3 = 1 - lambda1 - lambda2;

  /* obs: smart way to do this
  #define x(i) tri->vertices[i-1].x
  #define y(i) tri->vertices[i-1].y

  but in order to do this we have to define the struct triangle like that:
  struct triangle{
    Point vertices[3];
  };

  and undefines the preprocessor macro at the end
  #undef x(i)
  #undef y(i)
  */

  printf("Barycentric coordinates are %lf, %lf and %lf\n", lambda1,lambda2,lambda3);
  if (lambda1 >= 0 && lambda2 >= 0 && lambda3 >= 0)
    printf("The point (%lf,%lf) is inside the triangle\n", toCheck->x,toCheck->y);
  else
    printf("The point (%lf,%lf) is NOT inside the triangle\n", toCheck->x,toCheck->y);


  return 0;
}
