#include <iostream>
#include "4-library.h"

using namespace std;
/* class function declaration */

/* constructor definition */
queue::queue(int capacity) : capacity{capacity}{
  /* dynamic memory allocation */
  elements = new int[capacity];
  /* set all element to zero */
  for (int i = 0; i < capacity; i++) {
    elements[i] = 0;
  }
  /* set indices to zero (empty array) */
  first = last = 0;
}


/* destructor definition */
queue::~queue(){
  /* free memory */
  delete [] elements;
}


/* copy constructor definition
(provide a copy of the array elements) */
queue::queue(const queue & q){
  /* allocate new array q.capacity long*/
  int * elements = new int[q.capacity];

  /* copy elements into the new array */
  for (int i = 0; i < q.last; i++) {
    elements[i] = q.elements[i];
  }

  last = q.last;
}


void queue::enqueue(int i){
  if (last > capacity) {
    exit(-1);
  }

  if (first == last){
    elements[0] = i;
    last++;
    return;
  }

  /* if space left, insert the element after the last */
  elements[last] = i;
  /* update counter to last element of the queue */
  last++;
}


int queue::dequeue(){
  /* check for the queue not to be empty */
  if (isEmpty()) {
    cout << "empty queue" << endl;
    exit(-1);
  }

  int tmp = elements[first];

  /* move all elements and update last pointer
  (issue: O(n) time complexity) */
  for (int i = 1; i < last; i++) {
    elements[i-1] = elements[i];
  }

  elements[last] = 0;
  last--;

  /* return the element */
  return tmp;
}

int queue::top(){
  /* check for the queue not to be empty */
  if (isEmpty()) {
    cout << "empty queue" << endl;
    exit(-1);
  }

  return elements[first];
}


bool queue::isEmpty(){
  /* assumption: the queue is empty if first = last */
  return first == last? true : false;
}
