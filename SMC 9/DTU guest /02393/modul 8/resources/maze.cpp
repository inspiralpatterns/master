#include <iostream>
using namespace std;
typedef enum {wood , stone} material;

class field{
protected:
  int x,y;
public:
  field(int x, int y){
    this->x=x;
    this->y=y;
  };
  virtual void display()=0;
  virtual bool isWall()=0;
  virtual void entering(){};
  virtual void exiting(){};
};

class wall : public field{
public:
  wall(int x, int y) : field(x,y) { };
  virtual bool isWall(){ return true; };
  virtual void display(){ cout << "*"; };
};

class floor : public field{
protected:
  bool isOn;
public:
  floor(int x, int y) : field(x,y) { };
  virtual bool isWall(){ return false; };
  virtual void display(){ if (isOn) cout << "O"; else cout << " "; };
  virtual void entering(){ isOn=true; };
  virtual void exiting(){ isOn=false; };
};

class exitfield : public floor{
public:
  exitfield(int x, int y) : floor(x,y) { };
  virtual void display(){ if (isOn) cout << "O"; else cout << "_"; };
};


#define n 16
#define m 12
field * playground[n][m];
int x=5;
int y=5;
// Alternatively: don't define as global variables and instead
// have function void display(field **playground, int x, int y);

void display(){
  for (int j=0; j<m; j++){
    for (int i=0; i<n; i++){
      playground[i][j]->display();
    }
    cout << endl;
  }
}

int main(){
  for (int i=0; i<n; i++){
    for (int j=0; j<m; j++){
      if (i==0||i==(n-1)||(j==0) ||j==(m-1) ){
	if (j==0 && i==3){
	  playground[i][j]=new exitfield(i,j);
	}
	else{
	  playground[i][j]=new wall(i,j);
	}
      }
      else{
	playground[i][j]=new floor(i,j);
      }

    }
  }

  playground[x][y]->entering();
  
  char c;
  display();
  cin >> c;
  while (c!='q'){
    int xnew=x;
    int ynew=y;
    if (c=='l') xnew=x-1;
    if (c=='r') xnew=x+1;
    if (c=='u') ynew=y-1;
    if (c=='d') ynew=y+1;
    if (!playground[xnew][ynew]->isWall()){
      playground[x][y]->exiting();
      x=xnew;
      y=ynew;
      playground[x][y]->entering();
    }
    display();
    cin >> c;
  }
}
    
    
  
