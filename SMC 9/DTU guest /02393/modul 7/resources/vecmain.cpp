#include "vec.h"
#include <iostream>
using namespace std;

int main(){
  vec v(0,1);
  for (int i=0; i<10; i++)
    v.push_back(i*i);

  for (int i=0; i<v.size(); i++){
    cout << v[i]
	 << " ";
  }
  cout << endl;

  vec v2=v;
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
  return 0;
}
