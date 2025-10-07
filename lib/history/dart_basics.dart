import 'dart:io';
import 'dart:math';

abstract class Shape {
  String figType();
  double getArea();
}

class Circle implements Shape {
  double radius;

  Circle(this.radius);

  @override
  String figType() {
    return "Circle";
  }

  @override
  double getArea() {
    return pi * radius * radius;
  }
}

class Rectangle implements Shape {
  double length, breadth;

  Rectangle(this.length, this.breadth);

  @override
  String figType() => 'Rectangle';

  @override
  double getArea() => length * breadth;
}

class Square implements Shape {
  double side;

  Square(this.side);

  @override
  String figType() => 'Square';

  @override
  double getArea() => side * side;
}

class Triangle implements Shape {
  double base, height;

  Triangle(this.base, this.height);

  @override
  String figType() => 'Triangle';

  @override
  double getArea() => 0.5 * base * height;
}

class Parallelogram implements Shape {
  double base, height;

  Parallelogram(this.base, this.height);

  @override
  String figType() => 'Parallelogram';

  @override
  double getArea() => base * height;
}

class Trapezium implements Shape {
  double a, b, height;

  Trapezium(this.a, this.b, this.height);

  @override
  String figType() => "Trapezium";

  @override
  double getArea() => 0.5 * (a + b) * height;
}

void main() {
  while (true) {
    print('\n AREA CALCULATOR');
    print('1. Circle');
    print('2. Rectangle');
    print('3. Square');
    print('4. Triangle');
    print('5. Parallelogram');
    print('6. Trapezium');
    print('7. Exit');

    Shape shape;

    stdout.write('Enter your choice: ');
    int choice = int.parse(stdin.readLineSync()!);
    switch (choice) {
      case 1:
        stdout.write('Enter the radius: ');
        double r = double.parse(stdin.readLineSync()!);
        shape = Circle(r);
        break;
      case 2:
        stdout.write('Enter Length: ');
        double l = double.parse(stdin.readLineSync()!);
        stdout.write('Enter Breadth: ');
        double b = double.parse(stdin.readLineSync()!);
        shape = Rectangle(l, b);
        break;
      case 3:
        stdout.write("Enter Side: ");
        double s = double.parse(stdin.readLineSync()!);
        shape = Square(s);
        break;
      case 4:
        stdout.write("Enter Base: ");
        double base = double.parse(stdin.readLineSync()!);
        stdout.write("Enter Height: ");
        double height = double.parse(stdin.readLineSync()!);
        shape = Triangle(base, height);
        break;
      case 5:
        stdout.write("Enter Base: ");
        double base = double.parse(stdin.readLineSync()!);
        stdout.write("Enter Height: ");
        double height = double.parse(stdin.readLineSync()!);
        shape = Parallelogram(base, height);
        break;
      case 6:
        stdout.write("Enter Side a: ");
        double a = double.parse(stdin.readLineSync()!);
        stdout.write("Enter Side b: ");
        double b = double.parse(stdin.readLineSync()!);
        stdout.write("Enter Height: ");
        double h = double.parse(stdin.readLineSync()!);
        shape = Trapezium(a, b, h);
        break;
      case 7:
        print("Exiting.....!");
        exit(0);
      default:
        print('Invalid Choice, Try Again!');
        continue;
    }
    print('Figure Type: ${shape.figType()}');
    print('Calculated Area: ${shape.getArea()}');
  }
}
