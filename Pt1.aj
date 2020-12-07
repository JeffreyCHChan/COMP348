package assignment;

public privileged aspect Pt1 {

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
	
	
}
