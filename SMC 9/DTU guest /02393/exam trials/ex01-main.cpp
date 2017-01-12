#include <iostream>
#include <string>
#include "ex01-library.h"

using namespace std;


int main(void){

    // I am building my initial matrix here
    unsigned int n = 3;
    double * A = new double[n*n];

    // I am setting all values to 0
    reset(A,n,0);

    // Setting some values in the matrix
    A[0*3+1] = 1;
    A[1*3+0] = 2;
    A[1*3+2] = 3;
    A[2*3+1] = 4;
    display(A,n);
    cout << endl;

    // Reducing the matrix
    reduce(A,n);
    display(A,n);
    cout << endl;

    // Finally, I am summing up rows and values
    vector<double> v;
    v = sumRows(A,n);
    print(v);
    v = sumCols(A,n);
    print(v);

return 0;
}
