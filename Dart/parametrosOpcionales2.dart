void main() {
  printTextWithNumber("My age", age:20, hasJob:true);
}

void printTextWithNumber(String text, { int age = 0, required bool hasJob}){
  print("$text: $age");
  
  if(hasJob == true){
    print("Good");
  }
}