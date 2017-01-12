#include <iostream>
using namespace std;

/* 02393 - module 3
DATA TYPES AND POINTERS */

/* defining a structure */
struct intarray{
  int* array;
  int size;
};

/* obs: if we define a structure we could allow for multiple outputs from a
function (in this case, the function returns a struct containing both the primes
and the size of that array) */
intarray eratosthenes(int n){

  bool* array = new bool[n];
  /* obs: the pointer to bool will return the address of the allocated place
  in our memory, particularly the address of the first byte of the new array */

  // aryay initialization
  array[0] = false;
  array[1] = false;
  for (int i = 2; i < n; i++) {
    array[i] = true;
  }

  // keeps track of all the primes found
  int counter = 0;

  for (int i = 2; i < n; i++) {
    if (array[i]) {
      // update the number of primes found
      counter++;
      for (int j = 2*i; j < n; j+=i) {
        // set all its multiples to false
        array[j] = false;
      }
    }
  }

  // declare a variable based on the struct defined beforehead
  intarray result;
  result.array = new int[counter];
  result.size = counter;
  int j = 0;
  for (int i = 0; i < n; i++) {
    // copy the primes in the output array
    // 1. loop over the entire original array
    // 2. copy when true and increment the counter for the output array
    if(array[i]) result.array[j++] = i;
  }

  delete [] array;
  return result;
}


// compute eratosthenes formula in different ways
int main(void) {

  int n;
  cin >> n;

  bool* array = new bool[n];

  // aryay initialization
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

  cout << endl;
  cout << "using the normal way: " << endl;
  for (int i = 0; i < n; i++)
    if (array[i]) cout << i << endl;

  /* the nasty and quick way
  1. initialize a pointer to bool
  2. let the pointer change its address and access each single element
    using de-reference operator */
  cout << endl;
  cout << "using the nasty way: " << endl;
  bool* finger;
  for (finger = array; finger != array+n; finger++)
    if (*finger) cout << finger-array << endl;


  int* squares = new int[n];
  int i = 0;
  for (int* finger = squares; finger != squares+n; finger++, i++)
    *finger = i*i;

  /* obs: the pointer finger will increase this position by a number of byte
  that is exactly the size of the type of the element it points to */
  /* obs: it was used pretty much because it lets us spare a multiplication
  and that could save memory, although makes the code more complicate */
  cout << "return the squares: " << endl;
  for (int i = 0; i < n; i++){
    cout << squares[i] << endl;
  }

  delete [] array;

  cout << endl << endl;
  cout << "using the function that creates a struct: " << endl;
  intarray primes = eratosthenes(n);
  for (int i = 0; i < primes.size; i++){
    cout << primes.array[i] << endl;
  }

  return 0;
}
