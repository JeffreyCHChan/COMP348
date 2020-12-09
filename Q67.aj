import java.lang.Math;
public privileged aspect Q67 {
	declare parents: Circle implements Shape;
declare parents: Rectangle implements Shape;

public String Circle.getName(){
	return "Circle";
}

public String Rectangle.getName(){
	return "Rectangle";
}

pointcut stringCircle (Circle c): call(* java.io.PrintStream.println(Circle)) && this(c);
pointcut stringCircle2 (Circle c): execution(* Circle.toString()) && this(c);

before(Circle c): stringCircle(c){
	System.out.println(c.getName()+"("+c.radius+")");
}

//I added a toString to the classes, I don't know what to call a sysout(circle) for the execution
String around(Circle c): stringCircle2(c){
	return (c.getName()+"("+c.radius+")");
}

pointcut stringRectangle (Rectangle r): call(* java.io.PrintStream.println(Rectangle)) && this(r);
pointcut stringRectangle2 (Rectangle r): execution(* Rectangle.toString()) && this(r);

before(Rectangle r): stringRectangle(r){
	System.out.println((r.getName()+"("+r.width+","+r.height+")"));
}

//I added a toString to the classes, I don't know what to call a sysout(rectangle) for the execution
String around(Rectangle r): stringRectangle2(r){
	return (r.getName()+"("+r.width+","+r.height+")");
}


pointcut area (Circle c): execution(* Circle.getArea())&&this(c);

double around(Circle c): area(c){
	double area = 0;
	if(c.radius>0){
		double rad = c.radius;
		area = rad*rad*Math.PI; 
	}
	else {
		area = 0;
	}
	return area;
}
pointcut perimeter (Circle c): execution(* Circle.getPerimeter())&&this(c);

double around(Circle c): perimeter(c){
	double perimeter = 0;
	if(c.radius>0){
		double rad = c.radius;
		perimeter = 2 * Math.PI * rad; 
	}
	else {
		perimeter = 0;
	}
	return perimeter;
}


pointcut rArea (Rectangle r): execution(* Rectangle.getArea())&&this(r);

double around(Rectangle r): rArea(r){
	double area = 0;
	if(r.width>0 && r.height >0){
		area = r.width*r.height; 
	}
	else {
		area = 0;
	}
	return area;
}
pointcut rPerimeter (Rectangle r): execution(* Rectangle.getPerimeter())&&this(r);

double around(Rectangle r): rPerimeter(r){
	double perimeter = 0;
	if(r.width>0 && r.height >0){
		perimeter = 2 * (r.width + r.height);
	}
	else {
		perimeter = 0;
	}
	return perimeter;
}
}

