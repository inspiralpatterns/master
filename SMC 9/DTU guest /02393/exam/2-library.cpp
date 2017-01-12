#include<iostream>
#include <list>
#include <vector>
using namespace std;


int main(){
  // Todo: Declare datastructure to hold the elements
  /* using list to store temporarily the elements */
  list<int> List;

  int i;
  while(true){
    cin >> i;
    if(cin.fail()){
      break;
    }

    /* insert i inside the vector */
    List.push_back(i);
  }

  /* sort the list and find min and max */
  List.sort();
  int min, max;

  min = *List.begin();
  max = *List.end();


  /* strategy: find the percentages that correspond to the overall distribution
  and classify all the result in the list whether they are in between bottom
  and excellent threshold */

  int good_min, excellent_min;
  int bot, exc;
  bot = (max-min) * 0.25;
  exc = (max - min) * 0.75;

  list<int> bottom;
  list<int> good;
  list<int> excellent;

  for (auto e : List) {
    if (e > bot && e < exc) good.push_back(e);
    else if (e > exc) excellent.push_back(e);
  }

  /* sort lists and assign the first element */
  good.sort();
  excellent.sort();

  /* to do: check for size of lists, move and pop front */


  good_min = *(good.begin());
  excellent_min = *(excellent.begin());

  cout << "good>=" << good_min << " excellent>=" << excellent_min << endl;

  return 0;
}
