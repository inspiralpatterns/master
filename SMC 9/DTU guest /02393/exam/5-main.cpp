#include "5-library.h"
#include <iostream>
using namespace std;

int main(){
  state s(9);
  for(int i=0; i<9; i++) s[i]=draw;

  cout << "projected winner: " << show(best(s,X)) << endl;

  s[0]=X;
  cout << "projected winner: " << show(best(s,O)) << endl;

  s[2]=O;
  cout << "projected winner: " << show(best(s,X)) << endl;
}
