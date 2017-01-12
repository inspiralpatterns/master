#ifndef __ex01_library__
#define __ex01_library__

#include <vector>

using namespace std;

void display(double * A, unsigned int n);
void reset(double * A, unsigned int n, double x);
void reduce(double * A, unsigned int n);
vector<double> sumRows(double * A, unsigned int n);
vector<double> sumCols(double * A, unsigned int n);
void print(vector<double> & v);

#endif 
