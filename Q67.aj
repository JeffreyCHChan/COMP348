import java.lang.Math;
public privileged aspect Q67 {
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

