public class start_menu_room extends Room {
  PImage background;
PImage cloud1;
PImage cloud2;
PImage fyi;
PImage title;
int cloudx;
int cloudx2;

Button titleButton;
  Button playButton;

  public void setup() {
    
    playButton=new Button(450, 650, 650, 750, color(100, 0, 0), "Play");
    size (1200,800);
    background = loadImage ("backgroundintro.png");
    title = loadImage ("title.png");
    fyi = loadImage ("fyi.png");
    cloud1 = loadImage ("cloud1.png");
    cloud2 = loadImage ("cloud2.png");
    cloudx = -200;
    cloudx2 = 900;
  }

  public void draw() {
    background(0);
    
    image (background, 0, 0, 1200, 800);
    image (cloud1, cloudx,120, cloud1.width*1.5, cloud1.height*1.5); 
    image (cloud2, cloudx2,140, cloud2.width*.8, cloud2.height*.8);
    image (fyi, 200, 30, fyi.width/1.5, fyi.height/1.5);
    image (title, 240, 70, title.width*2, title.height*2);
    cloudx = cloudx + 5;
    cloudx2 = cloudx2 - 5;
    if (cloudx> 1200) {
    cloudx = -580;
    } if (cloudx2<-600) {
    cloudx2 = 1500;
    }
    
    playButton.draw();
  }

  public void mousePressed() {
    if (playButton.isClicked()) {
      goToRoom(intro_room);
    }
  }

  private class Button {
    int left;
    int top;
    int right;
    int bottom;
    int wide;
    int high;
    color colour;
    String string;
    public final int DEFAULT_TEXT_SIZE=32;
    public Button() {
    }

    public Button(int left, int top, int right, int bottom) {
      this.left=left;
      this.top=top;
      this.right=right;
      this.bottom=bottom;
      this.wide=right-left;
      this.high=bottom-top;
    }

    public Button(int left, int top, int right, int bottom, color colour, String string) {
      this(left, top, right, bottom);
      this.colour=colour;
      this.string=string;
    }

    public boolean isClicked() {
      return mouseX>=left&&mouseY>=top&&mouseX<=right&&mouseY<=bottom;
    }

    public void draw() {
      fill(colour);
      //stroke(255);
      textSize(DEFAULT_TEXT_SIZE);
      textAlign(CENTER, CENTER);
      rect(left, top, wide, high);
      fill(255);
      text(string, left+wide/2, top+high/2);
    }
  }
}