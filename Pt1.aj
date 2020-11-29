package assignment;

public aspect Pt1 {

	declare parents: Circle implements Shape;
	declare parents: Rectangle implements Shape;
	
	public String Circle.getName(){
		return "Circle";
	}
	
	public String Rectangle.getName(){
		return "Rectangle";
	}
	
	
	
	
}
