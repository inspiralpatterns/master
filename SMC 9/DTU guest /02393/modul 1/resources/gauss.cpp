//
//  gauss.cpp
//  mattia paterna, september 2016
//

/* compute the Gaussian sum over a specified number of elements that the user has to prompt in*/

#include <iostream>
#include <limits>
using namespace std;

int main() {
    // at the very beginning, we must initialize the variables we are not passing any value
    // obs: initialized memory could be a security problem, and memory is even cleared at the end of the program (C++ is not garbage collector!)
    int n;
    int result = 0;
    int result2 = 0;
    
    // take the input from the user command window
    cin >> n;
    
    for(int i = 1; i <= n; i++){
        // result is pointing to one address in our memory, is calling that placeholder to make something upon it
        // it could be, in machine code:
        // % LOAD result $1
        // % LOAD i $1
        // % ADD $1 $2 $3
        // % STORE $3 result
        
        result = result + i;
    }
    
    // cope with the problem consisting in whether n is odd or even
    if (n%2 == 0){
        int result2 = n/2*(n+1);
    }
    else
    {
        int result2 = n*(n+1)/2.0;
    }
    
    // it is possible to output a long sequence of strings
    // `<<` is an operator (using the other one for input strings) that converts variables in a sequence of characters, or from a keyboard input, and makes output stream.
    cout << n << " " << result << " " << result2 << "\n";
    
    // remember distiction between assignment and comparison operators!
    if (result!= result2){
        cout << "WTF!\n";
    }
    
    return 0;
    }
