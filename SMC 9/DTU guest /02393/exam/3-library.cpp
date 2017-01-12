#include <iostream>
#include <string>
#include <vector>
#include <list>
using namespace std;

// Format for outputting elements:
void print(string s, int n){
  cout << n << "x " << s << endl;
}


int main(){
  // Todo: Declare datastructure to hold the elements
  /* strategy: define a list of strings where to place the input */
  list<string> items;
  /* define a vector of int to store quantities */
  vector<unsigned int> quantities;

  string s;
  while(true){
    cin >> s;
    if(cin.fail()){
      break;
    }
    items.push_back(s);
  }

  /* order items alphabetically */
  items.sort();

  /* get quantity for each item */
  unsigned int counter;
  list<string>::iterator m;
  list<string>::iterator n;

  for (m = items.begin(); m != items.end(); m++) {
    counter = 0;
    /* skip if element is equal to the previous */
    /* issue: m - 1 not defined because m is list iterator */
    if (*m == *(m-1) && m != items.begin()) {
      m++;
      break;
    }
    /* loop over all the element in the array */
    for (n = items.begin(); n != items.end(); n++) {
      if (*m == *n) counter += 1;
    }
    /* insert quantities */
    quantities.push_back(counter);
  }

  /* delete all equal elements inside the list */
  items.unique();

  // call the print function accordingly to present the shopping list
  int idx = 0;
  for (auto e : items) {
    /* issue: conversion needed from list to string */
    print(items, quantities[idx]);
    idx++;
  }

  return 0;
}
