/* doubly-linked.cpp
 implements a class List of doubly-linked lists.
 See doubly-linked.h for class specifications
 */

#include <iostream>
#include "doubly-linked.h"
using namespace std;


/* define class constructor and destructor */
List::List(void){
    /* setting the pointer to first (not existing, therefore empty) */
    first = 0;
};
List::~List(void){};

/* define class methods */
void List::insert(int n){
    /* insert at the end of the list */
    Node * tmp = new Node;
    /* setting the new value inside a new node */
    tmp->val = n;
    tmp->next = 0;
        
    if (!first) {
        /* setting pointers */
        first = tmp;
    }
    else {
        Node * p = first;
        while (p->next) {
            p = p->next;
        }
        p->next = tmp;
        tmp->prev = p;
    }
};

void List::reverse(void){
    cout << "...calling reverse method for list" << endl;
    Node * p = first;
    Node * tmp = NULL;
    while (p) {
        /* traversing the list until the last element and
         swapping next and previous pointers*/
        tmp = p->next;
        p->next = p->prev;
        p->prev = tmp;

        /* changing the pointer to first element */
        if (p->prev == NULL) {first = p;}
        
        /* move to the next node */
        p = p->prev;
    }
    
};

void List::print(void){
    Node * p = new Node;
    p = first;
    cout << "...printing the list" << endl;
    while (p) {
        cout << p->val << " ";
        p = p->next;
    }
    cout << endl;
}
