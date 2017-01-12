#include <iostream>
#include "doubly-linked.h"

using namespace std;


List::List(){
  first=last=0;
}

// recursive function to erase all elements in a linked list
void List::eraseR(Node * p){
  if (!p) return;
  // recursively delete all successor nodes
  eraseR(p->next);
  delete p;
}

List::~List(){
  eraseR(first);
}

void List::insert(int n){
  Node *  p= new Node;
  p->val = n;
  p->prev=p->next=0;
  
  if (!first){
    first=last=p;
    return;
  }
  
  // If the list is not reversed, insert the new element at the end
  if (!isReversed){
    p->prev=last;
    last->next=p;
    last=p;
  }
  // otherwise, at the end:
  else{
    p->next=first;
    first->prev=p;
    first=p;
  };
}

void List::reverse(){
  // really easy now -- we just flip this bit:
  isReversed= !isReversed;
}

void List::printR(Node *n){
  if (!n){ cout << endl; return; }
  cout << n->val << " ";
  // we recursively print the rest of the list,
  // depending on whether the list is reversed
  if (!isReversed)
    printR(n->next);
  else
    printR(n->prev);
}  

void List::print(){
  if (!isReversed)
    printR(first);
  else
    printR(last);
}


