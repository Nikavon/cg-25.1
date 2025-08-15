float angPlaneta1 = 0.0;
float angPlaneta2 = 0.0;
float angLua1 = 0.0;
float angLua2 = 0.0;
boolean animar = false;

void setup() {
  size(600, 600);
  noStroke();
}

void draw() {
  background(0);
  translate(width/2, height/2); // Centro da tela
  
  // Sol
  fill(255, 255, 0);
  desenhaCirculo(30); // raio em pixels
  
  // Planeta 1 (anti-horário)
  pushMatrix();
  rotate(radians(angPlaneta1));
  translate(150, 0);
  fill(0, 0, 255);
  desenhaCirculo(15);
  popMatrix();
  
  // Planeta 2 (horário)
  pushMatrix();
  rotate(radians(-angPlaneta2));
  translate(210, 0);
  fill(0, 255, 0);
  desenhaCirculo(18);
  
  // Lua 1 (orbita no eixo X)
  pushMatrix();
  rotate(radians(angLua1));
  translate(35, 0);
  fill(128);
  desenhaCirculo(7);
  popMatrix();
  
  // Lua 2 (orbita em diagonal XY)
  pushMatrix();
  rotate(radians(angLua2));
  translate(50, 15);
  fill(180);
  desenhaCirculo(5);
  popMatrix();
  
  popMatrix();
  
  // Atualiza ângulos se animar = true
  if (animar) {
    angPlaneta1 += 2.0;
    angPlaneta2 += 1.5;
    angLua1 += 5.0;
    angLua2 += 3.0;
    
    if (angPlaneta1 > 360) angPlaneta1 -= 360;
    if (angPlaneta2 > 360) angPlaneta2 -= 360;
    if (angLua1 > 360) angLua1 -= 360;
    if (angLua2 > 360) angLua2 -= 360;
  }
}

// Função para desenhar um círculo preenchido
void desenhaCirculo(float raio) {
  ellipse(0, 0, raio*2, raio*2);
}

// Captura tecla
void keyPressed() {
  if (key == 'y' || key == 'Y') {
    animar = !animar;
  }
}
