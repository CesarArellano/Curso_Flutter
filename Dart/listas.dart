void main (){
  List<int> numbers = [0,1,2,3];
  numbers.add(4); //Agrega 4 en la lista.
  numbers[2] = 7; // Seteamos un número numero en la posición 2 de la lista.
  numbers.removeAt(0); // Eliminamos el elemento de la posición 0 de la lista.
  print(numbers);
  //Retorna una lista de números menores a 6;
  final tmp = numbers.where((int item) => item<6).toList();
  print(tmp);
  //Indica la posición del número que deseamos encontrar en la lista.
  final int index = numbers.indexWhere((int item) => item==4);
  print("Index: $index");
}