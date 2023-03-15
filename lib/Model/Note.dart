class Note{
  String? date;
  String? note;


  void cloneData(Map<String,dynamic> data){
    this.date=data['date'];
    this.note=data['note'];
  }
}