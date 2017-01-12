#ifndef __ex02_library__
#define __ex02_library__

#include <vector>
#include <string>

using namespace std;

/* function prototype for the library */
vector<string> match(vector<string> & u, vector<string> & v);
vector<string> read_until(string stop);
void display(vector<string> & u);


#endif

/* observation: the `match` function takes references to vectors of string as
input. This way, a fresh copy of both the vectors is avoided but, since there's
no const declaration, the function might affect and modify the original vectors
*/
