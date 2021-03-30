void main (){
  int age = 17;
  // Zero coditional
  String text = age >= 18 ? "Mayor de edad" : "Menor de Edad";
  print(text);
  
  // Null coditional
  dynamic name = null;
  //Si es null name tomará el texto "No definido".
  String result = name ?? 'No Definido';
  print(result);
  printText(name ?? "Es null");
  printText(name != null ? name : "Es null");
}

void printText(String text){
  print(text);
}