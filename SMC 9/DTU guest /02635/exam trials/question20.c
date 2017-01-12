/*
purpose:
  implement binomial coefficient function both the iterative and the recursive
  way. The iterative uses factorial and they must be cared.
arguments:
  long n:                   integer n
  long k:                   integer k

  long binomial             function output argument
*/

/* ISSUE: two different values using two different version of the same function */
#include <stdio.h>
#include <stdlib.h>

//#define FACTORIAL
#define RECURSIVE

/* function prototype */
long binomial(long n, long k);

/* main program to test the function */
/* main program for testing */
int main(int argc, char const *argv[]) {
  /* get order of polynomial, assuming n always positive */
  long n;
  long k;
  printf("insert n (max 10): ");
  scanf("%li", &n);
  printf("insert k (max 10): ");
  scanf("%li", &k);

  /* call the function for binomial coefficient and print the result */
  printf("The binomial coefficient of such given n and k is %li\n",
  binomial(n, k));

  return EXIT_SUCCESS;
}


/* FUNCTION DEFINITIONS */
/* A. using factorials */
#ifdef FACTORIAL
/* defining static variable in order to make factorial operation have linear
time complexity */
static long n_fact;
static long k_fact;
static long nk_fact;

long binomial(long n, long k){
  /* remark: it is impossible to compute factorials larger than 20 when
  using built-in data types! */

  /* check for conditions */
  if (k < 0 || k > n) {
    return 0;
  }
  else if (n >= k && k >= 0){
    /* compute n! */
    for (int i = 0; i < n; i++) {
      /* update static variable */
      if (i == 0) n_fact = 1;
      else n_fact *= i;
    }
    /* compute k! */
    for (int i = 0; i < k; i++) {
      /* update static variable */
      if (i == 0) k_fact = 1;
      else k_fact *= i;
    }
    /* compute (n - k)! */
    for (int i = 0; i < n - k; i++) {
      /* update static variable */
      if (i == 0) nk_fact = 1;
      else nk_fact *= i;
    }
  }
  /* compute the binomial coefficient */
  return n_fact / k_fact * (nk_fact);

}
#endif


/* B. using recursion */
#ifdef RECURSIVE
long binomial(long n, long k){
  /* first condition to check, multiple recursion */
  if (n > k && k > 0) return binomial(n - 1, k - 1) + binomial(n - 1, k);

  /* second condition to check */
  else if ((k == 0 &&  n > k) || (n == k && k >= 0)) return 1;

  /* otherwise */
  else return 0;
}
#endif
