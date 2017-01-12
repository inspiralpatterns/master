#include<vector>
#include<iostream>
using namespace std;

vector<int> merge(vector<int> v1, vector<int> v2){
  // assume v1 and v2 are sorted, return a sorted composition
  vector<int> result(v1.size()+v2.size());
  int i,j,k;
  i=j=k=0;
  while(i<v1.size() && j<v2.size() ){
    if (v1[i]<=v2[j]) result[k++]=v1[i++];
    else  result[k++]=v2[j++];
  }
  while(i<v1.size()){
    result[k++]=v1[i++];
  }
  while(j<v2.size() ){
    result[k++]=v2[j++];
  }
  return result;
}

vector<int> mergesort(vector<int> v){
  int size=v.size();
  if (size<2) return v; // already sorted
  int mid=size/2;
  vector<int> v1(mid);
  int i;
  for(i=0;i<mid; i++) v1[i]=v[i];
  vector<int> v2(size-mid);
  for(   ;i<size; i++) v2[i-mid]=v[i];
  v1=mergesort(v1);
  v2=mergesort(v2);
  return merge(v1,v2);
};

int main(){
  vector<int> v;
  v.push_back(17);
  v.push_back(-3);
  v.push_back(42);
  v.push_back(12);
  v.push_back(-3);

  v=mergesort(v);
  for(int i=0; i<v.size(); i++){
    cout << v[i] << " ";
  }
  cout << endl;
  return 0;
}
