import java.lang.Math;
public aspect getArea {
	private double radius;
	private Circle circ = new Circle(radius);
	private double rad = ((Circle) circ).getPerimeter();
	before(): execution (* Circle.getArea()){
		System.out.println("Area: "+ (rad*rad*Math.PI));
	}
}

