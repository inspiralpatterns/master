/* doubly-linked.cpp
  implements a class List of doubly-linked lists.
  See doubly-linked.h for class specifications
*/

#include "doubly-linked.h"

/* define class constructor and destructor */
List::List(void){
  /* setting the pointer to first (not existing, therefore empty) */
  first = 0;
};
List::~List(void){};

/* define class methods */
void List::insert(int n){
  Node * tmp = new Node;
  /* setting the new value inside a new node
  obs: this node doesn't point everywhere */
  tmp->val = n;
  tmp->next = 0;

  if (!first) {
    /* first will point to this first element */
    first = tmp;
  }
  else {
    /* creating a new node that points to first */
    Node * p = first;
    while (p->next) {
      /* traversing the whole list until p->next is NULL */
        p = p->next;
    }
    /* update the pointer of last element to the new one */
    p->next = tmp;
    tmp->prev = p;
  }
};

void List::reverse(void){
  Node * p = first;
  Node * tmp = NULL;
  while (p) {
    /* since there's no tail property, traversing the list until the last
     element and swapping next and previous pointers*/
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
  while (p) {
    cout << p->val << " ";
    p = p->next;
  }
  cout << endl;
}
