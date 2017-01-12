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

/* define a class with members variables and functions */
class dict{
private:
  vector<string> keys;
  vector<string> entries;
  // now invariant is guaranteed because people can't manipulate variables

public:
  // define constructor and destructor
  dict(){cout << "Hello!\n";}
  ~dict(){cout << "Goodbye!\n";}

  /* define the function prototype */
  int findindex(string key);
  void insert(string key, string entry);
  string find(string key);

  void insert(string key, string entry){
    // find the index of the key we want to provide with an entry
    int i = findindex(key);
    if (i == -1) {
      // there's a new entry for both keys and entries vectors
      keys.push_back(key);
      entries.push_back(entry);
    }
    else{
      // update entry i
      entries[i] = entry;
    }
  };

  // obs: how to apply the constant concept inside a class
  string find(string key) const {
    int i = findindex(key);
    if (i == -1) {
      // there's no entry, so we found nothing and get an exception
      throw not_found;
    }
    return entries[i];
  };
  dict empty(){

  }

  // make this function not to be accessed from outside
private:
  int findindex(string key) const {
    for (int i = 0; i < d.dict.size(); i++)
      if (keys[i] == key) return i;

      // when I'm here, key is not into my dict d
      return -1;
  }

};




int main(){
  /* define an empty dictionary - the constructor is called */
  dict dan2eng();
  dan2eng.insert("blaa", "blue");
  dan2eng.insert("roed", "blue");
  dan2eng.insert("roed", "red");

  // error handling using the try- catch structure
  try{
    cout << "sort ->" << dan2eng.find("sort") << endl;
  }
  catch(int e){
    cout << "not found!!" << endl;
  }

  cout << "roed ->" << dan2eng.find("roed") << endl;

  return 0;
  /* the destructor is called */
}
