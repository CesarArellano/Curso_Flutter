void main() {
  printTextWithNumber("My age", age:20, hasJob:true);
}
​
void printTextWithNumber(String text, { int age = 0, bool hasJob}){
  print("$text: $age");
  
  if(hasJob != null && hasJob == true){
    print("Good");
  }
