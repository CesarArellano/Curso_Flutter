void main (){
  //Key y Value
  Map<String,dynamic> person = {
    "name": "Darwin",
    "lastName": "Morocho",
    "age": 20
  };
  
  print(person['name']);
  
  Map<int,double> numbers = {
    0: 0.1,
    1: 0.2,
    2: 0.3
  };
  
  print(numbers);
  
  Map<String,dynamic> tmp = Map();
  tmp["name"] = "César";
  tmp["lastName"] = "Arellano";
  tmp["extra"] = {
    "isEnabled": true,
    "hasCar": false
  };
  
  print("Temp: $tmp");
  // Sustituye los valores de los atributos que se llamen igual.
  person.addAll(tmp); 
  print("new person: $person");
  
}