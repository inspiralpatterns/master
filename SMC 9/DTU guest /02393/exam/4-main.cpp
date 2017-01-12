#include "4-library.h"
#include <iostream>
using namespace std;

int main(){
  queue q(3);
  q.enqueue(17);
  q.enqueue(42);
  q.dequeue();
  q.enqueue(33);
  q.enqueue(12);
  while (!q.isEmpty())
    cout << q.dequeue() << " ";
  cout << endl;
}
