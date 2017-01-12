/* main.cpp
 test case for doubly-linked list
 */

#include <iostream>
#include "doubly-linked.h"

using namespace std;

int main(void){
    
    List l;
    int n;
    
    while(cin >> n){
        l.insert(n);
    }
    
    // Print list as read from cin
    l.print();
    // Reverse the list and print it
    l.reverse();
    l.print();
    // Reverse again and print it
    l.reverse();
    l.print();
    
    return 0;
}


