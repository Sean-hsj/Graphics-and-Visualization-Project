class gold_coin{
  PVector p;
  PImage gold_coin;
  
  gold_coin(float x, float y, PImage img){
    p = new PVector(x,y);
    gold_coin = img;
  }
  
  void setPosition(float x, float y){
    p.x = x;
    p.y = y;
    
  }
  
  //void applyForce(float y){
  //  if (p.y > p.y - 10){     
  //    p.y -= y;
  //  }
  //  else
     
  //}
  
  void display(){
  pushMatrix();
  translate(p.x,p.y);
  imageMode(CENTER);
  image(gold_coin, p.x, p.y);
  popMatrix();
  }
  
  void disapear(){
  
  }


}
