/* template for finding the absolute value of a variable a of type T, for which
  the inequality a < -a is defined

  purpose
    implementation and understanding of function templates
*/

#include <iostream>

template <typename T>
T absolute(const T& a){
  /* if a = 0 do nothing */
  T result = 0;

  if (a){
    /* check inequality */
    result = a < (-a)? -a : a;
  }

  return result;
}


/* main program to test the template */
int main(int argc, char const *argv[]) {
  /* create variables of different types */
  double f = 1.453;
  int i = -3;
  long l = -4902;
  double zerovar = 0.0;

  /* call template and print result */
  std::cout << absolute(f) << '\n';
  std::cout << absolute(i) << '\n';
  std::cout << absolute(l) << '\n';
  std::cout << absolute(zerovar) << '\n';

  return 0;
}

/* why the template should not return a reference to a variable of type T? */
