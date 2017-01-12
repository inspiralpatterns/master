#include <iostream>
#include <vector>
#include <string>
#include "ex02-library.h"

using namespace std;

/* match function recursively defined */
vector<string> match(vector<string> & u, vector<string> & v){
  /* preliminaries */
  vector<string> w;     // obs: vector is empty if not initialized

  /* a. define base cases */
  /* check for emptyness of vector and return an empty sequence */
  if (u.empty() || v.empty()) return w;

  /* b. define recursive section */
  /* check for equality of first element in a non-empty sequence */
  if (u[0] == v[0]) {
    /* call the recursion and append first element */
    vector<string> tu(u.begin()+1, u.end());
    vector<string> tv(v.begin()+1, v.end());
    w = match(tu, tv);
    w.insert(w.begin(), u[0]);
    return w;
  }

  /* check the last two conditions */
  vector<string> tu(u.begin()+1, u.end());
  vector<string> tv(v.begin()+1, v.end());
  vector<string> w1 = match(u, tv);
  vector<string> w2 = match(tu, v);
  return w1.size() > w2.size() ? w1 : w2;
}


// Do not modify
vector<string> read_until(string stop){
  vector<string> u;
  string e;
  while(true){
     cin >> e;
     if(cin.fail() || e == stop) break;
     u.push_back(e);
   }
   return u;
}

// Do not modify
void display(vector<string> & u){
  for(unsigned int i=0; i<u.size(); i++) cout << u[i] << " ";

  cout << endl;
}


/* observation: we need to allocate twice the same vectors in order to avoid
failure in using the vector method when we check the equality for the first
elements. Precisely, we need first to create the vectors inside the scope and
then call the function recursively. If we allocate vectors outside the scope
of the equality check, when the function calls itself two new fresh vectors
are created again. Doing so, the recursion fails.
*/
