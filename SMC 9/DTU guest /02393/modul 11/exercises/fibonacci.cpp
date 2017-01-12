/* fibonacci.cpp
  given a non negative number n, provides some information about the computation
  of the implementation of the Fibonacci function recursively defined.

  Arguments:
    call tree in pre-order (all Fibonacci numbers computed)
    size of tree
    heigth of tree
    numbers of leaf
*/

#include <iostream>
using namespace std;
typedef unsigned long ul;

//#define DEBUG

/* class definition for Fibonacci tree
Strategy:
  each node contains the value n that the function takes during its recursion.
  Each value n is then successively overwritten by the function output
*/
class Fibonacci_tree{
private:
  struct Fibonacci_node{
    ul number;                              // store the n-th fibonacci number
    int n;                                  // fibonacci number to compute
    bool isLeaf;                            // true if the node is leaf
    Fibonacci_node * left;
    Fibonacci_node * right;
  };

  /* definition of the root of the binary tree */
  Fibonacci_node * root;

  /* class private methods (recursively defined) */

  /* fibonacci
  Purpose:
    compute the Fibonacci series recursively

  Arguments:
    n                             no of digits to compute
  */
  ul fibonacci(int n){
    /* BASE CASE */
    if (n == 0) { return 1; }
    if (n == 1) { return 1; }

    /* call the function recursively */
    return fibonacci(n - 1) + fibonacci(n - 2);
  };

  /* insertR
  Purpose:
    create a node to store values of n that are used through the computation

    Arguments:
      n                           no of digits to compute
      node                        pointer to the root of the tree
  */
  Fibonacci_node * insertR(int n, Fibonacci_node * node){
    if (!node) {
      /* if pointer is null create a new node */
#ifdef DEBUG
      cout << " ...creating a new node" << endl;
#endif
      Fibonacci_node * tmp = new Fibonacci_node;
      tmp->n = n;
      tmp->number = fibonacci(tmp->n);
#ifdef DEBUG
      cout << "...new node with n = " << tmp->n << " fibonacci = " << tmp->number << endl;
#endif
      tmp->left = tmp->right = 0;
      // cout << "...defining isLeaf" << endl;
       tmp->isLeaf = 0;
// #ifdef DEBUG
//       cout << "node " << (node->isLeaf? " is" : "is not") << "leaf" << endl;
// #endif
      /* update the pointer and return it */
      node = tmp;

      /* BASE CASE */
      if (n == 0) {
#ifdef DEBUG
        cout << "...base case n = 1, fibonacci = 1" << endl;
#endif
        node->isLeaf = 1;
        return node;
      }
      if (n == 1) {
#ifdef DEBUG
        cout << "...base case n = 1, fibonacci = 1" << endl;
#endif
        node->isLeaf = 1;
        return node;
      }
    }

    /* call the function recursively */
#ifdef DEBUG
    cout << "node for n = " << n << " is not NULL" << endl;
    cout << "...call left child " << "n = " << n - 1 << endl;
#endif
    node->left = insertR(n - 1, node->left);
#ifdef DEBUG
    cout << "...call right child " << "n = " << n - 2<< endl;
#endif
    node->right = insertR(n - 2, node->right);

    return node;
  };

  void deleteR(Fibonacci_node * node){
    /* it the tree is empty, nothing to delete */
    if (!node) return;
    deleteR(node->left);
    deleteR(node->right);
    delete node;
  };

  void printInOrder(Fibonacci_node * node){
    if (!node) { return; }
    cout << node->number << " ";
    printInOrder(node->left);
    printInOrder(node->right);
  };

  int getDepthR(Fibonacci_node * node){
    if (!node) { return 0; }
    int left = getDepthR(node->left);
    int right = getDepthR(node->right);
    return 1 + (left > right? left : right);
  }

  int getLeafR(Fibonacci_node * node, int leafNo){
    if(!node) { return leafNo; }
    node->isLeaf? ++leafNo : leafNo;
    leafNo = getLeafR(node->left, leafNo);
    leafNo = getLeafR(node->right, leafNo);
    return leafNo;
  }

  int getSizeR(Fibonacci_node * node){
    if(!node) return 0;
    else return getSizeR(node->left) + getSizeR(node->right) + 1;
  }
public:
  Fibonacci_tree(){
    root = 0;
  }
  ~Fibonacci_tree(){ deleteR(root); }

  /* class public methods (they include private methods recursively defined)
  Purpose:
    avoiding access to private methods that deal with private class members
    differentiate recursive and non-recursive methods
   */
  void insert(int n){
    /* first, create initial node and compute fibonacci for the root */
    Fibonacci_node * tmp = new Fibonacci_node;
    tmp->n = n;
    tmp->number = fibonacci(n);
    tmp->left = tmp->right = 0;
    tmp->isLeaf = false;
    //getNo(tmp);

    /* make root point to the first element of the tree */
    root = tmp;
#ifdef DEBUG
    cout << "root : " << root->n << " " << root->number << endl;
#endif

    /* then call the recursive function for n != 0 */
#ifdef DEBUG
    cout << "call insertR\n" << endl;
#endif
    if (n) root = insertR(n, root);
    /* if n = 0, there will not be any other nodes, so it is a leaf */
    else tmp->isLeaf = true;
  };

  void print(){
    cout << "Call tree in pre-order: ";
    printInOrder(root);
    cout <<  endl;
  }

  void getNo(Fibonacci_node * node){
    cout << "fibonacci: " << node->number << endl;
  }

  void getDepth(){
    cout << "Call tree depth: " << getDepthR(root);
    cout << endl;
  }

  void getLeaf(){
    /* set the counter for leaf */
    int leafNo = 0;

    /* call the recursive function */
    leafNo = getLeafR(root, leafNo);
    cout << "Call tree leafs: " << leafNo ;
    cout << endl;
  }

  void getSize(){
  /* set the counter for size */
  int size = 0;

  /* call the recursive function */
  size = getSizeR(root);
  cout << "Call tree size: " << size;
  cout << endl;
  }

};
/* END OF CLASS DECLARATION */



/* main program to check the class */
int main(int argc, char const *argv[]) {
  int n;
  cin >> n;

  /* instantiate a Fibonacci tree */
  Fibonacci_tree fib_series;
#ifdef DEBUG
  cout << "class created " << endl;
#endif
  /* fill the tree */
  fib_series.insert(n);
#ifdef DEBUG
  cout << "\n\n...insertion succedeed vivalamerda" << endl;
#endif
  /* print it */
  fib_series.print();
#ifdef DEBUG
  cout << "\n\n...print succedeed" << endl;
#endif
/* get tree size */
fib_series.getSize();
/* get tree depth */
fib_series.getDepth();
/* get tree leafs */
fib_series.getLeaf();

  return 0;
}
