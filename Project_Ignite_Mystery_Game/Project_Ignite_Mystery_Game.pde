//this amazing meta-room programmed by James

/*
 * Project Ignite Mystery Game.
 *
 * Programmed by, _____, ________, ________, _______, _________, and ______
 * 
 */

//still need:diningroom, 
//content rooms
Room entrance_room, living_room, kitchen_room, dining_room, study_room, shed_room, bed_room;

//cutscene rooms
Room intro_room, outro_room, start_menu_room, instruction_room;

Player player;
Room current_room;

GUI_Dialogue_Box win;
int[] winBoundingBox;

void setup() {

  size(1200, 800, P2D);

  start_menu_room=new start_menu_room();
  start_menu_room.setup();
  entrance_room = new entrance_room();
  entrance_room.setup();
  living_room = new living_room();
  living_room.setup();
  kitchen_room = new kitchen_room();
  kitchen_room.setup();
  dining_room = new dining_room();
  dining_room.setup();
  study_room = new study_room();
  study_room.setup();
  shed_room = new shed_room();
  shed_room.setup();
  bed_room = new bed_room();
  bed_room.setup();

  intro_room=new intro_room();
  intro_room.setup();
  outro_room=new outro_room();
  outro_room.setup();
  instruction_room=new instruction_room();
  instruction_room.setup();

  //current_room=intro_room;
  current_room=start_menu_room;

  player = new Player();

  win=new GUI_Dialogue_Box(1050, 0, 150, 100);
  win.setText("J'accuse!");
  winBoundingBox=new int[]{1050, 0, 1200, 100};
}

void draw() {
  current_room.draw();
  //println(current_room.getClass());
  if (!(current_room.getClass().equals(start_menu_room.getClass())
    ||current_room.getClass().equals(intro_room.getClass())
    ||current_room.getClass().equals(instruction_room.getClass())
    ||current_room.getClass().equals(outro_room.getClass()))) {
    win.draw();
  }
  //shed_room.draw();
}

void mousePressed() {
  current_room.mousePressed();
  if (!(current_room.getClass().equals(start_menu_room.getClass())
    ||current_room.getClass().equals(intro_room.getClass())
    ||current_room.getClass().equals(instruction_room.getClass())
    ||current_room.getClass().equals(outro_room.getClass()))) {

    if (checkObjectClicked(winBoundingBox)) {
      current_room.goToRoom(outro_room);
    }
  }
}
/*murder weapon - knife - creepo
 advisor dialogue - “will” - advisor
 shirt - blood on it
 handprint - bloody
 letter - shows person murdered cheated - sig other
 bloody apron - chef was wearing to kill animal
 maid dialogue - heard person murdered arguing (heard in ____ room)
 secret passage - (way to get around), connects murder to bedroom - sig other
 computer - files, undeleted internet history - advisor
 creepo dialogue - “this knife looked pretty swag” - eliminate creepo
 vegi sack - looks like body - nothing
 butler dialogue - “I’ve never seen the sig other cry before” - sig other 
 chef dialogue - “I’m always underpaid”
 sig other - “i’m sad” like #waytoosad - themself*/

//data structure for holding clues
class Player {
  private boolean advisor;
  private boolean shirt;
  private boolean handprint;
  private boolean letter;
  private boolean apron;
  private boolean maid;
  private boolean passage;
  private boolean computer;
  private boolean creepo;
  private boolean vegiSack;
  private boolean butler;
  private boolean chef;
  private boolean sigOther;

  Player() {
    advisor=false;
    shirt=false;
    handprint=false;
    letter=false;
    apron=false;
    maid=false;
    passage=false;
    computer=false;
    creepo=false;
    vegiSack=false;
    butler=false;
    chef=false;
    sigOther=false;
  }

  void setAdvisor(boolean b) {
    this.advisor=b;
  }

  boolean getAdvisor() {
    return this.advisor;
  }

  void setShirt(boolean b) {
    this.shirt=b;
  }

  boolean getShirt() {
    return this.shirt;
  }

  void setHandprint(boolean b) {
    this.handprint=b;
  }

  boolean getHandprint() {
    return this.handprint;
  }

  void setLetter(boolean b) {
    this.letter=b;
  }

  boolean getLetter() {
    return this.letter;
  }

  void setApron(boolean b) {
    this.apron=b;
  }

  boolean getApron() {
    return this.apron;
  }

  void setMaid(boolean b) {    
    this.maid=b;
  }

  boolean getMaid() {
    return this.maid;
  }

  void setPassage(boolean b) {
    this.passage=b;
  }

  boolean getPassage() {
    return this.passage;
  }

  void setComputer(boolean b) {
    this.computer=b;
  }

  boolean getComputer() {
    return this.computer;
  }

  void setCreepo(boolean b) {
    this.creepo=b;
  }

  boolean getCreepo() {
    return this.creepo;
  }

  void setVegiSack(boolean b) {
    this.vegiSack=b;
  }

  boolean getVegiSack() {
    return this.vegiSack;
  }

  void setButler(boolean b) {
    this.chef=b;
  }

  boolean getButler() {
    return this.butler;
  }

  void setChef(boolean b) {
    this.chef=b;
  }

  boolean getChef() {
    return this.chef;
  }

  void setSigOther(boolean b) {
    this.sigOther=b;
  }

  boolean getSigOther() {
    return this.sigOther;
  }
}

abstract class Room {
  abstract void setup();
  abstract void draw();
  void mousePressed() {
  }

  void goToRoom(Room room) {
    strokeWeight(1);
    current_room=room;
  }
}

void reset() {
  ((shed_room)shed_room).stopMusic();
  setup();
}

//Not implemented yet. Maybe later.
void saveGame() {
}

void loadGame() {
}