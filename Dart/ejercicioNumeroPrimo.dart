void main(){
  int num = 14;
  int contador;
  
  contador = calcularNumPrimo(num);
  
  if(contador == 2){
    print("El número es primo");
  }
  else{
    print("El número no es primo");
  }
}
  
int calcularNumPrimo(int num){
    int cont = 0;
    for(int i = 1; i <= num; i++){
      if(num%i == 0){
        cont += 1;
      }
    }
    return cont;
}