#include "vec.h"
#include<algorithm>
#include<iostream>

vec::vec(int des_size, int des_capacity){
  _size=std::max(0,des_size);
  capacity=std::max(1,des_capacity);
  array=new int[capacity];
  std::cout << "Constructor called\n";
};

vec::vec(const vec & v){
  _size=v._size;
  capacity=v.capacity;
  array=new int[capacity];
  for(int i=0; i<_size; i++)
    array[i]=v.array[i];
  std::cout << "Copy Constructor called\n";  
};

vec::~vec(){
  std::cout << "Destructor called\n";
  delete [] array;
};

vec & vec::operator=(const vec & v){
  if (&v != this){
    delete [] array;
    _size=v._size;
    capacity=v.capacity;
    array=new int[capacity];
    for(int i=0; i<_size; i++)
      array[i]=v.array[i];
  }
  return *this;
};


int & vec::operator[](int i){
  //if (i>=size()) throw 42;
  return  array[i];
};
void vec::push_back(int v){
  if (_size>=capacity){
    capacity=capacity*2;
    std::cout << "capacity increased to " << capacity << "\n";
    int * tmp=new int[capacity];
    for(int i=0; i<_size; i++){
      tmp[i]=array[i];
    }
    delete [] array;
    array=tmp;
  }
  array[_size++]=v;
};
int vec::size(){
  return _size;
};
