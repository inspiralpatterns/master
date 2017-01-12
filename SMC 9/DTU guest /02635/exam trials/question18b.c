#include <stdio.h>
#include <assert.h>

static unsigned int counter;

void hanoi(int n, int from_peg, int to_peg) {
  counter += 1;
  /*printf("function call(s): %i\n", counter);*/
  int other_peg;
  assert(n > 0);
  assert(from_peg < 4 && from_peg > 0);
  assert(to_peg < 4 && to_peg > 0);

  if (!(from_peg == 1 || to_peg == 1))  other_peg = 1;
  else if (!(from_peg == 2 || to_peg == 2)) other_peg = 2;
  else other_peg = 3;
   if (n == 1) printf("Move disc %d from peg %d to peg %d\n", 1, from_peg, to_peg);
   else {
    hanoi(n-1, from_peg, other_peg);
    printf("Move disc %d from peg %d to peg %d\n", n, from_peg, to_peg);
    hanoi(n-1, other_peg, to_peg);
  }
return;
}


int main(int argc, char const *argv[]) {
  int from_peg = 1;
  int to_peg = 2;

  for (int n = 1; n < 12; n++) {
    printf("-----------------\n");
    printf("\n\nn = %d\n", n);
    counter = 0;
    hanoi(n, from_peg, to_peg);
    printf("TOTAL FUNCTION CALLS: %i\n\n", counter);
  }

  return 0;
}

/* observation:
  a. time complexity is exponential */
