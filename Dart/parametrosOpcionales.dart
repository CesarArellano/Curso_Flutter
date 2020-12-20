void main (){
  
  DateTime d1 = DateTime.now();
  DateTime d2 = DateTime.utc(2020,1,1);
  
  String result = getDiff(d1,d2,useDays: true);
  print(result);
}

String getDiff(DateTime date1, DateTime date2, { bool useDays = false, bool useMinutes = false }){
  String text = "";
  Duration diff = date1.difference(date2);
  if(useDays){
    text += "In Days: ${ diff.inDays }";
  }
  if(useMinutes){
    text += " In Minutes: ${ diff.inMinutes }";
  }
  return text;
}