#include <iostream>
using namespace std;

class fraction {
private:
    // Internal representation of a fraction as two integers
    int numerator;
    int denominator;
public:
    // Class constructor
  fraction(int n, int d){
    numerator=n;
    denominator=d;
    shorten(); // private function for shortening the fraction, e.g. 2 / 4 becomes 1 / 2
  };

  // Methods to update the fraction
  void add(fraction f){
    // a/b + c/d = (a*d + c*b) / (b*d)
    numerator= numerator*f.denominator + f.numerator*denominator;
    denominator *= f.denominator;
    shorten();
  };
  void mult(fraction f){
    // a/b * c/d = (a*c / b*d)
    numerator *= f.numerator;
    denominator *= f.denominator;
    shorten();
  };
  void div(fraction f){
    // a/b div c/d = (a*d / b*c)
    numerator *= f.denominator;
    denominator *= f.numerator;
    shorten();
  };
  // Display method
  void display(void) const{
    cout << numerator << " / " << denominator << endl;
  };

private:
  // As can be seen above, we shorten after every operation. We may do
  // not do that and instead only shorten when "display()" is called,
  // instead. (Advantage of shorting all the time: keeps the numbers
  // small, thus won't overflow in a sequence of operations where all
  // intermediate results are still representable integers.)  By
  // making "shorten" a private function, it remains entirely under
  // control of this class when shortening happens.
  void shorten(){
    int l=gcd(numerator,denominator);
    if (l==0) return;
    numerator/=l;
    denominator/=l;
  }

  // Greatest common divisor. 
  int gcd(int x, int y){
    if (y==0) return x;
    return gcd(y,x%y);
  }
};

int main(){
  while(true){
    int n1,d1, n2,d2;
    string s,op;
    // s should be the " / " sign -- but this program actually does not check it is.
    cin >> n1 >> s >> d1 >> op >> n2 >> s >> d2;
    if(cin.fail()) break; // if any of the previous cin failed, we
			  // have reached the end of the input and
			  // simply quit.
    fraction f1(n1,d1);
    fraction f2(n2,d2);
    if (op=="+") f1.add(f2);
    if (op=="*") f1.mult(f2);
    if (op=="div") f1.div(f2);
    f1.display();
  }
  return 0;
}		  
    
    
