//NOTE: install sound library before import
import processing.sound.*;
SoundFile clicksound;
SoundFile bgm;
SoundFile jumpsound;

//PrintWriter scorefile;
//String name = "";

PFont arial;
String message1;
String message2;
String message3;
String message4;
float score;
PImage bg;
PImage enemy;
PImage weapon;
PImage[] images;
int imageCount;
int frame;
int bgx,bgy;
int gameScreen = 0;
int diff_level = 1;
Person p;
Person p2;
Person selected;
enemy e1;
enemy e2;
enemy e3;
enemy e4;
sword s1;
sword s2;
weapon w1;

//buttons
PImage playbutton;
PImage pause;
PImage reset;
PImage cont;
PImage menu;
PImage mute;
PImage save;
PImage highscoreimage;
PImage scoreimage;

PImage one;
PImage two;
PImage three;

PImage personimage, person2image;

boolean up;
boolean down;
boolean left;
boolean right;

void collision_enemy(enemy e, Person p){
   if (dist(e.p.x, e.p.y, p.p.x, p.p.y) < 20){
     score -=0.1;
     if (score < 1){
      gameScreen = 2;
      }
  }
   else if(score >0 && p.p.x > 500){
       gameScreen = 2;
     }
}

void collision_sword(sword s, Person p){
   if (dist(s.p.x, s.p.y, p.p.x, p.p.y) < 20){
     score -=0.1;
     if(score < 1 ){
        gameScreen = 2;
     }
  }
  else if(score >0 && p.p.x > 500){
       gameScreen = 2;
     }
}



buttonRect br;

ArrayList<gold_coin> coins = new ArrayList<gold_coin>(5);
  
  
void setup(){
  size(1000,700);
  
  //scorefile = createWriter("scorefile.txt");
  
  //if (gameScreen == 6) {
  //  highscore();
  //}
  
  //for (int i = 0; i <= scorerank.length; i ++) {
  //  println(scorerank[i]);
  //}
  //saveStrings("sortedscore.txt", scorerank);
  //String[] scoresorted = loadStrings("scorerank.txt");
  //if (gameScreen == 6) {
  //  PFont ranktext = createFont("Rockwell-Bold", 50);
  //  textFont(ranktext);
  //  fill(9, 116, 72);
  //  textMode(CENTER);
    
  //  for (int i = 0; i <= 5; i ++) {
  //    text(i+1, scorewidth, scoreheight);
  //    text(scorerank[i], scorewidth, scoreheight);
  //  }
  //}
  
  clicksound = new SoundFile(this, "click.wav");
  bgm = new SoundFile(this, "bgm.mp3");
  jumpsound = new SoundFile(this, "jump.wav");
  
  bgm.loop();
  
  bg = loadImage("bg.png");
  bg.resize(1000,700);
  
  arial = createFont("Arial", 32);
  textFont(arial);
  message1 = "Difficulty level: 1";
  message2 = "Difficulty level: 2";
  message3 = "Difficulty level: 3";
  

  left = false;
  right = false;
  up = false;
  down = false;
 
  PImage gold_coin = loadImage("gold_coin.png");
  PImage person = loadImage("person.png");
  PImage personL = loadImage("personL.png");
  PImage person2 = loadImage("person2.png");
  PImage person2L = loadImage("person2L.png");
  PImage enemy = loadImage("enemy.png");
  PImage sword = loadImage("sword.png");
  PImage spikes = loadImage("spikes.png");
  PImage weapon = loadImage("weapon.png");
  gold_coin.resize(0, 35);
  spikes.resize(50,50);
  person.resize(50,50);
  personL.resize(50,50);
  enemy.resize(70,70);
  sword.resize(50,50);
  person2.resize(50,50);
  person2L.resize(50,50);
  weapon.resize(40,40);
  
  //buttons
  pause = loadImage("pause.png");
  reset = loadImage("reset.png");
  cont = loadImage("continue.png");
  menu = loadImage("menu.png");
  playbutton = loadImage("play.png");
  mute = loadImage("mute.png");
  save = loadImage("save.png");
  highscoreimage = loadImage("highscore.png");
  scoreimage = loadImage("score.png");
  personimage = loadImage("person.png");
  person2image = loadImage("person2.png");
  one = loadImage("one.png");
  two = loadImage("two.png");
  three = loadImage("three.png");
  
  one.resize(150,150);
  two.resize(80,80);
  three.resize(150,100);
  
  p = new Person(50,260,2,5,2,person,personL);
  p2 = new Person(50,260,2,5,2,person2,person2L);
  
  e1 = new enemy(400,260,3,3,enemy);
  w1 = new weapon(400, 260,3,3,weapon);
  
  e2 = new enemy(150, 260, 0,0, spikes);
  
  e3 = new enemy(200,260,3,3,enemy);
  
  e4 = new enemy(350, 260, 0,0, spikes);
  
  
  
  s1 = new sword(400,0,3,3,sword);
  s2 = new sword(200,0,3,3,sword);
  
  br = new buttonRect(800, 0, 200, 100, color(110), color(200));
  
  selected = p;
  
  int level = 1;
  score = 10;
}
  
void draw(){
  //background(bg);
  background(bg);
  if (gameScreen == 0) { //initial screen
    Start(); }
  else if (gameScreen == 1) { //game start
    Play(); }
  else if (gameScreen == 4) {
    CharSelect(); }
  else if (gameScreen == 2) {
    GameOver(); }
  else if (gameScreen == 5){
    diff_level();
  }
  else if (gameScreen == 3) {
    Pause();
  }
  else if (gameScreen == 6) {
    Scoreboard();}
    
    //menu
    pushMatrix();
    scale(0.3);
    image(menu, 3100, 145);
    popMatrix();
    
    if (mousePressed) {
    if (mouseX >= 888 && mouseX <= 978 && mouseY >= 30 && mouseY <= 62) {
      gameScreen = 0;
      clicksound.play();}
    }
    
    //mute
    pushMatrix();
    scale(0.3);
    imageMode(CENTER);
    image(mute, 3200, 350);
    popMatrix();
    
    //score
    pushMatrix();
    scale(0.03);
    imageMode(CENTER);
    image(scoreimage, 29000, 3500);
    popMatrix();
    println(mouseX, mouseY);
    if (mousePressed) {
    if (mouseX >= 825 && mouseX <= 913 && mouseY >=89 && mouseY <= 120) {
      gameScreen = 6;
      clicksound.play();
    }}
  
  collision_enemy(e1, selected);
  collision_enemy(e2, selected);
  collision_sword(s1, selected);
  collision_enemy(e3, selected);
  collision_enemy(e4, selected);
  collision_sword(s2, selected);
  
}

void mouseClicked() {
    if (mouseX >= 942 && mouseX <= 975 && mouseY >=84 && mouseY <= 122) {
      if (bgm.isPlaying()) {
        bgm.stop();
        clicksound.play();}
      else {
        bgm.play();
        clicksound.play();}
    }
  }

void Start() { //0
  PFont title = createFont("Rockwell-Bold", 80);
  //PFont play = createFont("Rockwell-Bold", 50);
  
  textFont(title);
  textAlign(CENTER);
  colorMode(RGB);
  fill(27, 84, 39);
  text("Adventure Island", width/2+5, 250+7);
  fill(106, 60, 22);
  text("Adventure Island", width/2, 250);
  
  //fill(111, 222, 87, 50);
  //stroke(16);
  //rect(425, 400, 150, 70, 30);
  //textFont(play);
  //fill(27, 84, 39);
  //text("Play", width/2, 450);
  pushMatrix();
  scale(0.4);
  imageMode(CENTER);
  image(playbutton, 1200, 1100);
  popMatrix();
  
  if (mousePressed) {
    if (mouseX >= 408 && mouseX <= 586 && mouseY >=424 && mouseY <= 480) {
      gameScreen = 4;
      clicksound.play();
    }
  }
}

void CharSelect() { //4
  PFont title = createFont("Rockwell-Bold", 50);
  //PFont play = createFont("Rockwell-Bold", 50);
  textFont(title);
  textAlign(CENTER);
  colorMode(RGB);
  fill(27, 84, 39);
  text("Select your character: ", width/2+5, 150);
  
  pushMatrix();
  scale(0.3);
  image(personimage, 1200, 1000);
  popMatrix();
  
  pushMatrix();
  scale(0.6);
  image(person2image, 1050, 480);
  popMatrix();
  
  pushMatrix();
  scale(0.2);
  image(playbutton, 1700, 2400);
  popMatrix();
  
  pushMatrix();
  scale(0.2);
  image(playbutton, 3100, 2400);
  popMatrix();
    
  if (mousePressed) {
    if (mouseX >= 314 && mouseX <= 401 && mouseY >=472 && mouseY <= 500) {
      selected = p;
      gameScreen = 1;
      clicksound.play();
    }
  }
  
  if (mousePressed) {
    if (mouseX >= 596 && mouseX <= 681 && mouseY >=472 && mouseY <= 500) {
      selected = p2;
      gameScreen = 1;
      clicksound.play();
    }
  }
}

void diff_level(){
  PFont title = createFont("Rockwell-Bold", 50);
  //PFont play = createFont("Rockwell-Bold", 50);
  textFont(title);
  textAlign(CENTER);
  colorMode(RGB);
  fill(27, 84, 39);
  text("Select your difficult level: ", width/2+5, 250+7);
  
  pushMatrix();
  //scale(0.3);
  image(one, 300, 300);
  popMatrix();
  
  pushMatrix();
  //scale(0.6);
  image(two, 400, 300);
  popMatrix();
  
  pushMatrix();
  //scale(0.6);
  image(three, 500, 300);
  popMatrix();
}

void GameOver() {//2
  imageMode(CENTER);
  textMode(CENTER);
  
  PFont title = createFont("Rockwell-Bold", 30);
  PFont play = createFont("Rockwell-Bold", 50);
  //textFont(title);
  //fill(255);
  //text("Your Score: ", + score, width/3, height/2);
    pushMatrix();
    scale(0.18);
    image(reset, 4630, 255);
    popMatrix();
    
  textFont(play);
  
  if (score <= 0) {
    text("You DIED", width/2, height/3 + 100); }
  else if (selected.p.x >= 500 && score>0) {
    text("You WIN", width/2, height/3 + 100);
    text("Your score is: "+nfc(score,2), width/2, height/3 + 150);
    
    //text("Enter your name: ", width/2, height/3 + 150 + 50);
    pushMatrix();
    scale(0.3);
    image(save, 1700, 1500);
    popMatrix();
    
    if (mousePressed) {
      if (mouseX >= 464 && mouseX <= 555 && mouseY >= 435 && mouseY <= 466) {
        //scorefile.println(score);
        //scorefile.flush();
        //scorefile.close(); 
        gameScreen = 0;
        clicksound.play();}
    }
  }
  
  //reset 
  if (mousePressed) {
    if (mouseX >= 796 && mouseX <= 865 && mouseY >= 29 && mouseY <= 59) {
      //println("in reset");
      reset();
      gameScreen = 1;
      clicksound.play();}
    }
}

void Pause() { //3
  PFont pausetext = createFont("Rockwell-Bold", 100);
  //PFont play = createFont("Rockwell-Bold", 50);
  textFont(pausetext);
  fill(255);
  textMode(CENTER);
  text("PAUSED", width/2, height/2);
  
  pushMatrix();
    scale(0.3);
    image(cont, 1650, 1500);
  popMatrix();
  
  if (mousePressed) {
    if (mouseX >= 386 && mouseX <= 600 && mouseY >= 429 && mouseY <= 477) {
      gameScreen = 1;
      clicksound.play();}
    }
    
  //textFont(play);
  //text("Click Anywhere to Resume", width/5, height/1.5);
  
  //if (mousePressed) {
    //gameScreen = 1; }
}

void Play() { //1
    //pause
    pushMatrix();
    scale(0.06);
    image(pause, 12500, 800);
    popMatrix();
    
    if (mousePressed) {
    if (mouseX >= 720 && mouseX <= 790 && mouseY >= 18 && mouseY <= 78) {
      gameScreen = 3;
      clicksound.play();}
    }
    
    //start over
    pushMatrix();
    scale(0.18);
    image(reset, 4630, 255);
    popMatrix();
    
    if (mousePressed) {
    if (mouseX >= 796 && mouseX <= 865 && mouseY >= 29 && mouseY <= 59) {
      reset();
      clicksound.play();}
    }
    
    //if (level = 1){
    selected.display();
    selected.move(-80);
    e1.display();
    e1.moveH();
    w1.display();
    w1.moveH();
    s1.display();
    s1.move();
    //}
    //if (p.x > 500){
    //  level = 2;
    //  p.x = 0;
    //selected.display();
    //selected.move(-80);
    s2.display();
    s2.move();
    e2.display();
    e3.display();
    e3.moveH();
    e4.display();
    //}
  
  textSize(40);
  text("score: " + nfc(score,2), 140,50);

}

    void keyPressed(){
      if (keyCode == UP ){
        up = true;
        jumpsound.play();
      }
      if (keyCode == DOWN ){
        down = true;
        jumpsound.play();
      }
      if (keyCode == LEFT){
        left = true;
        jumpsound.play();
      }
      if (keyCode == RIGHT){
        right = true;
        jumpsound.play();
      }
    }
    
    void keyReleased(){
      if (keyCode == UP){
        up = false;
      }
      if (keyCode == DOWN ){
        down = false;
      }
      if (keyCode == LEFT ){
        left = false;
      }
      if (keyCode == RIGHT ){
        right = false;
      }
    }

//void mousePressed() {
//  if (br.isPressed()) {
//    reset();
//  }
//}

void reset()
{
  selected.setPosition(50,260);
  score = 10;
}

void Scoreboard() { //6
  fill(0, 50);
  rect(100, 100, 800, 400, 30);
  
  pushMatrix();
  scale(0.3);
  image(highscoreimage, 1700, 255);
  popMatrix();
  
  highscore();
}

void highscore() {
  String[] scoretext = loadStrings("scorefile.txt");
  //String[] scorerank = sort(scoretext, scoretext.length);
  
  int i = 0;
  int scorewidth = 390; 
  int scoreheight = 170;
  
  PFont ranktext = createFont("Rockwell-Bold", 40);
  textFont(ranktext);
  textMode(CENTER);
  fill(0);
  while(i < scoretext.length) {
    text(i+1, scorewidth, scoreheight);
    text(scoretext[i], scorewidth + 200, scoreheight);
    i += 1;
    scoreheight += 70;
  }
}
