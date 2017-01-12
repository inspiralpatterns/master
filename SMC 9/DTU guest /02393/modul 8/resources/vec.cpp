#include "vec.h"
#include<algorithm>
#include<iostream>

template <typename T>
vec<T>::vec(int des_size, int des_capacity){
  _size=std::max(0,des_size);
  capacity=std::max(1,des_capacity);
  array=new T[capacity];
  std::cout << "Constructor called\n";
};

template <typename T>
vec<T>::vec(const vec & v){
  _size=v._size;
  capacity=v.capacity;
  array=new T[capacity];
  for(int i=0; i<_size; i++)
    array[i]=v.array[i];
  std::cout << "Copy Constructor called\n";  
};

template <typename T>
vec<T>::~vec(){
  std::cout << "Destructor called\n";
  delete [] array;
};

template <typename T>
vec<T> & vec<T>::operator=(const vec & v){
  if (&v != this){
    delete [] array;
    _size=v._size;
    capacity=v.capacity;
    array=new T[capacity];
    for(int i=0; i<_size; i++)
      array[i]=v.array[i];
  }
  return *this;
};


template <typename T>
T & vec<T>::operator[](int i){
  //if (i>=size()) throw 42;
  return  array[i];
};

template <typename T>
void vec<T>::push_back(T v){
  if (_size>=capacity){
    capacity=capacity*2;
    std::cout << "capacity increased to " << capacity << "\n";
    int * tmp=new T[capacity];
    for(int i=0; i<_size; i++){
      tmp[i]=array[i];
    }
    delete [] array;
    array=tmp;
  }
  array[_size++]=v;
};

//template class vec<int>;

