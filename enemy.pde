class enemy{
 PImage e_img;
 PVector p;
 PVector v;
 float ground;
 boolean turnstate;
 
 enemy(float x, float y, float v_x, float v_y, PImage img){
   p = new PVector(x, y);
   v = new PVector(v_x, v_y);
   e_img = img;
   ground = 260;
   turnstate = false;
   
 }
 
   void setPosition(float x, float y){
    p.x = x;
    p.y = y;
  }
  
  void setVel(float x, float y){
     v.x = x;
     v.y = y;
  }
    void display() {
    
    pushMatrix();
    translate(p.x,p.y);
    imageMode(CENTER);
    image(e_img, p.x, p.y);
    popMatrix();
  }
  
  void moveH(){
    if (turnstate == false){
      p.x -= 1;
      if (p.x <= 250){
        turnstate = true;
      }
  }
  
    if (turnstate == true){
        p.x += 1;
      if (p.x >= 400){
        turnstate = false;
      }
      
  }
  

}

}
