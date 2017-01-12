/* shapes.h
  header file for shapes implementation. it contains the specification for
  all the classes that participate of the family `shapes`
  */

/* include guard */
#ifndef shapes_h
#define shapes_h

/* BASE MOST CLASS
  - it is an abstract class, so it won't be instantiated;
  - pure virtual functions will be overridden by derived classes
  */
class Shape{
protected:
  double m_dim;
public:
  /* function prototypes for allocation/deallocation */
  Shape(double dim) : m_dim(dim){};
  virtual ~Shape(){};
  /* function propotypes for common methods */
  virtual double area() = 0;
  virtual double perimeter() = 0;
  /* obs: use of word `virtual` because they will be overwritten */
  virtual double height() = 0;
  virtual double width() = 0;
  virtual void rotate() = 0;
};

/* children classes inheriting from parents */
class Rectangle : public Shape{
private:
  double m_dim2;
public:
  Rectangle(double dim, double dim2) : Shape(dim), m_dim2(dim2){};
  ~Rectangle(){};
  virtual double area();
  virtual double perimeter();
  virtual double height();
  virtual double width();
  virtual void rotate();
};

class Square : public Rectangle{
public:
  Square(double dim) : Rectangle(dim, dim){};
  ~Square(){};
  virtual double area();
  virtual double perimeter();
};

class Circle : public Shape{
public:
  Circle(double dim) : Shape(dim){};
  ~Circle(){};
  virtual double area();
  virtual double perimeter();
  virtual double height();
  virtual double width();
  virtual void rotate();
};


#endif
/* EOF */
