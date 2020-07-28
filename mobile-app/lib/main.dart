import 'models/business.dart';

import 'services/api.dart';

Future<void> main() async {
  List<Business> _temp = await fetchAll();
  
  for (int i = 0; i < _temp.length; i++) {
    print(_temp[i].getName());
  }
  // var temp2 = signUp(name: "Wesley2", email: "ron@fakemail.com", password: "p13");
  
  var status;
  status = await login("Wesley3", "p14");

  if (status) {
    //allow access
    print("ALLOW");
  }
  else {
    //don't
    print("DON'T");
  }
 
}

