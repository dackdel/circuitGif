boolean playing = true;
int currFrame = 0;
int frames = 50;
int framesToSave = 0;
PGraphics pg[] = new PGraphics[frames];

void setup() {
  size(900, 900);
  prepareGraphics();
}
void draw() {
  if (playing) {
    currFrame = frameCount % frames;
  } 
  if (mousePressed) {
    pg[currFrame].beginDraw();
    pg[currFrame].line(mouseX, mouseY, pmouseX, pmouseY);
    pg[currFrame].endDraw();
  }
  image(pg[currFrame], 0, 0);
}

void keyPressed() {
  
  if (key == ' ') {
    prepareGraphics();
  }
  if (keyCode == DOWN) {
    togglePlaying();
  }
  if (keyCode == RIGHT) {
    nextFrame();
  }
  if (keyCode == LEFT) {
    prevFrame();
  }
}
void start() {
  playing = true;
}

void stop() {
  playing = false;
}

void togglePlaying() {
  playing = !playing;
}

void setFrame(int frame) {
  currFrame = frame;
}

void nextFrame() {
  currFrame = ++currFrame % frames;
}

void prevFrame() {
  currFrame = currFrame - 1 < 0 ? frames - 1 : currFrame - 1;
}
int getFrames() {
  return frames;
}


void prepareGraphics() {
  for (int i=0; i<frames; i++) {
    pg[i] = createGraphics(width, height);
    pg[i].beginDraw();
    pg[i].background(255);
    pg[i].stroke(0);
    pg[i].strokeWeight(3);
    pg[i].endDraw();
  }
}

