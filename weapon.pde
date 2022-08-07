class weapon extends enemy{
    boolean turnstate;

  //weapon(){
  //  super();
  //}
  
  weapon(float x, float y, float v_x, float v_y, PImage img){
   super(x, y, v_x, v_y, img);
   turnstate = false;
 }
 
float r = 0;
void display(){
       
    pushMatrix();
    translate(p.x+200,p.y+250);
    rotate(radians(r));
    r += 4;
    //imageMode(CENTER);
    image(e_img, 0, 0);

    popMatrix();
       //fill(4,219,52);
    //imageMode(CORNER);
    //pushMatrix();
    //translate(p.x+20,p.y+30);
    //rotate(radians(r));
    //r += 1;
    //image(s_img, p.x, p.y);
    ////rect(-8,-10,16,20);
    //popMatrix();

  }
  
  void moveH(){
    if (turnstate == false){
      p.x -= 2;
      if (p.x <= 200){
        turnstate = true;
      }
  }
  
    if (turnstate == true){
        p.x += 2;
      if (p.x >= 500){
        turnstate = false;
      }
      
  }
  

}
 

 
  
  

}
