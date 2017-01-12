#ifndef __dll__
#define __dll__

#include <iostream>

using namespace std;

// Basic structure to store elements of a list
struct Node {
    int val;        // contains the value
    Node * next;    // pointer to the next element in the list
    Node * prev;    // pointer to the previous element in the list
};

// Class List
class List {
    
public:
    List(void);             // Constructor
    ~List(void);            // Destructor
    void insert(int n);     // This should insert n in the list
    void reverse(void);     // This should reverse the list
    void print(void);       // This shoiuld print the list
    
private:
    Node * first;           // Pointer to the first (if any) element in the list
    
};

#endif


