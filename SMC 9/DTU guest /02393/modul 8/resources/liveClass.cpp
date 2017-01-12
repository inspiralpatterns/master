/* 02393 MODULE 8
CLASSES AND OBJECTS III */

/* redefining the maze code from week 3 */

#include <iostream>
using namespace std;

typedef enum {wood, stone} material;

/* the parent class */
class field {
/* look for difference between private and protected */
protected:
  int x, y;
public:
  field(int x, int y){
    this->x = x;
    this->y = y;
  };

  void display(){cout << "?"; };
  bool isWall(){return false;};
  void entering(){};
  void exiting(){};
};

/* creating children classes that inheritance from the parent */
class wall : public field{
  wall(int x, int y) : field(x,y) { };
  bool isWall(){return false;};
  void display(){cout << "*"};
};

class floor : public field{
protected:
  bool isOn;
  floor(int x, int y) : field(x, y) { };
  bool isWall(){return false;};
  void display(){if (isOn) cout << "0"; else cout << " ";};
  void entering(){isOn = true;};
  void exiting(){isOn = false;};
};

class exitfield : public field{
protected:
public:
  exitfield(int x, int y) : floor(x, y){ };
  void display(){if (isOn) cout << "0"; else cout << "_";};
};

/* look at the use of the world virtual in runtime compiling
look up what overloading is in an object oriented programming*/
