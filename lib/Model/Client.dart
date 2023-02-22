class Client {


  String? name;

  static final Client _singleton = Client._internal();



  factory Client({String? name}) {
    if(name!=null)
      _singleton.name=name;
    return _singleton;
  }

  Client._internal();
}