/* histogram
compute the histogram of a data set of size n using a speficic number of
intervals, all of those values prompted by the user

concept: when data has been sorted, starting from the smallest, values could be
compared to the upper limit of the first interval. Until values are smaller, the
counter for that interval is increased, otherwise its value is printed and the
successive interval is considered. When all data has been used, the `break` ends
the loop. */

#include <iostream>
#include <cmath>
#include <algorithm>
using namespace std;

int main(void) {
  int l; // number of intervals
  int n;  // size of data set
  cin >> l;
  cin >> n;
  /* obs: once a value has been read from the command line, cin automatically
  reads the successive one */

  int* data = new int[n];
  int i = 0;
  do {
    // take every value prompted on the line
    cin >> data[i];
    ++i;
  } while(i < n);

  // sort the array in ascending order (void type)
  sort(data, data+n);

  // set the size of intervals
  // 1. get the maximum value (max_element returns an address)
  int m = *max_element(data, data+n);
  // quick way, since the array is sorted: cout << data[n-1] << endl;
  // obs: data casting required for ceil to work properly
  int k = ceil((float) m/l);

  // store all the numbers of elements per interval
  // 1. create an array of length no, intervals
  int* counters = new int[l];

  int j = 0;
  int q = 0;

  // 2. check which interval data values belong to
  do {
    // initialize each elements
    counters[j] = 0;
    while(data[q] < (j+1)*k) {
      ++counters[j];
      ++q;
      // check when all data has been processed
      if (q == n) break;
    }
    cout << j*k << ": " << counters[j] << endl;
    ++j;
  } while (j < l);

  // deallocate arrays
  delete [] counters;
  delete [] data;
return 0;
}
