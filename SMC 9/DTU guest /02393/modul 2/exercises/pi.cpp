/* pi
  compute an approximation of pi using Leibniz' formula */

#include <iostream>
#include <cmath>
using namespace std;

/* compute the first n term of the infinite summation */
double pi(int n){
  if (n==0) return 0;
  if (n==1) return 1;
  return ((pow(-1,(n-1)))/double(2*(n-1)+1)) + pi(n-1);
};

/* main function */
int main(){
  int n;
  cin >> n;

  cout << 4*pi(n) << endl;
  return 0;
}

/* obs: whe use n-1 index into the recursive function because, if we see at that
  formula as it is in mathematics, when we have 0 elements to sum the sum is
  meant to be null. That said, the first index in the summation will be 0, that
  is our first element. We have therefore to approach the recursion using the
  previous value as index since the summation starts from 0 */
