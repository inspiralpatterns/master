/*
purpose:
  analyse the behaviour of a recursive function.
  Particularly, the program counts the number of function calls for a
  Fibonacci function recursively implemented, in case n = 5
*/

#include <stdio.h>

/* Fibonacci function in recursive implementation */
unsigned long fibonacci(unsigned long n) {
  /* obs: defining a const variable inside a function lets us to count the number
  of calls since a const variable does not go out of scope until the program
  terminates.
  By default, if not assigned a const variable is initialized to zero */
  static unsigned long counter = 1;
  /* update counter every function call */
  printf("Function calls: %lu\n", counter);
  counter++;


  /* recursion base */
  if ( n == 0 ) return 0;
  else if ( n == 1 ) return 1;
  /* recursive definition */
  else return fibonacci(n-1) + fibonacci(n-2);
}


int main(int argc, char const *argv[]) {

  /* how many number of fibonacci series to be computed? */
  unsigned long n = 5;

  unsigned long result = fibonacci(n);
  printf("%lu for Fibonacci series of %lu elements\n", result, n);

  return 0;
}
