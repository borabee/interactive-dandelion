import processing.sound.*;
import processing.svg.*;
Amplitude amp;
AudioIn in;

PShape s1, s2, s3;

ArrayList<Seed> seeds = new ArrayList<Seed>();

int numOfSeeds = 36;
float movement = 0.08;
float volume = 0.2;
float radianAngle = 0.002;

void setup() {
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);

  fullScreen();
  shapeMode(CENTER);
}

void draw() {
  background(0);

  for (Seed result : seeds) {
    result.displaySeeds();
    result.blowing();
    result.rotating();
  }
}
