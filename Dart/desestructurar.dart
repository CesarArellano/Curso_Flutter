void main (){
  //Destructurar elementos.
  
  List<int> numbers = [1,2,3,4];
  numbers = [...numbers,5,6,7];
  //numbers.insertAll(0,[5,6]);
  print(numbers);
  
  Map<String,dynamic> data = {
    "name": "César"
  };
  
  data = {...data, "lastName": "Arellano"};
  
  print(data);
  
}