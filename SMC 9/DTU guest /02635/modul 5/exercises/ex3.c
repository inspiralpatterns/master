/* write a program that prompts the user to enter three points defining a
triangle and (ii) computes and prints the area of that triangle */

#include <stdio.h>
#include <math.h>
#include <stdlib.h>

/* obs: a point could be considered as a structure made of two variables, one
for each coordinate, while a triangle could be considered as a structure made
of three points, having base and heigth */
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

  //prompt the user to define points
  printf("Insert point A (x,y): ");
  scanf("%lf,%lf", &tri->A.x, &tri->A.y);
  printf("Insert point B (x,y): ");
  scanf("%lf,%lf", &tri->B.x, &tri->B.y);
  printf("Insert point C (x,y): ");
  scanf("%lf,%lf", &tri->C.x, &tri->C.y);

  /* calculating triangle area using Heron's formula
  obs: calculating lengths a,b,c and the semiperimeter s */
  double a, b, c, s, area;
  a = sqrt((tri->B.x - tri->A.x)*(tri->B.x - tri->A.x) +
    (tri->B.y - tri->A.y)*(tri->B.y - tri->A.y));
  b = sqrt((tri->C.x - tri->B.x)*(tri->C.x - tri->B.x) +
    (tri->C.y - tri->B.y)*(tri->C.y - tri->B.y));
  c = sqrt((tri->C.x - tri->A.x)*(tri->C.x - tri->A.x) +
    (tri->C.y - tri->A.y)*(tri->C.y - tri->A.y));

  s = (a+b+c)/2.0f;
  area = sqrt(s*(s-a)*(s-b)*(s-c));

  // print out the result
  printf("The triangle has sides \na = %.2lf \nb = %.2lf \nc = %.2lf \nand area = %.4lf\n",
  a, b, c, area);

  // free allocated memory
  free(tri);
  tri = NULL;

  return 0;
}
