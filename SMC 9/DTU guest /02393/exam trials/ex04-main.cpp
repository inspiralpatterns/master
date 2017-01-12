#include <iostream>
#include <string>
#include "ex04-library.h"

using namespace std;

string concat(string u, string v){
    return u + v;
}

unsigned int add(unsigned int u, unsigned int v){
    return u + v;
}

int main(void){
  cout << "monoid of strings"  << endl;
  cout << "...calling one-argument constructor" << endl;
  Monoid<string> a("Hello");
  Monoid<string> b(" ");
  Monoid<string> c("world!");

  cout << "...calling two-argument constructor" << endl;
  Monoid<string> d(a,b);
  Monoid<string> e(d,c);
  /* obs: copy constructor will be called:
  - when e is created;
  - when d is created (this call copy constructor of a and b)
  - when c is created
  */

  cout << "...calling evaluation" << endl;
  cout << e.eval(concat) << endl;
  cout << "...using operator overloading" << endl;
  cout << (a * b * c).eval(concat) << endl;
  /* obs: operator overloading is quite inefficient since returns a new monoid
  with a copy of the object. Being a binary operation, it requires several calls
  both to two-argument constructor and, therefore, to the copy constructor */


  cout << endl;
  cout << "monoid of integers" << endl;
  Monoid<unsigned int> u(1);
  Monoid<unsigned int> v(2);
  Monoid<unsigned int> w(3);

  cout << "calling operator overloading" << endl;
  cout << (u * v * w).eval(add) << endl;



  return 0;
}
