void mousePressed() {
  PShape[] s1 = new PShape[numOfSeeds/3];
  PShape[] s2 = new PShape[numOfSeeds/3];
  PShape[] s3 = new PShape[numOfSeeds/3];
  PShape[] seedn_a = new PShape[5];
  PShape[] seedn_b = new PShape[5];
  PShape[] seedn_c = new PShape[5];
  float[] posX = new float[numOfSeeds];
  float[] posY = new float[numOfSeeds];
  float[] velX = new float[numOfSeeds];
  float[] velY = new float[numOfSeeds];
  float[] accX = new float[numOfSeeds];
  float[] accY = new float[numOfSeeds];
  float[] ang = new float[numOfSeeds];
  int[] ck1 = new int[numOfSeeds/3];
  int[] ck2 = new int[numOfSeeds/3];
  int[] ck3 = new int[numOfSeeds/3];
  float[] p = new float[8];

  for (int i = 0; i < 5; i++) {
    seedn_a[i] = loadShape("seed" + i + "_a.svg");
    seedn_b[i] = loadShape("seed" + i + "_b.svg");
    seedn_c[i] = loadShape("seed" + i + "_c.svg");
  }

  for (int i = 0; i < numOfSeeds/3; i++) {
    ck1[i] = int(random(5));
    s1[i] = seedn_a[ck1[i]];
    ck2[i] = int(random(5));
    s2[i] = seedn_b[ck2[i]];
    ck3[i] = int(random(5));
    s3[i] = seedn_c[ck3[i]];
  }
  for (int i = 0; i < numOfSeeds; i++) {
    posX[i] = mouseX;
    posY[i] = mouseY;
    velX[i] = 0.0;
    velY[i] = 0.0;
    accX[i] = random(-movement, movement);
    accY[i] = random(-movement, movement);
    ang[i] = 0.0;
  }

  p[0] = mouseX;
  p[1] = mouseY;
  p[2] = (p[6] < p[0]) ? random(p[6] - 100, p[6]) : random(p[6], p[6] + 100); // p[6] < p[0] 이라면 p[2]의 범위는 random(p[6] - 300, p[6]);
  p[3] = height;
  p[4] = (p[6] < p[0]) ? random(p[6] - 100, p[6]) : random(p[6], p[6] + 100); // p[6] < p[0] 이라면 p[4]의 범위는 random(p[6] - 300, p[6]);
  p[5] = 50;
  p[6] = random(mouseX - 300, mouseX + 300);
  p[7] = height;

  seeds.add(new Seed(s1, s2, s3, posX, posY, velX, velY, accX, accY, ang, ck1, ck2, ck3));
}
