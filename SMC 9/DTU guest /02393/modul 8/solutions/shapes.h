#ifndef __shapes__
#define __shapes__
#define M_PI 3.141592


using namespace std;

// Abstract class of shapes
class Shape {
public:
    virtual double area(void) = 0;
    virtual double perimeter(void) = 0;
    virtual double height(void) = 0;
    virtual double width(void) = 0;
    virtual void rotate(void) = 0;
};

class Circle : public Shape {
public:
    Circle(double radius);
    double area(void);
    double perimeter(void);
    double height(void);
    double width(void);
    void rotate(void);
private:
    double my_radius;
};

class Rectangle : public Shape {
public:
    Rectangle(double height, double width);
    virtual double area(void);
    virtual double perimeter(void);
    virtual double height(void);
    virtual double width(void);
    virtual void rotate(void);
protected:
    double my_height;
    double my_width;
};


class Square : public Rectangle {
public:
    Square(double side);
    void rotate(void);
};

#endif
