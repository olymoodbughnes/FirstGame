Boolean toggleCoords, menuClose = true, start, loadingSquareMove = false;
/*4*/
color col, happ, choiceCol = color(255), choiceCol2 = color(255);
/*3*/
int angle = 0, angle2 = 0, angle3 = 0, angle4 = 0, deathCounter, progress, mapWallPos = 60, loadingSquareX = width/2 -20, loadingSquareY = height/2 + 400, spa, level = 0, obsMovement2, obsquareY2, obsquareX2, obsMovement, obsquareY, obsquareX, squareY, squareX = 120;
/*15*/
token [] orbs;


void setup() {
  background(0);
  size(600, 650);
  orbs = new token[3];
  for (int i = 0; i < 3; i++) {
    orbs[i] = new token();
  }
  toggleCoords = true;
  obsMovement = 3;
  obsMovement2 = 5;
  deathCounter = -1;
  progress = 0;
}
void draw() {
  //println(frameCount);
  if (key == 'w') {
    squareY = squareY - 5;
    println(key);
  } else if (key == 'W') {

    squareY = squareY - 5;
    println(key);
  }
  if (key == 's') {
    squareY = squareY + 5;
    println(key);
  }

  if (key == 'a') {
    squareX = squareX - 5;
    println(key);
  }
  if (key == 'd') {
    squareX = squareX + 5;
    println(key);
  }
  
  if (frameCount < 163) {
    mainMenuScreen();
    angle++;
  } else if (frameCount > 163 && frameCount< 263) {
    angle = 180;
    mainMenuScreen();
    angle2++;
    mainMenuScreen2();
  } else if (frameCount > 263 && frameCount < 363) {
    mainMenuScreen();
    angle2 = 180;
    mainMenuScreen2();
    angle3++;
    mainMenuScreen3();
  } else if (frameCount > 400) {

    gameGame();
  }
  //println(dist(mapWallPos*3, 220, squareX, squareY));
}

void loadingSquare() {

  rect(loadingSquareX, loadingSquareY, 50, 50);
  fill(0);
  stroke(255);
  rect(width/2 -20, height/2 + 400, 500, 50);
}
void keyPressed() {
  if (key == 'y') {
    choiceCol = color(0, 255, 0);
    loadingSquareMove =  true;
  }
  if (key == 'n') {

    choiceCol2 = color(255, 0, 0);
    mainMenuScreen4();  
    loadingSquareMove =  true;
  }
  if (key == ' ' && toggleCoords == false) {
    // println(toggleCoords);
    toggleCoords = true;
  } else if (key == 'q' && toggleCoords == true) {
    toggleCoords = false;
  }
/*  if (key == 'w') {
    squareY = squareY - 10;
    println(key);
  } else if (key == 'W') {

    squareY = squareY - 10;
    println(key);
  }
  if (key == 's') {
    squareY = squareY + 10;
    println(key);
  }

  if (key == 'a') {
    squareX = squareX - 10;
    println(key);
  }
  if (key == 'd') {
    squareX = squareX + 10;
    println(key);
  }
  if (key == ' ') {
  }*/
}
void squareCoords(color col) {
  fill(col);
  textSize(12);
  text("x: " + squareX, squareX, squareY - 5);
  text("y: " + squareY, squareX + 40, squareY+ 20);
}
void progressShown() {
  text(progress + "/3 orbs ", 400, 620);
}
void obsBounce() {
  if (obsquareY > 540 ) {
    obsMovement = -obsMovement;
  } else if (obsquareY < 0) {
    obsMovement = -(obsMovement);
  }
}

void obsBounce2() {
  if (obsquareY2 > 540 ) {
    obsMovement2 = -obsMovement2;
  } else if (obsquareY2 < 0) {
    obsMovement2 = -(obsMovement2);
  }
}

void squareBounds() {
  if (squareY > 568 ) {
    squareY = 568;
  }
  if (squareY < 0 ) {
    squareY = 0;
  }
  if (squareX > 565 ) {
    squareX = 565;
  }
  if (squareX < 0 ) {
    squareX = 0;
  }
}

void obsSquare(int X, int Y) {
  rect(X, Y, 60, 60 );

  if ((squareX + 30 > X) && (squareX < X + 60)
    && ((squareY + 30 > Y) && (squareY < Y + 60))) {
    squareX = 0;
    squareY = 0;
    deathCounter++;
  }
  obsquareY = obsquareY + obsMovement;
}

void obsSquare2(int X, int Y) {
  rect(X, Y, 60, 60 );

  if ((squareX + 30 > X) && (squareX < X + 60)
    && ((squareY + 30 > Y) && (squareY < Y + 60))) {
    squareX = 0;
    squareY = 0;
    deathCounter++;
  }
  obsquareY2 = obsquareY2 + obsMovement2;
}




void Background() {
  noStroke();
  fill(143, 170, 27);
  ellipse(width/2, height/2 - 25, 800, 800);
  fill(156, 183, 39);
  ellipse(width/2, height/2 - 25, 780, 780);
  fill(204, 255, 0);
  ellipse(width/2, height/2 - 25, 760, 760);
}

void PlayerSquare() {
  fill(0);
  noStroke(); 
  rect(squareX, squareY, 30, 30);

  if (progress == 0) {
    happ = color(255, 0, 0);
  }
  if (progress == 1) {
    happ = color(245, 174, 67);
  }
  if (progress == 2) {
    happ = color(241, 245, 67);
  }
  if (progress == 3) {
    happ = color(3, 255, 0);
    textSize(16);
    fill(173, 75, 196);
    text("Congratulations, you only had to die " + deathCounter + " times!!", width/2 - 290, height/2);
    text("", width/2- 400, height/2- 90);
  }
  fill(happ);
  ellipse(squareX +15, squareY + 15, 30, 30);
  stroke(0);
  fill(255);
  ellipse(squareX +20, squareY + 15, 5, 5);

  ellipse(squareX +10, squareY + 15, 5, 5);
  line(squareX, squareY, squareX+13, squareY+15);
  line(squareX + 30, squareY, squareX+17, squareY+15);
  fill(happ);
}

void CoordsToggled() {
  if (toggleCoords == true) {
    col = color(0);
   // squareCoords(col);
  } else if (toggleCoords == false) {
    col = color(204, 255, 0);
  }
}

void DeathCount() {
  fill(125, 193, 37);
  stroke(0, 255, 0);
  rect(0, 600, 600, 60 );
  fill(0);
  textSize(24);
  text("Deaths: " + deathCounter, 0, 620);
}
void orbStorage() {
  fill(0);
  ellipse(width/2-30, 620, 10, 10);
  ellipse(width/2-50, 620, 10, 10);
  ellipse(width/2-70, 620, 10, 10);
}

void StatObstacle1() {

  rect(mapWallPos, 0, 30, 150);
  rect(mapWallPos, 220, 30, 150);
  rect(mapWallPos, 450, 30, 150);

  rect(mapWallPos*3, 0, 30, 250);
  rect(mapWallPos*3, 350, 30, 250);

  rect(mapWallPos*6, 0, 30, 150);
  rect(mapWallPos*6, 215, 30, 155);
  rect(mapWallPos*6, 450, 30, 150);

  if ( /**/((squareX + 30 > mapWallPos) && (squareX < mapWallPos + 30)  && ((squareY + 30 > 0) && (squareY < 150)))   ||
  /**/    ((squareX + 30 > mapWallPos) && (squareX < mapWallPos + 30) && ((squareY + 30 > 220) && (squareY < 370))) ||
  /**/    ((squareX + 30 > mapWallPos) && (squareX < mapWallPos + 30)  && ((squareY + 30 > 450) && (squareY < 650)))) {
    squareX = 0;
    squareY = 0;
    deathCounter++;
  }

  
  if ((squareX + 30 > mapWallPos*3) && (squareX < mapWallPos*3 + 30)
   && ((squareY + 30 > 0) && (squareY < 250))) {
   squareX = 0;
   squareY = 0;
   deathCounter++;
   }

   if ((squareX + 30 > mapWallPos*3) && (squareX < mapWallPos*3 + 30)
   && ((squareY + 30 > 350) && (squareY < 650))) {
   squareX = 0;
   squareY = 0;
   deathCounter++;
   }
   if ( /**/((squareX + 30 > mapWallPos*6) && (squareX < mapWallPos*6 + 30)  && ((squareY + 30 > 0) && (squareY < 150)))   ||
  /**/    ((squareX + 30 > mapWallPos*6) && (squareX < mapWallPos*6 + 30) && ((squareY + 30 > 220) && (squareY < 370))) ||
  /**/    ((squareX + 30 > mapWallPos*6) && (squareX < mapWallPos*6 + 30)  && ((squareY + 30 > 450) && (squareY < 650)))) {
    squareX = 0;
    squareY = 0;
    deathCounter++;
  }
}

void StatObstacle2() {

  rect(mapWallPos, 0, 30, 150);
  rect(mapWallPos, 220, 30, 150);
  rect(mapWallPos, 450, 30, 150);

  rect(mapWallPos*3, 0, 30, 250);
  rect(mapWallPos*3, 350, 30, 250);

  rect(mapWallPos*6, 0, 30, 150);
  rect(mapWallPos*6, 215, 30, 155);
  rect(mapWallPos*6, 450, 30, 150);
}
void setMap() {
  if (level == 0) {
    StatObstacle1();
  } else if (level == 1) {
    StatObstacle2();
  }
}

void gameGame() {

  fill(255);
  textSize(30);
  text("Ready?", width/2 - 70, height/2);
  fill(choiceCol);
  text("[Y] ", width/2-  75, height/2+ 40);
  fill(choiceCol2);
  text(" [N]", width/2-  25, height/2+ 40);
  fill(255);
  if (loadingSquareMove) {
    loadingSquare();
    loadingSquareX = loadingSquareX + 4 ;
    if (loadingSquareX > 490) {
      start = true;

      if (start == true) {
        background(124, 147, 27);

        Background();


        //SQUARE FACE PARAMETERS
        PlayerSquare();

        //END SQUARE FACE PARAEMETERS

        obsSquare(obsquareX+500, obsquareY);
        obsSquare2(obsquareX2 + 100, obsquareY2);

        //COORDINATE TOGGLE ON/OFF
        CoordsToggled();

        //SQUARE BOUNDS DEFINITION
        squareBounds();
        //OBSTACLE SQUARE int squareX;int squareY;

        obsBounce();
        obsBounce2();



        DeathCount();
        setMap();
        progressShown();
        orbStorage();
        for (int i = 0; i < 3; i++) {
          orbs[i].draw();  
          orbs[i].active();
        }
      }
    }
  }
}


void mainMenuScreen() {

  fill(0, 5);
  rect(0, 0, width, height);
  rotate(PI/angle);
  fill(random(0, 255), random(0, 255), random(0, 255));

  textSize(40);
  text(">  ", width/2 - 270, 40);
  text("The Possible Game", width/2 - 80, 40);
}
void framess() {
  if (frameCount == 60) {
    frameCount = 0;
  }
}

void  mainMenuScreen2() {

  // text("huh", width/2 - 80, 40);

  rotate(PI/angle2);
  fill(random(0, 255), random(0, 255), random(0, 255));

  textSize(20);
  text(">  ", width/2 - 270, 80);
  text("An 'Impossible Game' knockoff.", width/2 - 80, 80);
}

void mainMenuScreen3() {


  rotate(PI/angle3);
  fill(random(0, 255), random(0, 255), random(0, 255));

  textSize(10);
  text(">  ", width/2 - 270, 100);
  text("By Yairo Manuel Becerra Gutierrez", width/2 - 80, 100);
}
void mainMenuScreen4() {



  textSize(30);
  text(">  ", width/2 - 270, 100);
  text("Well you're playing it anyway.", width/2-200, height/2 + 80);
}
void keyReleased(){
 if (key == 's') {
    squareY = squareY + 0;
    println(key);
  }
}
