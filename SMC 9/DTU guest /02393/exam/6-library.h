#ifndef __HUFFMAN
#define __HUFFMAN

class Huffman{
private:
  int w;
  Huffman * t1;
  Huffman * t2;

  Huffman * root;

 public:
  Huffman(int w): w(w){
    /* define root */
    if (!root) root = this;

    /* set pointer to null */
    t1 = t2 = nullptr;
  }
  Huffman(Huffman *t1, Huffman *t2){
    this->w = t1->w + t2->w;
    this->t1 = t1;
    this->t2 = t2;
  }
  ~Huffman(){
    t1 = t2 = nullptr;
  }
  void display(){
    if (!root) { return; }
    cout << this->w << " ";
    printInOrder(this->left);
    printInOrder(this->right);
  }

};

#endif
