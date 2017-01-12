#ifndef __myveclib
#define __myveclib

class vec{
 private:
  int *array;
  int _size;
  int capacity;

 public:
  vec(int des_size, int capacity);
  vec(const vec & v);
  ~vec();
  vec & operator=(const vec & v);
  int & operator[](int i);
  void push_back(int v);
  int size();
};




#endif 
