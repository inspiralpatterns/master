#include <iostream>
#include <vector>
#include <string>
#include "ex02-library.h"

int main(void){
// Read two sequences of strings
// end of sequence is denote by "STOP"
  vector<string> u = read_until("STOP");
  vector<string> v = read_until("STOP");

  // Match the sequences
  vector<string> w = match(u,v);

  // Display the result
display(w);

return 0;

}
