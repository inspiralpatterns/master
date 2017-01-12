#include<iostream>
#include "5-library.h"
#include<vector>
using namespace std;

#define check(a,b,c) if(s[a]==s[b] && s[b]==s[c] && s[c]!=draw) return s[c]
#define inv(a) a==O?X:O

field winner(const state & s){
  check(0,1,2);
  check(3,4,5);
  check(6,7,8);
  check(0,3,6);
  check(1,4,7);
  check(2,5,8);
  check(0,4,8);
  check(2,4,6);
  return draw;
}

vector<state> next(const state & s, field turn){
  vector<state> choices;
  for(int i=0; i<9; i++){
    if(s[i]==draw){
      state s2(s);
      s2[i]=turn;
      choices.push_back(s2);
    }
  }
  return choices;
}

field best(const state & s, field turn){
  /* recursive implementation */
  /* A. compute all the next states for the current player */
  vector<state> choices = next(s, turn);
  /* check for more moves possible */
  if (choices.size() == 0) {
    return winner(s);
  }

  /* B. compute recursively for all next states when it is the
  opponent turn */
  for (int i = 0; i < choices.size(); i++) {
    return best(choices[i], inv(turn));
  }

}

string show(const field p){
  if (p==X) return "X";
  if (p==O) return "O";
  if (p==draw) return "-";
  return "?";
}
