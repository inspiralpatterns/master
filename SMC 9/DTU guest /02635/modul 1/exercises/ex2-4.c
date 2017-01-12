#include <stdio.h>
#include <math.h>

int main(){

  float salary;
  float hours;
  float avgPay;
  double dollars;
  double cents;

  /*prompt the user for weekly pay and hours worked*/
  printf("Insert your weekly pay (in $): ");
  scanf("%f", &salary);
  printf("Insert the no of hours you've worked: ");
  scanf("%f", &hours);

  /*calculate the average pay per hour and separate dollars from cents*/
  avgPay = salary / hours;
  dollars = floorf(avgPay);
  cents = modf(avgPay, &dollars); // modf gives only the decimal part!

  /*output the result*/
  printf("%f\n\n", cents);
  printf("Your average hourly pay is %.0f $ and %.0f c.\n", dollars, cents*100);
  return 0;
}
