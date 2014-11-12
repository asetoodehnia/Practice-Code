/*
  quadratic formla x = [-b+sqrt(b^2 - 4ac)]/2a or [-b-sqrt(b^2 - 4ac)]/2a
 */

void setup() {
  noLoop();
}

void draw() {
  println(quadratic(1, 4, 4));
}

float[] quadratic(float a, float b, float c) {
  float[] answer = new float[2];
  answer[0] = (-b+sqrt(b*b-4*a*c))/(2*a);
  answer[1] = (-b-sqrt(b*b-4*a*c))/(2*a);
  return answer;
}
