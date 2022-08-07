
class Person{
  PImage person_img;
  PImage person_imgL;
  PVector p;
  PVector v;
  float gravity;
  float ground;
  boolean isOnGround;
  boolean isRight;
   
  Person(float x, float y, float v_x, float v_y, float grav, PImage img, PImage img2){
    p = new PVector(x,y);
    v = new PVector(v_x, v_y);
    gravity = grav;
    person_img = img;
    person_imgL = img2;
    ground = 260;
    isOnGround = false;

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
    if (isRight){
    image(person_img, p.x, p.y);
    }
    else{
    image(person_imgL, p.x, p.y);
    }
    popMatrix();
  }
  
  
  void move(float jumpF) {
    if (p.y < 260){
       p.y += gravity;
     }
    //println(right);
    if (right){
      p.x += v.x;
      isRight = true;
      println(p.x);
    }
    if (left){
      p.x -= v.x;
      isRight = false;
            //println(p.x);
    }
    
    if(p.y == 260){
      //println(isOnGround);
      isOnGround = true;
    }
    //if (p.x > 500){
    //  p.x = -1;
    //}
    
    //if (p.x < -1){
    //  p.x = 500;
    //}
      //if (isOnGround==true && keyPressed && keyCode == UP){
      //println(up);
     if (isOnGround==true && up==true){
        p.y += jumpF;
        isOnGround = false;
      }
  }
  
  //void jump(float jumpF){
  //  //println(p.y);
  //  if(p.y == 260){
  //    //println(isOnGround);
  //    isOnGround = true;
  //  }
    
  //    //if (isOnGround==true && keyPressed && keyCode == UP){
  //    //println(up);
  //    if (isOnGround==true && up==true){
  //      p.y += jumpF;
  //      isOnGround = false;
  //    }
  //    //println(p.y);
  //    //println(isOnGround);  
   

  //  }
  
    


  


}
