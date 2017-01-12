#include <iostream>
#include <vector>

using namespace std;

// This version creates new vectors
// and is based on this idea
// palindrome(empty) = true
// palindrome(v1)    = true
// palindrome(v1,v2..vn-1,vn) = false if not v1 == vn
// palindrome(v1,v2..vn-1,vn) = palindrome(v2..vn-1) if v1 == vn


bool palindrome(vector<int> v){

    // base case: p(empty) = true
    if(v.size()==0) return true;
    
    // base case: p(v1) = true
    if(v.size()==1) return true;
    
    // base case: palindrome(v1,v2..vn-1,vn) = false if not v1 == vn
    if(*v.begin() != *(v.end()-1)){
        return false;
    }
    
    // palindrome(v1,v2..vn-1,vn) = palindrome(v2..vn-1) if v1 == vn
    vector<int> w(v.begin()+1,v.end()-1);
    return palindrome(w);

}

// Can you devise a version that does not need to create new vectors?


int main (void){
    
    int n;
    vector<int> v;
    
    while (cin >> n)
    {
        v.push_back(n);
    }
        
    if (palindrome(v)){
        cout << "yes" << endl;
    } else {
        cout << "no" << endl;
    }
    
    return 0;
}
