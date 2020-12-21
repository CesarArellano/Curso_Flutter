void main () async{
  // Código Asíncrono -> Benéfico para teléfonos de gama baja.
  /* 
  sleep().then((String text){
    print(text); 
  });
  */
  final String text = await sleep();
  print(text);
}
Future<String> sleep(){
  return Future.delayed(Duration(seconds:3), () => "Await");
}