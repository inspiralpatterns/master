#ifndef __ex04_library__
#define __ex04_library__

#include <string>

using namespace std;

template <class C>
class Monoid {

public:
  /* function prototypes */
    Monoid(C constant);                         /* constructor */
    Monoid<C> operator*(Monoid<C> & m);         /* operator overloading */
    Monoid(Monoid<C> & m1, Monoid<C> & m2);     /* concatenative monoids */
    C eval(C (*f)(C,C));
    void print(void);

private:
    Monoid(Monoid<C> & m1);                     /* copy constructor */
    C constant;                                 /* irrelevant when binary composed */
    Monoid<C> * m1;                             /* pointer to left */
    Monoid<C> * m2;                             /* pointer to right */

};

#endif

/* observations
  a. the evaluation function takes as arguments a function that is
  the interpretation of a monoid operator;
  b. the Monoid class yet defined reflects a binary tree data structure.
*/
