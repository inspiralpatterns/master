#include <iostream>
#include <vector>

using namespace std;

// variant with dynamic programming, storing all computed results in the table "dc" ("d-cache");

int d(vector<vector<int> > & dc, string u, string v, int i, int j){
    
  if (i==u.size()) return v.size()-j;
  if (j==v.size()) return u.size()-i;

  if (dc[i][j]!=-1) return dc[i][j];

  dc[i][j]=min(min(d(dc, u,v,i+1,j)+1,
                   d(dc, u,v,i,j+1)+1),
	       d(dc, u,v,i+1,j+1)+((u[i]==v[j])?0:1));
  return dc[i][j];     
}


int main(void){
    string u,v;
    cin >> u;
    cin >> v;

    // two-dimensional vector of ints, of dimension u.size * v.size, all initialized to -1.
    vector< vector<int> > dc(u.size(), vector<int>(v.size(),-1));
   
    cout << d(dc,u,v,0,0) << endl;
    return 0;
}
