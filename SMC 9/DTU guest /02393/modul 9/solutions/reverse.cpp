#include <iostream>
#include <vector>

using namespace std;

void display(vector<int> v){
    for(unsigned long i=0; i<v.size(); i++){
        cout << v[i] << " ";
    }
    cout << endl;
    return;
}

// This version of reverse creates a new vector
// and follows this idea
// reverse(emtpy)       = empty
// reverse(v1)          = v1
// reverse(v1,v2,..,vn) = reverse(v2,..,vn),v1

vector<int> reverse(vector<int> v){
    
    // base case reverse(empty)
    if(v.size()==0) return v;
    
    // base case reverse(v1)
    if(v.size()==1) return v;

    // recursive case reverse(v1,v2,..,vn) = reverse(v2,..,vn),v1
    vector<int> L(v.begin()+1,v.end()); // building L = v2,..,vn
    L = reverse(L); // computing reverse(L)
    L.push_back(v[0]); // building reverse(L),n
 
    return L;
}

// This version of reverse modifies the vector
// and follows this idea
// reverse(empty)       = empty
// reverse(v1)          = v1
// reverse(v1,v2,..,vn-1,vn) = vn,reverse(v2,..,vn-1),vn1

void reverse2_rec(vector<int> & v, int first, int last);

void reverse2(vector<int> & v){
    reverse2_rec(v,0,v.size()-1);
}
    
void reverse2_rec(vector<int> & v, int first, int last){
    
    // base case reverse(empty)
    if(first > last) return;
    
    // base case reverse(v1)
    if(first == last) return;
    
    // recursive case reverse(v1,v2,..,vn-1,vn) = vn,reverse(v2,..,vn-1),vn1
    int aux;
    aux = v[first];
    v[first] = v[last];
    v[last] = aux;
    reverse2_rec(v,first+1,last-1);
    
    return ;
}


int main (void){
    
    vector<int> v;
    int n;
    
    while (cin >> n)
    {
        v.push_back(n);
    }
    
    display(reverse(v));
    
}

