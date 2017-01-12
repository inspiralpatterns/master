#include <iostream>
#include "ex04-library.h"

using namespace std;

// Exercise 4 (a)
/* obs: initialization list used instead of this pointer */
template <class C>
Monoid<C>::Monoid(C constant) : constant{constant}{
  cout << "constructor called" << endl;
  /* obs: pointers initialized always to null */
  m1 = m2 = nullptr;
}

// Exercise 4 (b)
template <class C>
Monoid<C>::Monoid(Monoid & m){
  /* create a duplicate of the argument */
  cout << "copy constructor called" << endl;
  /* copy value in constant */
  if (m.m1 == nullptr){
    constant = m.constant;
    m1 = m2 = nullptr;
    /* we must return, otherwise the foregoing assignments are run and we
    get undefined behaviour -> segmentation fault */
    return;
  }

  /* if Monoid pointer are not null, that means the Monoid is a binary composition
  of two monoids and the constant value is irrevelant */
  m1 = new Monoid(*m.m1);
  m2 = new Monoid(*m.m2);
}

// Exercise 4 (c)
template <class C>
Monoid<C>::Monoid(Monoid<C> & m1, Monoid<C> & m2){
  cout << "binary composition constructor called" << endl;
  /* creating two new instances of class using copy constructor */
  this->m1 = new Monoid<C>(m1);
  this->m2 = new Monoid<C>(m2);
}


// Exercise 4 (d)
template <class C>
Monoid<C> Monoid<C>::operator*(Monoid<C> & m){
  /* the operator overloading return a new monoid */
  Monoid<C> new_m(*this, m);
  return new_m;
}

// Exercise 4 (e)
/* obs: this function has to access recursively each Monoid. If the monoid is
a constant one, we have to access only the constant value, otherwise we have
to call the function recursively using both pointers to Monoid in case of binary
composition.
*/
template <class C>
C Monoid<C>::eval(C (*f)(C,C)){
  /* base case: pointer is null */
  if (m1 == nullptr) return constant;
  else return f(m1->eval(f), m2->eval(f));
}

// Do not modify
template <class C>
void Monoid<C>::print(void){
    if (m1 == nullptr) cout << constant ;
    else {
        m1->print();
        cout << " * " ;
        m2->print();
    }
}

// Do not modify
template class Monoid<string>;
template class Monoid<unsigned int>;
