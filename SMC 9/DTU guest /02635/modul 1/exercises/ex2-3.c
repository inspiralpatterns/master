#include <stdio.h>

int main(void){

  int type1No = 0;
  int type2No = 0;
  const float type1 = 3.5f;
  const float type2 = 5.5f;
  float totalPrice = 0.0f;

  // prompt the user to define the quantity for each type
  printf("Define the product quantity for type no 1: ");
  scanf("%d", &type1No);
  printf("Define the product quantity for type no 2: ");
  scanf("%d", &type2No);

  // calculate total cost and print it
  totalPrice = type1*type1No + type2*type2No;
  printf("The total price for the quantity entered is %.2f $\n", totalPrice);
  return 0;
}
