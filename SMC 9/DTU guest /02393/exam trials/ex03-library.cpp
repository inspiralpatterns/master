#include <iostream>
#include <map>
#include <set>
#include <vector>
#include "ex03-library.h"

using namespace std;

Dictionary::Dictionary(void){
  cout << "constructor called" << endl;
  /* get vectors of size 2 */
  words.push_back(map<string,string>());
  words.push_back(map<string,string>());
  /* better solution */
  synonyms.resize(2);
  cout << "size of word: " << words.size() << endl;
  cout << "size of synonims: " << synonyms.size() << endl;
}

void Dictionary::insert_words(string u, string v){
  cout << "inserting new word" << endl;
  /* first word will be mapped to second, and viceversa */
  words[0][u] = v;
  words[1][v] = u;
  cout << "word inserted: " << words[0][u] << "/" << words[1][v] << endl;
}


string Dictionary::get_word(int lang, string u){
  /* the find method on a map return the value associated to a key */
  cout << "get translation for " << u << ":" << endl;
  return words[lang][u];
}

// Exercise 3(c)
void Dictionary::insert_synonym(int lang, string u, string v){
  /* insert synonim for word u of language lang */
  cout << "insert synonim" << endl;
  synonyms[lang][u].insert(v);
  synonyms[lang][v].insert(u);
}

// Exercise 3(d)
set<string> Dictionary::get_synonyms(int lang, string u){
  cout << "get synonim(s) for " << u << ":" << endl;
  return synonyms[lang][u];   // WTF segmentation fault?
  cout << "...done" << endl;
}

// Exercise 3(e)
set<string> Dictionary::translate(int lang, string u){
  // exercise not clear at all
}
