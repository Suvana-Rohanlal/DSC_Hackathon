import 'models/business.dart';

import 'services/api.dart';

Future<void> main() async {
  List<Business> _temp = await fetchAll();
  
  

  for (int i = 0; i < _temp.length; i++) {
    print(_temp[i].getName());
  }
}

