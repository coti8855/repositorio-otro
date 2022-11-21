class Tablero {
  int cantCasillas;
  Casilla [][] casillas; 
  int posX2 = 1;
  int posY2 = 1;
  int posXBomba;
  int posYBomba;
  boolean hayBomba;
  int numero;
 int cantMinas;
  Tablero(int _cantCasillas) {
    cantCasillas = _cantCasillas;   
    casillas = new Casilla [cantCasillas][cantCasillas];    
    int tam = (width-25)/cantCasillas;    
    for (int i = 0; i < cantCasillas; i++) {
      for (int j = 0; j < cantCasillas; j++) {
        if (random(100)<20) {
          casillas[i][j] = new Casilla(i, j, tam, cantCasillas, new Bomba(i, j, tam));
        } else {
          casillas[i][j] = new Casilla(i, j, tam, cantCasillas);
        }
      }
    }
  }

  void dibujar() {
     for (int i=0; i<cantCasillas; i++) {
      for (int j=0; j<cantCasillas; j++) { 
        if (casillas[posX2][posY2].hayBomba(posX2, posY2)) {
          casillas[i][j].perdiste();
         
        } else {
          casillas[posX2][posY2].mostrar(i, j, posX2, posY2, cantMinas );
           if(posY2 >0){
          casillas[posX2][posY2-1].mostrar(i, j, posX2, posY2-1, cantMinas );
           }if(posY2 <13){
          casillas[posX2][posY2+1].mostrar(i, j, posX2, posY2+1, cantMinas );
          }
          if(posX2> 0){
          casillas[posX2-1][posY2].mostrar(i, j, posX2-1, posY2, cantMinas);
          if(posY2> 0 ){
          casillas[posX2-1][posY2-1].mostrar(i, j, posX2-1, posY2-1, cantMinas);
           
          }if(posY2 <13){
          casillas[posX2-1][posY2+1].mostrar(i, j, posX2-1, posY2+1, cantMinas);
          }
        }
          if(posX2 <13){
          casillas[posX2+1][posY2].mostrar(i, j, posX2+1, posY2, cantMinas);
          if(posY2> 0){
          casillas[posX2+1][posY2-1].mostrar(i, j, posX2+1, posY2-1, cantMinas);
          }if(posY2 <13){
          casillas[posX2+1][posY2+1].mostrar(i, j, posX2+1, posY2+1, cantMinas);
          }
          }
          }
          
          calcularCantidadMinas();
         
        }
      }
  }

void calcularCantidadMinas(){ 
   for(int i=0; i<cantCasillas; i++){
    for(int j=0; j<cantCasillas; j++){ 
     cantMinas = 0;
       if(posX2 >0 && posY2 >0){
       if(casillas[posX2-1][posY2-1].hayBomba(posX2-1,posY2-1)){
          cantMinas ++;
        
      }
       }if(posX2 >0){
        if(casillas[posX2-1][posY2].hayBomba(posX2-1, posY2)){
          cantMinas ++;
         
        }
      }
    
      if(posY2 <13 && posX2 >0){
       if(casillas[posX2-1][posY2+1].hayBomba(posX2-1, posY2+1)){
          cantMinas ++;
      
       }
     }
       
       if(posX2 <13 && posY2 >0){
       if(casillas[posX2+1][posY2-1].hayBomba(posX2+1, posY2-1)){
          cantMinas ++;
        
       }
     }if(posX2 <13){
       if(casillas[posX2+1][posY2].hayBomba(posX2+1, posY2)){
          cantMinas ++;
       
       }      
     }if(posY2 <13){
     if(casillas[posX2][posY2+1].hayBomba(posX2, posY2+1)){
          cantMinas ++;
          
       }
     }if(posY2 <13 && posX2 <13){
       if(casillas[posX2+1][posY2+1].hayBomba(posX2+1, posY2+1)){
          cantMinas ++;
         
       }
     }if(posY2 >0){
       if(casillas[posX2][posY2-1].hayBomba(posX2, posY2-1)){
          cantMinas ++;
      
       }    
     }      
    /*
    casillas[i][j].tieneXMinasAlrededor(cantMinas); 
    */
    }
   }
}
  void mousePresionado() { 
    posX2 = floor(map(mouseX, 15, 313, 0, cantCasillas));
    posY2 = floor(map(mouseY, 100, 397, 0, cantCasillas));
   
  }
}
