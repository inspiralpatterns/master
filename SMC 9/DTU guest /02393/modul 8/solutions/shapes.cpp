#include <iostream>
#include <vector>
#include <cmath>
#include "shapes.h"
#define M_PI 3.141592

using namespace std;

Circle::Circle(double radius) {
    my_radius = radius;
}

Rectangle::Rectangle(double height, double width){
    my_height = height;
    my_width = width;
}

Square::Square(double side) : Rectangle(side,side) {
}

double Circle::area(void){
    return my_radius * my_radius * M_PI;
}

double Rectangle::area(void){
    return my_height * my_width;
}

double Circle::perimeter(void){
    return my_radius * 2 * M_PI;
}

double Rectangle::perimeter(void){
    return (2 * my_height) + (2 * my_width);
}

double Circle::height(void){
    return 2 * my_radius;
}

double Rectangle::height(void){
    return my_height;
}

double Circle::width(void){
    return 2 * my_radius;
}

double Rectangle::width(void){
    return my_width;
}

void Circle::rotate(void){
    return;
}

void Rectangle::rotate(void){
    double aux = my_height;
    my_height = my_width;
    my_width = aux;
}

void Square::rotate(void){
    return;
}
