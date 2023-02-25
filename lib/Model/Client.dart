class Client {


  String? name;
  String? token;

  static final Client _singleton = Client._internal();



  factory Client({String? name, String?token}) {
    if(name!=null) {
      _singleton.name = name;
      _singleton.token= token;
    }
    return _singleton;
  }

  Client._internal();
}