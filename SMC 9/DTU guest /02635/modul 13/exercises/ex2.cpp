/* use a vector object to read and store a series of floating point numbers
  from a text file. After reading, the program also calculates and output
  both the sum and the mean of the numbers

  purpose:
    implementation and use of vector container class
    use of ifstream namespace
*/

#include <iostream>     /* std:_cout */
#include <fstream>      /* std:ifstream */
#include <vector>

using namespace std;

int main(int argc, char const *argv[]) {
  /* USING IFSTREAM I/O LIBRARY:
  an object of type ifstream is created and then its class method are accessed */

  /* part A. reading the input file and store value inside a vector */
  ifstream file_to_read;
  file_to_read.open("float.txt", ifstream::in);

  /* check for any file failure when opening */
  if (file_to_read.fail()) {
    std::cerr << "Error " << strerror(errno) << '\n';
    exit(-1);
  }

  /* allocate a vector of double */
  std::vector<double> v;
  double val;

  while (file_to_read >> val) {
    /* store values inside the vector using push_back
    obs: constant time complexity */
    v.push_back(val);

    /* fetch information about the vector */
    std::cout << "vector is of size " << v.size() << '\n';
    std::cout << "vector can contain up to " << v.capacity() << '\n';

    /* also print numbers */
    cout << val << '\n';
  }

  /* close the file */
  file_to_read.close();
  cout << "\n";


  /* part B. calculating sum and sample mean */
  double sum = 0;
  double mean;
  /* random access using iterator member variable */
  for (auto it = v.begin(); it != v.end(); it++) {
    sum += *it;
    // cout << *it << " ";
  }

  mean = sum / v.size();
  std::cout << "The sum for all values stored in vector is " << sum << '\n';
  std::cout << "The mean for all values stored in vector is " << mean << '\n';


  return 0;
}
