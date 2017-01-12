#ifndef __ex03_library__
#define __ex03_library__

#include <map>
#include <set>
#include <vector>
#include <string>

using namespace std;

class Dictionary {
public:
  /* public function prototypes */
  Dictionary(void);
  void insert_words(string u, string v);
  string get_word(int lang, string u);
  void insert_synonym(int lang, string u, string v);
  set<string> get_synonyms(int lang, string u);
  set<string> translate(int lang, string u);

private:
  /* create a vector of map, where the map is made of string key values and
  string mapped values (unique association) */
  vector<map<string,string> > words;
  /* create a vector of synonims where the map is made of string key values and
  sets of string mapped value (unique association between word and synonims) */
  vector<map<string,set<string> > > synonyms;
  /* obs: the > can be separated not to be operators */
};

#endif

/* observations
  - in the definition of map, key values and mapped values can take different
  types. They could be grouped together in member value_type, which combine both,
  or be defined separately where the former type refers to the key;
  - the key values are used to sort and uniquely identify the elements, while
  the mapped values store the content associated to each key;
*/
