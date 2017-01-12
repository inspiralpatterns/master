#include <stdio.h>

int main(void){
  /* initialize variables*/
  float length = 0.0f;   // length of the room in feet
  float width = 0.0f;    // width of the room in inches
  float area = 0.0f;     // floor area in square yards

  /*prompt for user input*/
  printf("Insert the length of the room (in feet): ");
  scanf("%f", &length);
  printf("Insert the width of the room (in inches): ");
  scanf("%f", &width);

  /*compute the floor area in square yards
  it has to be considered that
  - 1 foot = 12 inches
  - 1 square yard = 9 square feet*/
  area = (length * (width/12))/9;

  /*output the area with two decimal places after decimal point*/
  printf("The total area is %.2f\n square yards.", area);

  return 0;
}
