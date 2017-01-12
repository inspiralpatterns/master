#include <iostream>
using namespace std;
#include "6-library.h"

int main(){
  Huffman *t1=new Huffman(1);
  Huffman *t2=new Huffman(3);
  Huffman *t3=new Huffman(t1,t2);
  Huffman *t4=new Huffman(5);
  Huffman *t5=new Huffman(8);
  Huffman *t6=new Huffman(t4,t5);
  Huffman *t =new Huffman(t3,t6);

  t->display();

}

