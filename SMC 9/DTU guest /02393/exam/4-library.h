#ifndef __MYQUEUE
#define __MYQUEUE

class queue{
private:
  int * elements;
  int first,last;
  int capacity;

public:
  queue(int capacity=10);
  queue(const queue & q);
  ~queue();
  void enqueue(int i);
  int dequeue();
  int top();
  bool isEmpty();
};

	  
#endif
