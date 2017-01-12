/* fractions.cpp
class implementation of fractions of integers supporting some basic operations
like addition and multiplication */

#include <iostream>
#include <vector>
#include <string>
#include <iterator>
#include <sstream>
using namespace std;

class fraction{
private:
  // internal representation of a fraction as two integers
  int numerator;
  int denominator;

public:
  // class constructor
  fraction(){

  }

  // build fraction passing the argument to the private member variables
  void setValues(int n, int d){
    numerator = n;
    denominator = d;
    //cout << "This fraction is " << n << "/" << d << endl;
  };

  //fraction update functions prototypes
  void add(fraction f){
    // obs: those assignments are not invertible!
    numerator = numerator*f.denominator + f.numerator*denominator;
    denominator  *= f.denominator;

    /* check for possible fraction shortening
    both numerator and denominator should have modulo 2 equal to zero */
    if (numerator % 2 == 0 && denominator % 2 == 0) {
      numerator /= 2;
      denominator /= 2;
    }

  }
  void mult(fraction f){
    // obs: here they could be invertible
    numerator *= f.numerator;
    denominator  *= f.denominator;

    /* check for possible fraction shortening
    both numerator and denominator should have modulo 2 equal to zero */
    if (numerator % 2 == 0 && denominator % 2 == 0) {
      numerator /= 2;
      denominator /= 2;
    }

  }
  void div(fraction f){
    // obs: one fraction is the inverse
    numerator *= f.denominator;
    denominator  *= f.numerator;

    /* check for possible fraction shortening
    both numerator and denominator should have modulo 2 equal to zero */
    if (numerator % 2 == 0 && denominator % 2 == 0) {
      numerator /= 2;
      denominator /= 2;
    }
  }

  // display fraction
  void display(fraction f){
    cout << f.numerator << " / " << f.denominator << endl;;
  }

};


/* test case for the class fraction */
int main(){
  /* handle with multiple line input from command line */
  string line;
  vector<string> lines;
  vector<string> tokens;

  while (getline(cin, line)){
    if (!line.empty()) {
      /* if line is not empty, store it in the vector */
      lines.push_back(line);
    }
    else break;
  }

  /* for each saved line, build fraction and perform arithmetic */
  for (size_t i = 0; i < lines.size(); i++) {

    /* divide the lines into substrings */
    istringstream iss(lines[i]);
    copy(istream_iterator<string>(iss), istream_iterator<string>(), back_inserter(tokens));

    /* DYNAMIC ALLOCATION USING POINTER TO ARRAY OF CLASSES */
    /* allocate memory - two fractions at a time assumed */
    fraction Fractions[2];
    /* define a pointer to array of classes */
    fraction *pFrac = Fractions;
    int j = 0;  // counter over the tokens vector
    for (size_t i = 0; i < 2; i++) {
      /* get the values for a fraction (conversion from string to int) */
      int n = stoi(tokens[j+0]);
      int d = stoi(tokens[j+2]);
      pFrac->setValues(n, d);
      j += 4;   // heuristic from the command line structure
      pFrac++;
    }

    string op = tokens[3];
    /* clear vector (for back insert at the same position in the next loop) */
    tokens.clear();

    // perform the operation according to the symbol provided by the user
    pFrac = Fractions;
    switch (op[0]) {
      case '+':
        pFrac->add(Fractions[1]);
        break;
      case '*':
        pFrac->mult(Fractions[1]);
        break;
      case 'd':
        pFrac->div(Fractions[1]);
        break;
      default:
        cout << "operation not found!" << endl;
        break;
    }

    // display the result of the arithmetic operation
    pFrac->display(*pFrac);
  }

  return 0;
}
