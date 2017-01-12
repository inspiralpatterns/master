/* datasets.cpp
  read some mixed datasets of int values from cin input and process them */

#include <iostream>
#include <algorithm>
#include <vector>
#include <numeric>
#include <functional>

using namespace std;

// in case of debug to allow for print extra lines of code
//#define DEBUG
//#define SORTING
//#define INTERLEAVE
#define DOT_PRODUCT

/* exercise 1: read datasets and write them into cout in ascending order */
void print_vector(const vector<int> & v){
  for (int i = 0; i < (int) v.size(); i++) {
    cout << v[i] << " ";
  }
}

int main(){
  // create a vector for each dataset (assuming 2 of them)
  vector<int> a;
  vector<int> b;
  char id = 0;
  int value;
  char* pvalue;

  // create a string and read a full line
  string line;
  getline(cin, line);

  /* remove spaces inside the string
  OBS: use of string::erase for the string to be modified in length because the
  algorithm remove can't itself change the container */
  line.erase(std::remove(line.begin(), line.end(), ' '), line.end());

  #ifdef DEBUG
  cout << line << endl;
  #endif

  for (string::iterator it = line.begin(); it != line.end(); ++it) {
    // get the database and increase the counter
    id = *it++;

    #ifdef DEBUG
    cout << id << endl;
    cout << *it << endl;
    #endif

    /* assign the pointer to char the current address of the value
    OBS: not sure about it */
    pvalue = & (*it);
    // convert the ascii value into type int
    value = atoi(pvalue);

    #ifdef DEBUG
    cout << value << endl;
    #endif

    // check for dataset and thereby write in the chosen vector
    switch (id) {
      case 'a':
        a.push_back(value);
        break;
      case 'b':
        b.push_back(value);
        break;
    }
  }

  #ifdef DEBUG
  cout << "Size of a: " << a.size() << endl;
  cout << "Size of b: " << b.size() << endl;
  #endif


  /* according to the different choice of outputs, define routines that will
  be performed only when including the specific word in the preprocessor */
  // A. sorting vectors
  #ifdef SORTING
  // sort vector - if sorting defined
  sort(a.begin(), a.end());
  sort(b.begin(), b.end());

  // print vectors
  print_vector(a);
  print_vector(b);
  #endif

  // B. interlveaving vectors
  #ifdef INTERLEAVE
  vector<int> result;
  auto m = min(a.size(), b.size());
  for (size_t i = 0; i < m; i++) {
    result.push_back(a[i]);
    result.push_back(b[i]);
  }
  if( m < a.size() ) result.insert(result.end(), a.begin()+m, a.end());
  if( m < b.size() ) result.insert(result.end(), b.begin()+m, b.end());

  for (int i = 0; i < (int) result.size(); i++) {
    cout << result[i] << " ";
  }
  #endif

  // C. get the dot product of the vectors
  #ifdef DOT_PRODUCT
  auto m = max(a.size(), b.size());
  // if one vector is shorter than the other, fill it with zeros
  if( m > a.size() ) a.insert(a.end(), m - a.size(), 0);
  if( m > b.size() ) b.insert(b.end(), m - b.size(), 0);

  // get the inner product
  int dot = inner_product(a.begin(), a.end(), b.begin(), 0);
  cout << dot << endl;
  #endif

  return 0;
}
