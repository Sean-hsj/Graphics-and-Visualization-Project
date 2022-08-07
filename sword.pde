class sword{
 PImage s_img;
 PVector p;
 PVector v;
 
 sword(float x, float y, float v_x, float v_y, PImage img){
   p = new PVector(x, y);
   v = new PVector(v_x, v_y);
   s_img = img;
   
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
    image(s_img, p.x, p.y);
    popMatrix();
  }
  
  void move(){
  p.y += v.y;
  //p.x += random(-10,10);
  if (p.y > 350){
   p.y = 0;
  }
}

}
