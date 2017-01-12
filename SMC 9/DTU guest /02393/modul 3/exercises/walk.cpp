/* random walk
allows for the player to move inside a field, each of its movement depending
from an input character corresponding to the movement direction */

#include <iostream>
#include <string.h>
using namespace std;

#define n 12
#define m 16

typedef enum {wood, stone} material;

typedef struct{
  int x,y;
  bool isWall;
  material type;
} field;

field playground[n][m];

int display(int x, int y) {
  /* it uses global variables representing the position of a player in the background
  and display on the standard output both the field and the player position */
  for (int i = 0; i < n; i++){
    for (int j = 0; j < m; j++){
      playground[i][j].x = i;
      playground[i][j].y = j;
      playground[i][j].isWall = (i==0||i==(n-1)||(i==0&&j!=3)||(j==0)||j==(m-1));
      if (playground[i][j].isWall && !(j==3 && i==0)){
        playground [i][j].type = stone;
        // cout `*` when wall
        cout << "*";
      }
      else if (!(i==x && j==y)){
        playground [i][j].type = wood;
        // cout a blank space when not wall and the player current position
        cout << " ";
      }
      if (playground[i][j].x == x && playground[i][j].y == y)
      // cout a sign when global variables match the player position
        cout << "O";
    }
    cout << endl;
  }

  return 0;
}

int main(){
  // define player initial state
  int x = 5;
  int y = 5;
  int oldx = 0;
  int oldy = 0;

  // define a variable where to store player instruction into
  string instructions;
  getline(cin, instructions);
  char key = 'q';
  int i = 0;

  // let the player move around until `q` is got as char
  do {
    char state = instructions[i];

    // display the playground
    display(x, y);

    // create a backup for the previous position
    oldx = x;
    oldy = y;

    switch (state) {
      // refresh the variables following the player instructions
      case 'u':
        x -= 1;
        break;
      case 'd':
        x += 1;
        break;
      case 'l':
        y -= 1;
        break;
      case 'r':
        y += 1;
        break;
    }

    // check if next state is not a wall and, if so, display the old one
    // obs: we have stones in each boundary
    if ((x < 1 || x > n-2 || y < 1 || y > m-2) && !(y == 3)) {
      x = oldx;
      y = oldy;
    }

    // update the counter
    i++;
  } while (instructions[i-1] != key);
  return 0;
}
