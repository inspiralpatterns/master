#include <iostream>
using namespace std;

/* 02393 - module 4
USE OF POINTERS */

#include <iostream>
#include <vector>
using namespace std;

/*
struct intarray{
  int* array;
  int size;
};
*/

/* how to replace the structure above? */
typedef vector<int> intarray;

/* create a void function that prints some result, using a for loop that is
  driven by a pointer iterator. Take a look at how to initialize the loop and
  how it is easy to address directly the value, instead of changing the address
  using the array name variable - not safe */
void print_array(intarray primes){
  // ask the vector library for the size of the vector
  for (int i = 0; i < primes.size(); i++) {
    cout << prime[i] << endl;
  }

  /* ALTERNATIVE WAYS */
  /* 1st way: using a pointer to the old structure */
  for (int* it = primes.array; it != primes.array + primes.size; it++) {
    cout << *it << endl;
  }

  /* 2nd way: using an iterator with defined functions in vector library */
  /* every container allow for a procedure alike, using a variable of type
  iterator, and pointing it to the begin of the container and until the end */
  for (intarray::iterator it = primes.begin(); it != primes.end(); it++) {
    cout << *it << endl;

    /* obs: when we make some modifications, we changed something into a
    copy of the variable that has been created by the function, so that in the
    main() function there is no change in the main() variable.
    In order to diffuse the change also in the main variable two methods exists:
    - functions whose arguments are pointers to variables (when accessing the
    memory space related to the pointer, we can change the content of that memory
    space);
    - functions whose arguments are references to variables (the functios itself
    does not generate fresh copy of the main variable to work on during the scope
    but it works directly on the original ones).
    */
    (*it) = (*it) * 2;
  }
}

intarray eratosthenes(int n){

  /* how to define a vector */
  vector<bool> array(n);

  array[0] = false;
  array[1] = false;
  for (int i = 2; i < n; i++) {
    array[i] = true;
  }

  for (int i = 2; i < n; i++) {
    if (array[i]) {
      for (int j = 2*i; j < n; j+=i) {
        array[j] = false;
      }
    }
  }


  intarray result;
  for (int i = 0; i < n; i++) {
    if (arr[i]){result. push_back(i);}
  }

  return result;
}
