#include <iostream>
#include <vector>
using namespace std;

/* 02393 - module 6
OBJECTS AND CLASSES I */

/* C++ features for abstraction:
1. abstraction data types
2. object oriented programming
*/

#define not_found 42

/* define a new type dictionary containing two arrays, one of keys and one
of entries */
struct dict{
  vector<string> keys;
  vector<string> entries;
  // invariant: keys.size()==entries.size()
};

/* define the function prototype */
int findindex(const dict & d, string key);
void insert(dict & d, string key, string entry);
string find(const dict & d, string key);


/* definition of our function to use with the struc */
void insert(dict & d, string key, string entry){
  // find the index of the key we want to provide with an entry
  int i = findindex(d, key);
  if (i == -1) {
    // there's a new entry for both keys and entries vectors
    d.keys.push_back(key);
    d.entries.push_back(entry);
  }
  else{
    // update entry i
    d.entries[i] = entry;
  }

};
string find(const dict & d, string key){
  int i = findindex(d, key);
  if (i == -1) {
    // there's no entry, so we found nothing and get an exception
    throw not_found;
  }
  return d.entries[i];
};
dict empty(){

}

/* obs: we are using call by reference and using the const word on the dict
because we want our dictionary not to be changed by that function */

int findindex(const dict & d, string key){
  for (int i = 0; i < d.dict.size(); i++)
    if (d.keys[i] == key) return i;

    // when I'm here, key is not into my dict d
    return -1;
}

/* obs: that last function is not good for an implementation of an external
library because it is dependent of a specific variable and it won't work if
a programmer will deal with a different type, e.g. trees */

/* define the test case for the library*/
int main(){
  /* define an empty dictionary */
  dict dan2eng;
  insert(dan2eng, "blaa", "blue");
  insert(dan2eng, "roed", "blue");
  insert(dan2eng, "roed", "red");

  // error handling using the try- catch structure
  try{
    cout << "sort ->" << find(dan2eng, "sort") << endl;
  }
  catch(int e){
    cout << "not found!!" << endl;
  }
  cout << "roed ->" << find(dan2eng, "roed") << endl;
}
