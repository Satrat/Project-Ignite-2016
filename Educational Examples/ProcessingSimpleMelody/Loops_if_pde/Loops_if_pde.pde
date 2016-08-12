int start = 0; //starting height
int green = 0;
int blue = 255;
int shapeWidth = 40;
int shapeHeight = 40;

//this function runs once per run
void setup() {
  size(600, 600); //set size of canvas
  background(0); //set background color(black)
  stroke(255); //set shape online color(white)
  fill(0, green, blue); //set fill color, RGB format
  frameRate(10); //the draw function will be called 10 times per second
}

//this function is called once per frame
void draw() {
  fill(0, green, blue); //update color
  for(int i = 0; i < width; i += 50) //increment x position by 50
  { 
    if(i % 100 == 0) //draw rectangle every other column
    {
      //x, y(top left), width, height
      rect(i, start, shapeWidth, shapeHeight);
    }
    
    else
    {
      //x, y(center), width, height
      ellipse(i + (shapeWidth/2), start + (shapeHeight/2), shapeWidth, shapeHeight);
    }
  }
  
  start += 50; //increment y position
  blue -= 30; //less blue
  green += 30; //more green
}