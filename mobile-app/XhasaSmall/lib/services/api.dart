import 'dart:convert' show JsonEncoder, json;

import '../models/business.dart';
import 'package:http/http.dart';



// will be populated with all businesses
List <Business>  all = [];
String url = "https://crudcrud.com/api/b82c1da1f3704ca1992b6836cd39b856";

Future <List<Business>> fetchAll() async{
  String endpoint = "/business";
  String _url = url + endpoint;
  
  var temp;

  final response = await get(_url, headers: <String, String> {
    'Content-Type': 'application/json; charset=UTF-8',
  });

  temp = await json.decode(response.body);
    
  for (int i = 0; i <temp.length; i++ ) {
    all.add(jsonToBus(temp[i]));
  }

  List <Business> swop;
  swop = all;

  return swop;
  
}



Business jsonToBus(var dict){


  String tempName = dict["name"];
  String tempAbout = dict["about"];
  String tempContact = dict["contact"];
  String tempTag = dict["tag"];
  String tempOwner = dict["owner"];



  return new Business(
    name: tempName, 
    about: tempAbout, 
    contact: tempContact, 
    tag: tempTag, 
    owner: tempOwner,
    );

}


Future signUp (
  { 
    String name,
    String password,
    String email
  }
) async {

  String endpoint = "/users";
  String _url = url + endpoint;

  var response = await post(_url, headers:<String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    }, 
    body: JsonEncoder().convert(
      {
        "username": name,
        "password": password,
        "email": email,
        "type": 2,
      },
    ),
    
    );

  var temp = json.decode(response.body);

  if (response.statusCode >= 200 && response.statusCode < 300) {
    // save _uid to hive box
    print(temp['_id']);
    return true;
  }
  return false;
}


Future <bool> login(String usr, String psw) async{

  String endpoint = "/users";
  String _url = url + endpoint;
  
  
  final response = await get(_url, headers: <String, String> {
    'Content-Type': 'application/json; charset=UTF-8',
  });

  List<dynamic> temp = json.decode(response.body);
  
  for (int i = 0; i < temp.length; i++) {
    if (temp[i]['username'] == usr) {
      if (temp[i]['password'] == psw) {
        print("TRUE");
        return true;
      }
    } 
  }
  return false;
}