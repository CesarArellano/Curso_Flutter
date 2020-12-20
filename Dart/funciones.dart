void main (){
  double result = sum(3,10);
  String name = "César";
  
  printText(name);
  print(result);
  print(getMyCurrentDate());
}

double sum(double num1, double num2){
  return num1/num2;
}

void printText(String text){
  print(text);
}

//Dato de tipo DateTime - Función tipo flecha
DateTime getMyCurrentDate() => DateTime.now();
