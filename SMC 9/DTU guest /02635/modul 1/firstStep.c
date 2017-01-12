#include <stdio.h>
#include <stddef.h>   // for sizeof and size_t
#include <stdbool.h>  // for boolean true and false

int main(void){
  float diameter = 6.0f;
  float radius;
  // use of exponential representation for float variable
  float strange = 0.7e-2f;
  float area;

  radius = diameter/2; // automatic conversion, no data casting needed
  area = radius * strange;

  printf("%5.3f is the strange number\n", strange);

  // obs: it is always better to use a variable of type size_t when we
  // use the sizeof operator (and parentheses are optional)
  size_t size = sizeof area;
  // use of %zu because sizeof is unsigned int and not unsigned long

  printf("%zu is the size of \'area\' variable,\n", size);

  // about character type and variables
  char ch = 0;
  printf("Enter a character: ");
  scanf("%c", &ch);
  printf("%c is the character value", ch);
  printf(", but %d is its numerical value", ch);
  printf(" and %X is its hex version.\n", ch);

  // use of enumerations
  enum weekdays {Mon, Tue, Wen, Thu, Fri, Sat, Sun};
  enum weekdays today = Fri;
  printf("Today is %d ", today);
  printf("because enum type is an integer starting from 0.\n");

  // boolean variables (can use also bool with the header files)
  _Bool valid = true;
  printf("This is the boolean for true: %d\n", valid);

  return 0;
}
