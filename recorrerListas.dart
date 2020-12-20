void main (){
  List<String> names = ["César","Jaqui","Jairo","Ruls"];
  // Forma de recorrer 1
  for(int i = 0; i < names.length; i++){
    print(names[i]);
  }
  // Forma de recorrer 2
  names.forEach((String name){
    print(name);
  });
  // Forma de recorrer 3
  for(String item in names){
    print(item);
  }
}