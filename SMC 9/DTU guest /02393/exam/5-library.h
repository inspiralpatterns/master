#ifndef __TTT
#define __TTT
#include<iostream>
#include<vector>
using namespace std;

enum field {O,X,draw};

typedef vector<field> state;
// 0 1 2
// 3 4 5
// 6 7 8

// given a state, check if any has already won, and return draw otherwise.
field winner(const state & s);

// given a state and whose turn it is (turn!=draw!), compute the set of next states.
vector<state> next(const state & s, field turn);

// given a state and whose turn it is (turn!=draw), compute the best
// possible outcome for that player
field best(const state & s, field turn);

string show(const field p);

#endif
