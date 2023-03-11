class Doctor{
  String? name;
  String? token;
  void cloneData(Map<String,dynamic> data){


    name=data['name'];
    token=data['token'];

  }

}