/* shapes.cpp
  implement a family of classes of two-dimensional shapes.
  IMPLEMENTATION STRATEGIES:
  - shape is the most base abstract class
  - a square is a rectangle with equal heigth and width
  - a circle doesn't have vertex, whilst rectangles and square do
  */

#include "shapes.h"
#include <iostream>
#include <cmath>

using namespace std;

/* methods implementation for the parent classes
  for the class Rectangle */

double Rectangle::area(){
  return m_dim * m_dim2;
};

double Rectangle::perimeter(){
  return m_dim*2 + m_dim2*2;
};

void Rectangle::rotate(){
  double tmp = 0;
  tmp = m_dim;
  m_dim = m_dim2;
  m_dim2 = tmp;
};

double Rectangle::height(){
  return m_dim;
};

double Rectangle::width(){
  return m_dim2;
};

/* for the class Circle */
double Circle::area(){
  return M_PI * m_dim * m_dim;
};

double Circle::perimeter(){
  return 2 * M_PI * m_dim;
};

void Circle::rotate(){

};

double Circle::height(){
  return 2*m_dim;
}

double Circle::width(){
  return 2*m_dim;
}

/* for the class Square */
double Square::area(){
  return m_dim * m_dim;
};

double Square::perimeter(){
  return 4*m_dim;
};
