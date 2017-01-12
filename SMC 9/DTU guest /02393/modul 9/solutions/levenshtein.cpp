#include <iostream>

using namespace std;

// Simple version, straightforward implementation

int d(string u, string v){
    
    if (u.size()==0) return v.size();
    if (v.size()==0) return u.size();
    
    string u1 = u.substr(1,u.size()-1);
    string v1 = v.substr(1,v.size()-1);
    
    return min(min(d(u1,v)+1,
                   d(u,v1)+1),
                   d(u1,v1)+((u[0]==v[0])?0:1));
    
}


int main(void){
    string u,v;
    cin >> u;
    cin >> v;
    cout << d(u,v) << endl;
    return 0;
}