/* 02393 MODULE 9
RECURSIVE PROGRAMMING */

#include <iostream>
#include <vector>

using namespace std;

/* MERGE SORT ALGORITHM, THE RECURSIVE VERSION */
/* define the merge algorithm */
vector<int> merge(vector<int> v1, vector<int> v2){
  /* assume v1 and v2 are sorted, return a sorted composition */
  vector<int> result(v1.size() + v2.size());
  int i, j, k;
  i = j = k = 0;
  while (i < v1.size() && j < v2.size()) {
    if (v1[i] <= v2[j]) result[k++] = v1[i++];
    else result[k++] = v2[j++];
  }

  /* when one of the list is finished, copy the values left in the other one */
  while (i < v1.size()) {
    result[k++] = v1[i++];
  }

  while (j < v2.size()) {
    result[k++] = v2[j++];
  }

  return result;
}

/* define the recursive sorting algorithm */
vector<int> mergesort(vector<int> v){
  /* define the induction base */
  int size = v.size();
  if (size < 2) return v;

  /* split the problem into a smaller problem, assuming that we always have a
  vector of length 2*/
  int mid = size / 2;
  int i;

  vector<int> v1(mid);
  vector<int> v2(size - mid);
  /* fill the vector with values from the original */
  for (i ; i < mid; i++) v1[i] = v[i];
  for (; i < size; i++) v2[i - mid] = v[i];

  /* here's the recursion */
  v1 = mergesort(v1);
  v2 = mergesort(v2);

  /* return two sorted sublist using the previous function */
  return merge(v1, v2);


  /* check on templates to allow for sorting arbitrary dat types (e.g. strings) */
