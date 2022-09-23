int[] bricks = new int[20];
int x=250; 
int direction_x=2; 
int y=150; 
int direction_y=2; 
int speedx = 3;
int speedy = -3;
int score=0;
int level = 1;
int loading = 0;

void setup()
{
 

  int i;
 size(600,400);
 
  for (i=0; i<20; i++) 
  {
    bricks[i] = 1;
  }
}


void draw()
{
  int i;
  int x_tmp;
  int y_tmp;
  int bricks_disappear;
  
 
    
      for(i = 0; i < 20; i++)
      {
        bricks[i] = 1;
      }

      
 background(0,0,0); 
 textSize(16);
 textAlign(RIGHT);
 text("Score", 80, 390);
 textAlign(LEFT);
 text(score, 90, 390);
 
 
 
 
 fill(0,0,255); 
 rect(mouseX-60,380,120,20); 

 fill(255,0,0);
 ellipse(x,y,20,20);
 
 if (y>height) {
    textSize(40);
    textAlign(CENTER);
    text("YOU LOSE!!", 300, 300);
  }

 
 x=x+direction_x; 
 if(x<10) direction_x=-direction_x; 
 if(x>(width-10)) direction_x=-direction_x;

 y=y+direction_y;
 if(y<10) direction_y=-direction_y;
 if(y>(height-10)) direction_y=-direction_y;

 if(y>(height-10))
 {
 direction_y=-direction_y; 
 }

 if((y>(height-30))&&(abs(mouseX-x)<60)) 
 {
 direction_y=-direction_y; 
 }
 

 bricks_disappear = 1;
  
  for (i=0; i<20; i++) 
  {
  
    x_tmp = i%5*100+15; 
    y_tmp = 40*(i/5)+15; 
    
    if (bricks[i]==1) 
    { 
      
      rect(x_tmp+40, y_tmp+10, 80, 20);
  
      bricks_disappear = 0;
    }
    if (x>(x_tmp+4) && x<(x_tmp+76) && y>y_tmp && y<(y_tmp+20) && bricks[i]==1)
    { 
      bricks[i]=0;
      speedy = -speedy;
      score = score + 5;
    }
    if (((x>(x_tmp-10) && x<x_tmp) || (x>(x_tmp+90) && x<(x_tmp+95))) && y>y_tmp && y<(y_tmp+30) && bricks[i]==1)
    { 
      bricks[i]=0;
      speedx = -speedx;
      score = score + 5;
    }
    
    if (((x>(x_tmp-1) && x<(x_tmp+5)) || (x>(x_tmp+75) && x<(x_tmp+81))) && y>y_tmp && y<(y_tmp+20) && bricks[i]==1) 
    { 
      bricks[i]=0;
      speedx = -speedx;
      speedy = -speedy;
      score = score + 5;
    }

  }
 if(bricks_disappear == 1 && loading < 200)
  {
    textSize(40);
    textAlign(CENTER);
    text("Well Done,Level Cleared", 250, 210);
    text("Next level loading...", 250, 280);
    x = 250;
    y = 150;
    speedx = 0;
    speedy = 0;
    loading++;
    if (loading==200)
    
    {
      loading = 0;
      x = 250;
      y = 150;
      speedx = 2 + level;
      speedy = -3 -level;
      level++;
  }
 
      for (i=0; i<20; i++) {
        bricks[i] = 1;
      }
  }
}
