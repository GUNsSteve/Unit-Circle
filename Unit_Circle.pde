float mouselength;
float angle;
void setup (){
  shapeMode (CENTER);
  fullScreen ();
  //smooth (500);
  textAlign (CENTER,CENTER);
}
void draw (){
  background (255);
  angle = degrees (asin ((mouseY-height/2)/mouselength));
 /*if ((String)angle == "NaN"){
    println ();
    println ("DEBUG:");
    print (mouseY);
    print(mouselength);
    println (angle);
    
  }*/
  fill (255);
  stroke(0);
  mouselength =sqrt(sq((width/2)-(mouseX))+sq ((height/2)-mouseY));
  ellipse(width/2,height/2,500,500);
  //line (width/2,height/2,mouseX,mouseY);
  pushMatrix();
  stroke(0,255,0);
  line (width/2,height/2-250,width/2,height/2+250);
  line (width/2-250,height/2,width/2+250,height/2);
  popMatrix();
  fill (0);
  //ellipse (width/2,height/2,100,100);
 
  
  stroke (0);
  if (sqrt(sq((width/2)-(mouseX))+sq ((height/2)-mouseY))>250){
    //ellipse (0,0,50,50);
    stroke (255,0,22);
    line (width/2,height/2,lerp (width/2,mouseX,250/mouselength),lerp (height/2,mouseY,250/mouselength));
  }
  else {
    line (width/2,height/2,lerp (width/2,mouseX,250/mouselength),lerp (height/2,mouseY,250/mouselength));
  }
  fill (0);
  if (mouseX>width/2&&mouseY<height/2){
    text ("First Quadrant",width/2,height/2+100);
    angle=angle*-1;
  }
  else if(mouseX <width/2&&mouseY<height/2){
    text ("Second Quadrant",width/2,height/2+100);
    angle =(180+angle);
  }
  else if (mouseX <width/2&&mouseY >height/2){
    text ("Third Quadrant",width/2,height/2+100);
    angle=180+angle;
  }
  else {
    text ("Fourth Quadrant",width/2,height/2+100);
    angle=360-angle;
  }
  line(width/2,height/2,lerp (width/2,mouseX,250/mouselength),height/2);//triangleX
  line (lerp (width/2,mouseX,250/mouselength),height/2,lerp (width/2,mouseX,250/mouselength),lerp (height/2,mouseY,250/mouselength));//triangleY
  text (angle,width/2,height/2);
  fill (0,0,255);
  text ("cos (theta): "+cos(angle),lerp (width/2,lerp(width/2,mouseX,250/mouselength),0.5),height/2+20);
  fill (255,0,0);
  text("sin (theta): "+sin (angle),lerp (width/2,mouseX,250/mouselength),lerp (height/2,lerp (height/2,mouseY,250/mouselength),0.5));
  fill (255,0,255);
  if (angle!=90&&angle!=270)
  text ("tan (theta): "+tan(angle),lerp (width/2,lerp(width/2,mouseX,250/mouselength),0.5),lerp (height/2,lerp (height/2,mouseY,250/mouselength),0.5)+50);
  ellipse (mouseX,mouseY,10,10);
}
