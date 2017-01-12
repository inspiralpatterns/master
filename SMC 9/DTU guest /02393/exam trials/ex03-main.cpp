#include <iostream>
#include <string>
#include <set>
#include "ex03-library.h"

using namespace std;

int main(void){

  Dictionary d;

  d.insert_words("car","bil");
  cout << d.get_word(0,"car") << endl;
  cout << d.get_word(1,"bil") << endl ;

  d.insert_words("wagon","vogn");
  d.insert_synonym(0,"car","auto");
  d.insert_synonym(1,"bil","vogn");
  d.insert_synonym(0,"wagon","van");
  set<string> syn = d.get_synonyms(0, "car");

  set<string> s = d.translate(1,"bil");
  for(set<string>::iterator it = s.begin(); it != s.end(); it++)
    cout << *it << " ";
  cout << endl;

  return 0;

}
