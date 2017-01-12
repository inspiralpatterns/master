/* reverse.cpp
  reverses a sequence of integers, as provided in the standard input, using a
  recursive technique.

  implementation strategy: create a function that print always the previous value,
  given a specified sequence
*/

#include <iostream>
#include <string>
#include <sstream>
#include <vector>

using namespace std;

/* this function takes a pointer to the sequence and the length of it.
  until n = 0, for which we get the first value of the sequence, the function
  prints the value and call itself then */
void reverse(int * seq, int n){
  if (n == 0) cout << seq[n] << endl;
  else{
  cout << seq[n] << " ";
  reverse(seq, n - 1);
  }
}

int main(void) {
  string input;
  int n;
  int * seq = NULL;
  /* get input from the user */
  getline(cin, input);

  /* check for the cin if empty */
  if (input.empty()) {
    return 0;
  }

  /* get sequence from input */
  vector<string> v(100000);
  istringstream iss(input);

  int i = 0;    // counter for vector and array of integers
  do {
    iss >> v[i];
    i++;
    // seq[i] = stoi(v[i]);
  } while(iss);

  n = i - 1;
  seq = new int[n];
  /* convert to int */
  for (int i = 0; i < n; i++) {
    seq[i] = stoi(v[i]);
  }

  /* reverse and print the sequence using recursive function */
  reverse(seq, n-1);

  /* free memory */
  delete [] seq;

  return 0;
}
