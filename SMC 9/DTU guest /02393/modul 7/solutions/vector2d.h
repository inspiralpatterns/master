#ifndef __v2d__
#define __v2d__

class v2d{

public:
    // standard constructor
    // builds a vector (a,b)
    v2d(double a, double b);
    
    // copy constructor
    // builds a vector that is exactly as v
    v2d(const v2d & v);
    
    // destructor
    ~v2d(void);
    
    // assignment
    // updates the vector to make it as v
    v2d & operator=(const v2d &v);
    
    // vector addition
    // updates the vector by adding v
    v2d & operator+(const v2d &v);
    
    // scalar multiplication
    // updates the vector by scaling by k
    v2d & operator*(double k);
    
    // scalar product of the current vector
    // by another vector v 
    double operator*(const v2d &v);    
    
    // computes the length of a vector
    double length(void);

private:
    // internal representation of a vector
    // with just two doubles x and y
    double x;
    double y;
    
};

#endif
