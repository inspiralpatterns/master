/* another sum
  compute the sum of all even integers between 0 and n
  input variable prompted by the user */

#include <iostream>
using namespace std;

/* sum of even numbers using recursion */
int even(int n) {
  if (n==0) return 0;
  if (n%2 != 0){
    int toEven = n - 1;
    return toEven + even(toEven - 2);
  }
  return n + even(n-2);

};

/* main function */
int main(){
  int n;
  cin >> n;

  cout << even(n) << endl;
  return 0;
}
