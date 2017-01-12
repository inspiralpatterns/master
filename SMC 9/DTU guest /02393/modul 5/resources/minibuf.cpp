/* 02393 - module 5
  LIBRARIES AND INTERFACES, CONTAINERS */

#include <iostream>
#include <vector>

using namespace std;


void scale_vector(vector<int> & v, int scale){
  for (int i = 0; i < v.size(); i++) {
    v.push_back(scale*i);
  }
}

/* OBS: the use of const before the type declaration makes sure that the
  original values won't be changed. That's because a `call by reference` is used
  and the function is working directly on original data */
void print_vector(const vector<int> & v){
  for (int i = 0; i < v.size(); i++) {
    cout << v[i] << endl;
  }
}

int main(){
  vector<int> v;
  for (int i = 0; i < v.size(); i++) {
    v.push_back(i);
  }

  int scale = 2;

  scale_vector(v , scale);
  print_vector(v);
  return 0;
}
