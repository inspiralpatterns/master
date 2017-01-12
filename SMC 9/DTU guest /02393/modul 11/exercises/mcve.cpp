#include <iostream>
using namespace std;
typedef unsigned long ul;

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
        ul fibonacci(int n){
        /* BASE CASE */
        if (n == 0) { return 1; }
        if (n == 1) { return 1; }

        /* call the function recursively */
        return fibonacci(n - 1) + fibonacci(n - 2);
      };

      Fibonacci_node * insertR(int n, Fibonacci_node * node){
        if (!node) {
        /* if pointer is null create a new node */

        Fibonacci_node * tmp = new Fibonacci_node;
        tmp->n = n;
        tmp->number = fibonacci(tmp->n);
        tmp->left = tmp->right = 0;
        tmp->isLeaf = 0;

        /* update the pointer and return it */
        node = tmp;

        /* BASE CASE */
        if (n == 0) {
          node->isLeaf = 1;
          return node;
        }
        if (n == 1) {
          node->isLeaf = 1;
          return node;
        }
      }

      /* call the function recursively */
      node->left = insertR(n - 1, node->left);
      node->right = insertR(n - 2, node->right);

      return node;
    };

  public:
    Fibonacci_tree(){
      root = 0;
    }
    ~Fibonacci_tree(){}

    /* class public methods (they include private methods recursively defined)*/
    void insert(int n){

      /* first, create initial node and compute fibonacci for the root */
      Fibonacci_node * tmp = new Fibonacci_node;
      tmp->n = n;
      tmp->number = fibonacci(n);
      tmp->isLeaf = false;
      //getNo(tmp);

      /* make root point to the first element of the tree */
      root = tmp;

      /* then call the recursive function */
      root = insertR(n, root);
    };
};
/* END OF CLASS DECLARATION */


/* main program to check the class */
int main(void) {
  int n = 3;

  /* instantiate a Fibonacci tree */
  Fibonacci_tree fib_series;
  /* fill the tree */
  fib_series.insert(n);

  return 0;
}
