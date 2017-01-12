/* program that prompts the user to enter a sequence of strings, store all of
  them inside a list and remove all strings that are m-character long, where
  m is also chosen by the user

  purpose:
    implementation and use of list container
*/

#include <iostream>
#include <list>
#include <string>

/* define string that the user has to enter to stop the string insertior */
#define stop "STOP"

using namespace std;

int main(int argc, char const *argv[]) {
  /* create a list of strings */
  list<string> L;

  string e;
  /* part A. strings insertion */
  /* get a string from the input and push it back in the list*/
  while (true) {
    std::cout << "please insert a string (digit STOP to break): ";
    cin >> e;
    /* check for termination */
    if (cin.fail() || e == stop) break;
    /* store the string in the list */
    L.push_back(e);
    std::cout << "L is " << L.size() << " long now" << '\n';
  }

  std::cout << "insertion succedeed" << '\n';

  /* part B. strings deletion */
  size_t len;
  std::cout << "insert a length (int type): ";
  cin >> len;

  for (auto it = L.begin(); it != L.end(); it++) {
    /* check if length of string is longer than len and, if so, delete it */
    if ((*it).length() > len){
      std::cout << *it << ": erased" << '\n';
      L.erase(it);
      /* obs: complexity is linear in the number of erased elements */
    }
    /* otherwise, keep it and inform the user */
    else std::cout << *it << ": kept" << '\n';
  }

  return 0;
}
