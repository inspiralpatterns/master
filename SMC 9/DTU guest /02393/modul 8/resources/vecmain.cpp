#include "vec.h"
#include "vec.cpp"

#include <iostream>
using namespace std;

int main(){
  vec<int> v(0,1);
  for (int i=0; i<10; i++)
    v.push_back(i*i);

  for (int i=0; i<v.size(); i++){
    cout << v[i]
	 << " ";
  }
  cout << endl;

  vec<int> v2=v;
  //vec v2(v);
    
  for (int i=0; i<v2.size(); i++)
    //v2[i]=v[i]*2;
    v2[i]=v[i]*2; 
  
  v=v2;
  // v.operator=(v2);
  
  for (int i=0; i<v2.size(); i++){
    cout << v[i] << " ";
    cout << v2[i] << endl;
  }

  for (vec<int>::iterator it=v.begin(); it!=v.end(); it++){
    cout << *it << " ";
  };
  cout << endl;
  
  return 0;
}

