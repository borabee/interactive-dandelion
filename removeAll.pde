void keyPressed() {
  if (key == ' ') {
    for (int i = seeds.size() - 1; i >= 0; i--) {
      seeds.remove(i);
    }
  }
}
