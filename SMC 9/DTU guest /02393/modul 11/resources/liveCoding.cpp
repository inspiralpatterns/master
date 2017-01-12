/* 02393 - MODUL 11
  Topic: bynary tree
  Use: new implementation of a dictionaty using binary tree

*/

#include <iostream>

using namespace std;

#define not_found 42

/* define a class with members variables and functions */
class dict{
private:
  struct node{
    string key;           // new world
    string entry;         // translation
    /* both represents together a new entry in the dictionary */
    node * left;
    node * right;
  };

  /* definition of the root of the binary tree */
  node * root;

  /* should be private because it contains a private member */
  node * insertRec(string key, string entry, node * n){
  if (!n){
    /* if there's no node, create a new one and return it */
    node * tmp = new node;
    tmp->key = key;
    tmp->entry = entry;
    tmp->left = tmp->right = NULL;
    return tmp;
  }

  /* otherwise, check the existing root note:
   1. if exists yet, overwrite and return it */
  if (key == n->key) {
    n->entry = entry;
    return n;
  }
  /* 2. key is smaller than given key */
  if (key < n->key) {
    /* call the function recursively, updating the pointer to the left child
    OBS: in a binary tree, the left child is always smaller */
    n->left = insertRec(key, entry, n->left);
    return n;
  }
  /* 3. key is larger than given key */
  if (key > n->key) {
    n->right = insertRec(key, entry, n->right);
    return n;
  }

  return n;
};

string findR(string key, node * n) const {
  /* if root note found, throw an exception that will be catched, making the
  program terminate */
  if (!n) throw not_found;
  if (n->key == key) return n->entry;
  /* recursion just comparing whether is smaller or bigger and pointing either
  to left or right */
  if (key < n->key) return findR(key, n->left);
  if (key > n->key) return findR(key, n->right);
  };

void deleteR(node * n){
  /* it the tree is empty, nothing to delete */
  if (!n) return;
  /* call recursively through the entire tree, first left and then right.
  For each recursion, the pointer is checked whether is null or not */
  deleteR(n->left);
  deleteR(n->right);
  delete n;
}

void printInOrder(node * n){
  if (!n) {
    cout << endl;
    return;
  }
  printInOrder(n->left);
  cout << n->key << "-->" << n->entry >> endl;
  printInOrder(n->right);
}

public:
  dict(){ root = 0; }                   // initialize pointer to root of the tree
  ~dict(){ deleteR(root); }              // delete all the entries

  /* define methods
  FOR BYNARY TREE CASE: implementation follows a recursive pattern, so that for
  each public function, we have a recursive private function that is called within */
  string find(string key) const {
    findR(key, root);
  }

  void insert(string key, string entry){
    root = insertRec(key, entry, root);
  };

};
/* end of the class declaration */


/* main example to check the created class */
int main(){
  /* define an empty dictionary - the constructor is called */
  dict dan2eng();
  dan2eng.insert("blaa", "blue", root);
  dan2eng.insert("roed", "blue", root);
  dan2eng.insert("roed", "red", root);

  // error handling using the try- catch structure
  try{
    cout << "sort ->" << dan2eng.find("sort") << endl;
  }
  catch(int e){
    cout << "not found!!" << endl;
  }

  cout << "roed ->" << dan2eng.find("roed") << endl;

  return 0;
  /* the destructor is called */
}
