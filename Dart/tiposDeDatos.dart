void main() {
  // Números
  int number = 15;
  double pi = 3.14159;
  print(number+pi);
  
  // Cadenas
  String name = "César";
  String nameTwo = name;
  print(nameTwo);
  print("Mi nombre es: ${name[0]}");
  print(name[name.length-1]);
  
  //Booleanos
  
  bool activado = true;
  activado = !activado;
  print(activado);
  
  //Listas == Arreglos
  List<int> numeros = [1,2,3,4,5];
  print(numeros);
  numeros.add(8);
  print(numeros);
  
  //Listas con tamaño fijo no se puede usar el método add
  List masNumeros = List.generate(10,(value) => value);
  print(masNumeros);
}