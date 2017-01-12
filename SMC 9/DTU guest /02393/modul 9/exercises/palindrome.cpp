/* palindrome.cpp
  decides whether a sequence of integers is palindrome or not, using a recursive
  technique.

  implementation strategy: using the a recursive function that matches all the
  values reading them both from the beginning and from the end
*/

#include <iostream>
#include <string>
#include <sstream>
#include <vector>

using namespace std;

int palindrome(int * seq, int n, int m){
  if (n == 0) {
    seq[n] == seq[m] ? cout << "yes" : cout << "no";
    cout << endl;
    return 0;
  }

  if (!(seq[n] == seq[m])) {
    cout << "no" << endl;
    return 0;
  }

  /* if match, call the function itself */
  palindrome(seq, n - 1, m + 1);
}

int main(void){
  string input;
  int n, m;
  int * seq = NULL;
  /* get input from the user */
  getline(cin, input);

  /* check for the cin if empty */
  if (input.empty()) {
    return 0;
  }

  /* get sequence from input */
  vector<string> v(100);
  istringstream iss(input);

  int i = 0;    // counter for vector and array of integers
  do {
    iss >> v[i];
    i++;
    // seq[i] = stoi(v[i]);
  } while(iss);

  n = i - 1;
  m = 0;
  seq = new int[n];
  /* convert to int */
  for (int i = 0; i < n; i++) {
    seq[i] = stoi(v[i]);
  }

  /* check for palindrome sequence */
  palindrome(seq, n - 1, m);

}
