#include <iostream>
using namespace std;

/* 02393 - module 5
DATA TYPES, POINTERS - PART TWO */

/* example of `call by value`: that function internally works,
it doesn't return any value and the original data has not changed */
void swap_doesntwork(int a, int b){
  int tmp = a;
  a = b;
  b = tmp;
};

/* using the pointers techniques: old but gold */
void swap_classic(int* a, int* b){
  int tmp = *a;
  *a = *b;
  *b = tmp;
};

/* THE MODERN WAY: using &
  example of `call by reference` */
void swap_modern(int & a, int & b){
  int tmp = a;
  a = b;
  b = tmp;
};
/* OBS: the function definition says to work on the original data instead of
  taking a copy of them */


int main(){
  int x = 5;
  int y = 3;

  /* OBS: we get pointers every time we ask the compiler to allocate new
  memory on the heap */
  int* xp = new int;
  int* yp = new int;

  /* solution to swap_doesntwork: instead of call the function passing to it
    a copy of the values, we pass the function the reference to the original
    values using pointers. That is namely `call by reference`. */
  *xp = x;
  *yp = y;

  /* use the `call by reference` based function */
  swap_classic(xp, yp);
  /* alternative: using the addresses of original variables.
  1. create two variables and store addresses - those are namely pointers indeed
  2. call the same function using those pointers */
  int* xp2 = &x;
  int* yp2 = &y;
  swap_classic(xp2, yp2);

  /* using the modern way */
  swap_modern(x, y);

  cout << "x = " << *xp << " y = " << *yp << endl;
  cout << "x = " << x << " y = " << y << endl;

  delete  xp;
  delete  yp;
  return 0;
}
