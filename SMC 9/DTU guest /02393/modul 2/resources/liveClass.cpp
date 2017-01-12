/* 02393 - module 2
USE OF FUNCTION, RECURSIVE AND FUNCTIONAL PROGRAMMING */

#include <iostream>
using namespace std;

/* factorial function using iteration */
/* prototype (or head of the function) */
int facIt(int n){
  // requires: n >= 0
  // `exit` makes the program stop without any result
  if (n < 0) exit(-1);

  // set it to 1 because it's the neutral element in the multiplication
  int result = 1;
  // if the loop has just one line we could omit parentheses
  /*
  for (int i = 1; i <= n; i++)
    result = result * i;
  */

  /* alternative version using while and negative count
    obs: we use the variable itself to count, so that we save 4 byte*/
  while (n > 0){
    result *=  n;
    n--;
  }

  return result;
};

/* factorial function using recursion */
/* obs: in this case the function is calling itself */
int fac(int n){
  // return 1 if variable is non-positive
  if (n==0) return 1;
  // return the factorial
  return n * fac(n-1);
}

/* exponential function using recursion */
int exp(int b, int n){
  if (n==0) return 1;
  if (n%2==0){
    int result = exp(b,n/2);
    return result * result;
  }
  // define the recursion for n when non-negative
  return b*exp(b,n-1);
}
/* obs: when we have to multiply a variable for itself, to guarantee that the value
  stored in the variable is not changing, it perhaps might be better to save the
  calculation in another variable and then use that for calculation */

int main() {
  int n;
  int y;
  cout << "Insert a number: ";
  cin >> n;
  cout << "Insert an exponent: ";
  cin >> y;

  // compute the factorial and print it
  cout << n << "!=" << fac(n) << endl;
  cout << "exp = " << exp(n,y) << endl;
  return 0;
}

/*
DISCUSSION
obs: functions usually work on copy of the global variables, changing only
variables and local parameters. That said, we could have different scopes for
variables.

obs: if we insert a large input number, we get into problems because of the
limitations of the stack memory - called STACK OVERFLOW.
If we want to allocate new pieces of memory corresponding to new variables, we have
to use the `new` command that returns into a `pointer` to the variable itself.
*/
