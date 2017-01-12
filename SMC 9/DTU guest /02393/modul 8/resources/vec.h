#ifndef __myveclib
#define __myveclib

template <typename T>
class vec{
 private:
  T *array;
  int _size;
  int capacity;

 public:
  vec(int des_size, int capacity);
  vec(const vec & v);
  ~vec();
  vec & operator=(const vec & v);
  T & operator[](int i);
  void push_back(T v);
  int size(){
    return _size;
  };
  typedef T * iterator;
  iterator begin(){return array;};
  iterator end(){return array+_size;};
};




#endif 
