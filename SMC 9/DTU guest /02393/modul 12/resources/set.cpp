#include <iostream>
using namespace std;

template <typename T>
class sp{
private:
  struct reference{
    T * pointer;
    int counter;
  };

  reference * ref;

  void del(){
    if (!ref) return;
    ref->counter--;
    if (!ref->counter){
      cout << "Deleting " << ref << " " << ref->pointer << endl;
      delete ref->pointer;
      delete ref;
    }

  }
  
  void copy(const sp & smartpointer){
    ref=smartpointer.ref;
    if (ref) ref->counter++;
  }
  
public:
  sp(T * pointer=0){
    if (!pointer){ ref=0; return; }
    ref=new reference;
    ref->counter=1;
    ref->pointer=pointer;
    cout << "Creating " << ref << " " << ref->pointer << endl;
  };
  
  sp(const sp & smartpointer){
    copy(smartpointer);
  };

  ~sp(){
    del();
  };
  
  bool null(){
    return !ref;
  };
  
  T* operator->(){
    return ref->pointer;
  };
  
  sp & operator=(const sp & smartpointer){
    if (this!=&smartpointer){
      del();
      copy(smartpointer);
    }
    return *this;
  };

  T operator*(){
    cout << "error";
  };
  
  
};

struct node{
  int el;
  sp<node> next;
};

class set{
private:
  sp<node> head; // empty iff head==0

  void printRec(sp<node> n){
    if (n.null()) cout << "\n";
    else{
      cout << n->el << " ";
      printRec(n->next);
    }
  };

  sp<node> insertRec(sp<node> n, int i){
    if (n.null() || n->el >i){
      sp<node> tmp(new node);
      tmp->el=i;
      tmp->next=n;
      return tmp;
    }
    if (n->el==i) return n;
    // n->el<i
    n->next=insertRec(n->next,i);
    return n;
  };
  
public:
  set(){  };
  void insert(int i){ head=insertRec(head,i); };
  void print(){ printRec(head); };
};


int main(){
  /*
  set set1, set2;

  set1.insert(22);
  set1.insert(25);
  set1.insert(22); // a second time...

  set2.insert(57);
  set2.insert(10);
  set2.insert(39);
  set2.insert(22); // and a third time
  //  set1=set1+set2; // set1.operator=(set1+set2);
  // set  set3=set1+set2;

  
  set1.print(); 
  set2.print(); // should be empty (our implementation of add "consumes" set2)
  //set3.print();
*/
  sp<node> first(new node);
  first->next=new node;
  sp<node> tmp=first->next;
  first=tmp;
}
