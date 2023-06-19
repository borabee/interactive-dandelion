class Seed {
  PShape[] dandelion1 = new PShape[numOfSeeds/3];
  PShape[] dandelion2 = new PShape[numOfSeeds/3];
  PShape[] dandelion3 = new PShape[numOfSeeds/3];
  float[] positionX = new float[numOfSeeds];
  float[] positionY = new float[numOfSeeds];
  float[] velocityX = new float[numOfSeeds];
  float[] velocityY = new float[numOfSeeds];
  float[] accelerationX = new float[numOfSeeds];
  float[] accelerationY = new float[numOfSeeds];
  float[] angle = new float[numOfSeeds];
  int[] check1 = new int[numOfSeeds/3];
  int[] check2 = new int[numOfSeeds/3];
  int[] check3 = new int[numOfSeeds/3];
  float count = 0;

  Seed(PShape[] s1, PShape[] s2, PShape[] s3, float[] px, float[] py, float[] vx, float[] vy, float[] ax, float[] ay, float[] an, int[] ck1, int[] ck2, int[] ck3) {
    for (int i = 0; i < numOfSeeds/3; i++) {
      dandelion1[i] = s1[i];
      dandelion2[i] = s2[i];
      dandelion3[i] = s3[i];
      check1[i] = ck1[i];
      check2[i] = ck2[i];
      check3[i] = ck3[i];
    }
    for (int i = 0; i < numOfSeeds; i++) {
      positionX[i] = px[i];
      positionY[i] = py[i];
      velocityX[i] = vx[i];
      velocityY[i] = vy[i];
      accelerationX[i] = ax[i];
      accelerationY[i] = ay[i];
      angle[i] = an[i];
    }
  }
  void displaySeeds() {
    if (amp.analyze() > volume) count += 0.01;

    for (int i = 0; i < numOfSeeds/3; i++) {
      pushMatrix();
      translate(positionX[i], positionY[i]);
      if (count == 0) rotate(TWO_PI*(i+1)/(numOfSeeds/3) - random(noise(frameCount) + random(0.7))/100);
      else rotate(TWO_PI*(i+1)/(numOfSeeds/3) - random(noise(frameCount) + random(0.3))/100);
      if (check1[i] == 0) {
        shape(dandelion1[i], -0.3881, -44.5671, 47.3848, 74.134);
      } else if (check1[i] == 1) {
        shape(dandelion1[i], 1.2486, -45.9443, 47.209, 76.8884);
      } else if (check1[i] == 2) {
        shape(dandelion1[i], -1.5786, -45.1637, 44.8931, 75.3274);
      } else if (check1[i] == 3) {
        shape(dandelion1[i], 1.2691, -43.0045, 48.2358, 71.0088);
      } else {
        shape(dandelion1[i], -0.9299, -42.7184, 47.6982, 70.4368);
      }
      popMatrix();
    }
    for (int i = numOfSeeds/3; i < 2 * numOfSeeds/3; i++) {
      pushMatrix();
      translate(positionX[i], positionY[i]);
      if (count == 0) rotate(TWO_PI*(i+1)/(numOfSeeds/3) - random(noise(frameCount) + random(0.7))/100);
      else rotate(TWO_PI*(i+1)/(numOfSeeds/3) - random(noise(frameCount) + random(0.3))/100);
      if (check2[i - numOfSeeds/3] == 0) {
        shape(dandelion2[i - numOfSeeds/3], 15.3494, -34.9844, 37.343, 55.7711);
      } else if (check2[i - numOfSeeds/3] == 1) {
        shape(dandelion2[i - numOfSeeds/3], 17.76, -34.7267, 38.0215, 55.4061);
      } else if (check2[i - numOfSeeds/3] == 2) {
        shape(dandelion2[i - numOfSeeds/3], 14.6642, -33.907, 36.9072, 53.5655);
      } else if (check2[i - numOfSeeds/3] == 3) {
        shape(dandelion2[i - numOfSeeds/3], 16.5393, -32.672, 38.8613, 51.2589);
      } else {
        shape(dandelion2[i - numOfSeeds/3], 16.2724, -33.8879, 39.1484, 53.5279);
      }
      popMatrix();
    }
    for (int i = 2 * numOfSeeds/3; i < numOfSeeds; i++) {
      pushMatrix();
      translate(positionX[i], positionY[i]);
      if (count == 0) rotate(TWO_PI*(i+1)/(numOfSeeds/3) - random(noise(frameCount) + random(0.7))/100);
      else rotate(TWO_PI*(i+1)/(numOfSeeds/3) - random(noise(frameCount) + random(0.3))/100);
      if (check3[i - 2 * numOfSeeds/3] == 0) {
        tint(255, 100);
        shape(dandelion3[i - 2 * numOfSeeds/3], 5.371, -27.2546, 29.0933, 39.6378);
      } else if (check3[i - 2 * numOfSeeds/3] == 1) {
        tint(255, 100);
        shape(dandelion3[i - 2 * numOfSeeds/3], 7.3437, -27.5104, 28.6045, 40.3699);
      } else if (check3[i - 2 * numOfSeeds/3] == 2) {
        tint(255, 100);
        shape(dandelion3[i - 2 * numOfSeeds/3], 4.5055, -27.0691, 28.1274, 39.1675);
      } else if (check3[i - 2 * numOfSeeds/3] == 3) {
        tint(255, 100);
        shape(dandelion3[i - 2 * numOfSeeds/3], 6.779, -25.6699, 29.791, 36.6737);
      } else {
        tint(255, 100);
        shape(dandelion3[i - 2 * numOfSeeds/3], 5.6002, -26.2691, 29.2529, 37.6421);
      }
      popMatrix();
    }
  }

  void blowing() {
    if (amp.analyze() > volume) {
      for (int i = 0; i < numOfSeeds; i++) {
        velocityX[i] += (accelerationX[i] + amp.analyze()/20);
        velocityY[i] += (accelerationY[i] + amp.analyze()/20);
      }
    }
    for (int i = 0; i < numOfSeeds; i++) {
      positionX[i] += velocityX[i];
      positionY[i] += velocityY[i];
    }
  }

  void rotating() { 
    if (amp.analyze() > volume) {
      for (int i = 0; i < numOfSeeds; i++) {
        angle[i] += random(-radianAngle, radianAngle);
      }
    }
    for (int i = 0; i < numOfSeeds/3; i++) {
      if (amp.analyze() > volume) dandelion1[i].rotate(angle[i] + amp.analyze()/150);
      else dandelion1[i].rotate(angle[i]);
    }
    for (int i = numOfSeeds/3; i < 2 * numOfSeeds/3; i++) {
      if (amp.analyze() > volume) dandelion2[i - numOfSeeds/3].rotate(angle[i] + amp.analyze()/150);
      else dandelion2[i - numOfSeeds/3].rotate(angle[i]);
    }
    for (int i = 2 * numOfSeeds/3; i < numOfSeeds; i++) {
      if (amp.analyze() > volume) dandelion3[i - 2 * numOfSeeds/3].rotate(angle[i] + amp.analyze()/150);
      else dandelion3[i - 2 * numOfSeeds/3].rotate(angle[i]);
    }
  }
}
