void main (){
  //Conditional member access ?
  
  Hero name = new Hero("Spiderman");
  // Si es null el objeto, no se llama el método printName.
  name.printName();
  print("fin");
}

class Hero {
  final String _name;
  Hero(this._name);
  
  printName(){
    print(_name);
  }
}
