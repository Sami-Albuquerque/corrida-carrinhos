int altura, largura;
int x1, x2, x3, limite;
int carroSelecionado, carroVencedor;
boolean avante, vazio, aviso, escolha, empate, corridaFinalizada;

void setup() {
  size(1000, 500);
  colorMode(HSB, 360, 100, 100);
  background(138, 72, 92);
  largura = width;
  altura = height;
  x1 = (largura/30 + (largura/30) * 2);
  x2 = (largura/30 + (largura/30) * 2);
  x3 = (largura/30 + (largura/30) * 2);
  limite = largura/31 + (largura/31) * 29;
  carroSelecionado = 0;
  escolha = false;
  vazio = true;
  textAlign(CENTER);
  textSize(altura/30);
}

void draw() {
  noStroke();
//Esses gramados existem para deixar as árvores menos pixeladas. Não sei o que é que causava o efeito pixelado
//Gramado de cima
  fill(138, 72, 92);
  quad(0, 0, 0, altura/4, largura, altura/4, largura, 0);
  
//Gramado de baixo
  fill(138, 72, 92);
  quad(0, altura/4 * 3, 0, altura, largura, altura, largura, altura/4 * 3);

//Sombra da árvore de cima
  fill(0, 100, 50);
  ellipse(largura/3 + (largura/3)/20, altura/37 * 4, altura/7, altura/7);
  ellipse((largura/3) * 2 + (largura/3)/20, altura/37 * 4, altura/7, altura/7);
  
//Sombra da árvore de baixo
  fill(0, 100, 50);
  ellipse(largura/6 + (largura/3)/20, altura/37 * 37, altura/7, altura/7);
  ellipse(((largura/6) * 5) + (largura/3)/20, altura/37 * 37, altura/7, altura/7);
  
//Árvores de cima
  fill(0, 100, 92);
  ellipse(largura/3, altura/33 * 3, altura/7, altura/7);
  ellipse((largura/3) * 2, altura/33 * 3, altura/7, altura/7);
  
//Árvores de baixo
  fill(0, 100, 92);
  ellipse(largura/6, altura/33 * 31, altura/7, altura/7);
  ellipse((largura/6) * 5, altura/33 * 31, altura/7, altura/7);
 
//Meio-fio
  fill(241, 0, 40);
  quad(0, (altura/4) - (altura/4 + (altura/2)/3)/20, 0, altura/4, largura, altura/4, largura, (altura/4) - (altura/4 + (altura/2)/3)/20);
  quad(0, altura/4 + altura/2, 0, (altura/4 + altura/2) + (altura/4 + (altura/2)/3)/20, largura, (altura/4 + altura/2) + (altura/4 + (altura/2)/3)/20, largura, altura/4);

//Pista
  fill(241, 88, 43);
  quad(0, altura/4, 0, altura/4 + altura/2, largura, altura/4 + altura/2, largura, altura/4);

//Semáforo
  fill(53, 0, 21);
  quad(largura/30 + largura/30, altura/33 - (altura/33)/2, largura/30 + (largura/30) * 3, altura/33 - (altura/33)/2, largura/30 + (largura/30) * 3, altura/33 + (altura/33 * 6), largura/30 + (largura/30), altura/33 + (altura/33 * 6));
  stroke(0);
  strokeWeight(1);
  if (avante) {
    fill(137, 100, 92);
  } else {
    fill(53, 0, 21);
  }
  ellipse(largura/30 + largura/30 * 2, altura/33 * 5, altura/15, altura/15);
  
  if (!avante) {
    fill(0, 100, 92);
  } else {
    fill(53, 0, 21);
  }
  ellipse(largura/30 + largura/30 * 2, altura/33 * 2, altura/15, altura/15);
  
//Divisão da pista
  stroke(47, 95, 92);
  strokeWeight(altura/60);
  line(0, altura/4 + (altura/2)/3, largura, altura/4 + (altura/2)/3);
  line(0, altura/2 + ((altura/2)/3)/2, largura, altura/2 + ((altura/2)/3)/2);
  
//Linha de início e chegada
  noStroke();
  fill(100, 0, 100);
  quad(largura/30 + (largura/30) * 2, altura/4, largura/30 + (largura/30) * 3, altura/4, largura/30 + (largura/30) * 3, altura/4 + altura/2, largura/30 + (largura/30) * 2, altura/4 + altura/2);
  quad(largura/31 + (largura/31) * 30, altura/4, largura/31 + (largura/31) * 29, altura/4, largura/31 + (largura/31) * 29, altura/4 + altura/2, largura/31 + (largura/31) * 30, altura/4 + altura/2);
  
//Carrinhos
  fill(0, 100, 92);
  quad(x1, (altura/4 + (altura/2)/3) - (altura/4 + (altura/2)/3)/10, x1, altura/4 + (((altura/2)/3)/10) * 3, x1 - (largura/30 + (largura/30) * 2), altura/4 + (((altura/2)/3)/10) * 3, x1 - (largura/30 + (largura/30) * 2), (altura/4 + (altura/2)/3) - (altura/4 + (altura/2)/3)/10);
  fill(296, 100, 92);
  quad(x2, (altura/2 + ((altura/2)/3)/2) - ((altura/4 - (altura/2)/3)/10) * 6, x2, (altura/4 + (altura/2)/3) + (altura/4 + (altura/2)/3)/10, x2 - (largura/30 + (largura/30) * 2), (altura/4 + (altura/2)/3) + (altura/4 + (altura/2)/3)/10, x2 - (largura/30 + (largura/30) * 2), (altura/2 + ((altura/2)/3)/2) - ((altura/4 - (altura/2)/3)/10) * 6);
  fill(259, 95, 92);
  quad(x3, (altura/4 + altura/2) - ((altura/4 - (altura/2)/3)/10) * 5, x3, (altura/2 + ((altura/2)/3)/2) + ((altura/4 - (altura/2)/3)/10) * 6, x3 - (largura/30 + (largura/30) * 2), (altura/2 + ((altura/2)/3)/2) + ((altura/4 - (altura/2)/3)/10) * 6, x3 - (largura/30 + (largura/30) * 2), (altura/4 + altura/2) - ((altura/4 - (altura/2)/3)/10) * 5);

//Número dos carrinhos
  fill(55, 100, 100);
  text("1", x1 - (largura/30) - (largura/30)/2, altura/4 + (((altura/2)/3)/10) * 6);
  text("2", x2 - (largura/30) - (largura/30)/2, (altura/2 + (altura/4 + (altura/2)/3) + (altura/4 + (altura/2)/3)/5)/2);
  text("3", x3 - (largura/30) - (largura/30)/2, (altura/2 + ((altura/2)/3)/2) + ((altura/4 - (altura/2)/3)/10) * 12);
  
//Lógica dos textos (tive que colocar quads para fazer o texto anterior sumir, não consegui encontrar outra forma de não fazer os textos se misturarem)
  if(escolha && carroSelecionado != 0 && !vazio){
    fill(138, 72, 92);
    quad(largura/3, (altura/4 + altura/2) + (altura/4 + (altura/2)/3)/20, largura/3, altura, (largura/3) * 2, altura, (largura/3) * 2, (altura/4 + altura/2) + (altura/4 + (altura/2)/3)/20);
    fill(0);
    text("Você escolheu o carrinho " + carroSelecionado, largura/2, (altura/4 * 3) + (altura/4)/2);
  }
  else if(escolha && vazio){
    fill(138, 72, 92);
    quad(largura/3, (altura/4 + altura/2) + (altura/4 + (altura/2)/3)/20, largura/3, (altura/4 * 3) + (altura/4)/2 + (altura/4)/20, (largura/3) * 2, (altura/4 * 3) + (altura/4)/2 + (altura/4)/20, (largura/3) * 2, (altura/4 + altura/2) + (altura/4 + (altura/2)/3)/20);
    fill(0);
    text("Você não escolheu nenhum carrinho", largura/2, (altura/4 * 3) + (altura/4)/2);
  }
 //<>//
  if(aviso){
    fill(138, 72, 92);
    quad(largura/3, (altura/4 * 3) + (altura/4)/2 + (altura/4)/20, largura/3, (altura/4 * 3) + (altura/4)/2 + (altura/4)/4, (largura/3) * 2, (altura/4 * 3) + (altura/4)/2 + (altura/4)/4, (largura/3) * 2, (altura/4 * 3) + (altura/4)/2 + (altura/4)/20); //<>//
    fill(0);
    text("Escolha um carrinho para poder correr!", largura/2, (altura/4 * 3) + (altura/4)/2 + (altura/4)/5);
  }
  
//Lógica da corrida  
  if(x1 < limite && x2 < limite && x3 < limite && avante){
    x1 += (int)random(0, 5);
    x2 += (int)random(0, 5);
    x3 += (int)random(0, 5);
  }
  else{
    avante = false;
    if(x1 > x2 && x1 > x3){
      carroVencedor = 1;
    }
    else if(x2 > x1 && x2 > x3){
      carroVencedor = 2;
    }
    else if(x3 > x1 && x3 > x2){
      carroVencedor = 3;
    }
    
    if(carroVencedor != 0){
      corridaFinalizada = true;
      fill(138, 72, 92);
      quad(largura/3, (altura/4 + altura/2) + (altura/4 + (altura/2)/3)/20, largura/3, altura, (largura/3) * 2, altura, (largura/3) * 2, (altura/4 + altura/2) + (altura/4 + (altura/2)/3)/20);
      fill(0);
      text("O vencedor foi o " + carroVencedor, largura/2, (altura/4 * 3) + (altura/4)/2);
      
      if(carroVencedor == carroSelecionado){
        text("Você venceu!", largura/2, (altura/4 * 3) + (altura/4)/2 + (altura/4)/5);
      }
      else {
        text("Você perdeu!", largura/2, (altura/4 * 3) + (altura/4)/2 + (altura/4)/5);
      }
    }
  }
}

void keyPressed() {
  if (!vazio && escolha && !corridaFinalizada) {
    if(keyCode == ENTER)
      avante = true;
  }
  else {
    aviso = true;
  }
}

void mousePressed() {
  if(x1 == (largura/30 + (largura/30) * 2)){
      escolha = true;
      aviso = false;
    if (mousePressed && mouseY < (altura/4 + (altura/2)/3) - (altura/4 + (altura/2)/3)/10 && mouseY > altura/4 + (((altura/2)/3)/10) * 3 && mouseX < (largura/30 + (largura/30) * 2) && mouseX > 0) {
      carroSelecionado = 1;
      vazio = false;
    }
    else if (mousePressed && mouseY < (altura/2 + ((altura/2)/3)/2) - ((altura/4 - (altura/2)/3)/10) * 6 && mouseY > (altura/4 + (altura/2)/3) + (altura/4 + (altura/2)/3)/10 && mouseX < (largura/30 + (largura/30) * 2) && mouseX > 0) {
      carroSelecionado = 2;
      vazio = false;
    }
    else if (mousePressed && mouseY < (altura/4 + altura/2) - ((altura/4 - (altura/2)/3)/10) * 5 && mouseY > (altura/2 + ((altura/2)/3)/2) + ((altura/4 - (altura/2)/3)/10) * 6 && mouseX < (largura/30 + (largura/30) * 2) && mouseX > 0) {
      carroSelecionado = 3;
      vazio = false;
    }
    else {
      carroSelecionado = 0;
      vazio = true;
    }
  }
}
