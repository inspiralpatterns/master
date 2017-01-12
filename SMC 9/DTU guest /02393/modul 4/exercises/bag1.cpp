/* bag1
read a sequence of commands via terminal and provide some reply*/

#include <iostream>
#include <vector>
#include <string>
#include <iterator>
using namespace std;

int main() {
  vector<bool> vec;
  vector<bool>::iterator it;
  unsigned int idx;
  string command;

  // read the instruction and the integer
  cin >> command;
  copy(istream_iterator<int>(cin), istream_iterator<int>(), back_inserter(vec));

  /* compare the instruction with given key words */
  if (command.compare("add") == 1){
    vec.insert(it, 1);
  }
  else if (command.compare("del") == 1){
    vec.insert(it, 0);
  }

  if (command.compare("qry") == 1){
    *it == 1 ? cout << "T" : cout << "F";
  }
  return 0;
}
