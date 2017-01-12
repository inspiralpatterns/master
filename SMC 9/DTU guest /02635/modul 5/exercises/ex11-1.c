#include <stdio.h>
#include <math.h>
#include <ctype.h>
#include <stdlib.h>
#include <stdbool.h>

/* define a struct type of name Length that represent a length using
different unit and subunit measure */
typedef struct length Length;

struct length {
  double yards;
  double feet;
  double inches;

  // pointer to the next Length structure
  Length *next;
};

/* main program that uses the Length type and the functions above to sum an
arbitrary number of lengths that the user prompt and shows the result */

int main(void) {
  Length *first = NULL;
  Length *second = NULL;

  /* to check for more input */
  //char more = 0;

  /* allocate memory for the first couples of lengths*/
  first = (Length*) malloc(sizeof(Length));
  second = (Length*) malloc(sizeof(Length));

  /* PART ONE */
  /* prompt the user for inserting the first couples of lengths to be sum
  obs: using scanf we have to assess the address of the specific variable inside
  the structure that the pointer to our structure points to. */
  // for structure no 1
  printf("Insert first length in yards: ");
  scanf("%lf", &first->yards);
  printf("Insert first length in feet: ");
  scanf("%lf", &first->feet);
  printf("Insert first length in inches: ");
  scanf("%lf", &first->inches);

  // for structure no 2
  printf("Insert second length in yards: ");
  scanf("%lf", &second->yards);
  printf("Insert second length in feet: ");
  scanf("%lf", &second->feet);
  printf("Insert second length in inches: ");
  scanf("%lf", &second->inches);

  // first pointer pointing to the second structure
  first->next = second;

  Length *current = (Length*) malloc(sizeof(Length));
  /* sum each variable of the two structures previous declared
  obs: we divided by 100 and take modulo because they are submeasure */
  current->inches = (first->inches + second->inches)/100.0f;
  current->inches = modf(current->inches, &current->feet);

  current->feet += (first->feet + second->feet);
  current->feet /= 100.f;
  current->feet = modf(current->feet, &current->yards);

  current->yards += (first->yards + second->yards);

  /* output the sum */
  printf("The sum is %lf yards, %lf feet and %lf inches\n",
  current->yards, current->feet, current->inches);


  return 0;
}
