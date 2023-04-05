void setup(){
  size(displayWidth, displayHeight);
  fullScreen();
  noCursor();
  background(0, 0, 0);
}

int counter = 0;
void draw(){
  final int INTERVAL = 60;
  final int NUM_PHASE = 10;
  final int COLORS[] = {#ff0000, #00ff00, #0000ff};
  final int MAX_INTERVAL = NUM_PHASE * COLORS.length * INTERVAL;
  int w = width;
  int h = height;
  int phase = 1;
  int base = 0;
  
  noStroke();
  base = (counter / INTERVAL) % COLORS.length;
  phase = round(pow(2, counter / INTERVAL / COLORS.length));
  
  w /= phase;
  for(int i=0; i<COLORS.length; i++){
    fill(COLORS[(base + i) % COLORS.length]);
    int current = i * w;
    while(current < width){
      rect(current, 0, w, h);
      current += 3 * w;
    }
  }
  
  counter = ++counter%MAX_INTERVAL;
}

void mouseClicked(){
  exit();
}
