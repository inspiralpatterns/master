#include<iostream>
using namespace std;

/* implementation: save the previous multiplication inside a static variable
and update it at each function call. Doing so, only a multiplication for each
loop iteration is performed.
*/
static double factorial;

double approx_e(int k){
  double euler = 0.0;
  for (int i = 0; i < k; i++) {
    /* update static variable */
    if (i == 0) factorial = 1;
    else factorial *= i;

    /* compute the sum */
    euler += 1.0 / factorial;
  }
  return euler;
}

int main(){
  int k;
  cin >> k;

  if (k <= 0) {
    cout << "positive integer needed!" << endl;
    exit(-1);
  }
  cout << approx_e(k) << endl;
  return 0;
}
