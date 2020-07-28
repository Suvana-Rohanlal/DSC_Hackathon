// sign up new user
// edit user info
// get all businesses
import 'dart:convert' show json;
import 'package:http/http.dart' show get;
import 'package:xhasasmall/models/business.dart';



// will be populated with all businesses
List <Business>  all = [];

Future <List<Business>> fetchAll() async{
  String url = "https://crudcrud.com/api/b82c1da1f3704ca1992b6836cd39b856/business";
  
  var temp;

  final response = await get(url, headers: <String, String> {
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
    owner: tempOwner
    );



}