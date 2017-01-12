/* prime
  compute the prime factorization of a given positive integer */

#include <iostream>
#include <cmath>
using namespace std;

int main(){
  int n;            // store the positive integer
  unsigned int i = 2; // first prime number for factorization
  cin >> n;

  // check if non positive and take the modulo in case
  n = n < 0? abs(n) : n;

  for(;;){
    while (n%i == 0){
      cout << i;
      n = n / i;
      if (n/i != 0){
        cout << " * ";
      }
      else{
        cout << endl;
        return 0;
      }
    }
    ++i;
  };

  cout << endl;
  return 0;
}
