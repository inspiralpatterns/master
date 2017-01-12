#include <iostream>
#include <vector>
#include "ex01-library.h"

using namespace std;

// Exercise 1 (a)
// Check and correct if necessary
/* corrected: index of both i and j starts from 0 */
void display(double *A, unsigned int n){
  for(unsigned int i = 0; i < n; i++){
     for(unsigned int j = 0; j < n; j++){
       cout << A[i*n+j] << " ";
      }
    cout << endl;
  }
}

// Exercise 1 (b)
// Implement this function
/* obs: one for loop with i ranging up to n*n possible when instantiate all
  cells with the same number */
void reset(double *A, unsigned int n, double x){
    for (unsigned int i = 0; i < n*n; i++) A[i] = x;
}

// Exercise 1 (c)
// Implement this function
/* strategy: check using leading dimension (in case of square matrix, leading
  dimension is identical whether assuming row-major or column-major ordering) */
void reduce(double * A, unsigned int n){

  /* creating matrix to store reduced cells */
  double * R = new double[n*n];
  for (unsigned int i = 0; i < n*n; i++){
    int above = i - n;
    int below = i + n;
    int leftward = i - 1;
    int rightward = i + 1;

    if (above >= 0) R[i] = A[above];
    if (below < n*n) R[i] += A[below];
    if ((leftward >= 0) && (leftward % n != 2)) R[i] += A[leftward];
    if (rightward % n > 0) R[i] += A[rightward];
  }

  /* overwrite values
  obs: we can't do something A = B alike because the function creates a new
  copy of the main pointer */
  for (unsigned int i = 0; i < n*n; i++){
    A[i] = R[i];
  }
  /* free memory */
  delete [] R;
}

// Exercise 1 (d)
// Implement this function
vector<double> sumRows(double * A, unsigned int n){
  /* allocate space for a vector */
  vector<double> v;
  double sum = 0;

  /* compute the sum for each row and store it into the vector */
  for (unsigned int i = 0; i< n; i++){
    for (unsigned int j = 0; j < n; j++){
      sum += A[i*n + j];
    }
    v.push_back(sum);
    /* reset sum */
    sum = 0;
  }

  return v;
}

// Exercise 1 (e)
// Implement this function
vector<double> sumCols(double * A, unsigned int n){
  /* allocate space for a vector */
  vector<double> v;
  double sum = 0;

  /* compute the sum for each row and store it into the vector */
  for (unsigned int i = 0; i< n; i++){
    for (unsigned int j = 0; j < n*n; j += n){
      sum += A[i + j];
    }
    v.push_back(sum);
    /* reset sum */
    sum = 0;
  }

  return v;
}

// Do not modify
void print(vector<double> & v){
  for (unsigned int i = 0; i < v.size(); i++){
    cout << v[i] << " ";
  }
  cout << endl;
}
