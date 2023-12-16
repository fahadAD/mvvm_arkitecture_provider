
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider_class_3/Repository/auth_repo.dart';

class AuthViewModelProvider extends  ChangeNotifier{
  final _authrepo=Authrepository();
   bool signloding=false;
   bool regloding=false;
   loginsetLoding(bool value){
     signloding=value;
     notifyListeners();
   }
  regsetLoding(bool value){
    regloding=value;
    notifyListeners();
  }
  Future<void> loginApi(dynamic data,BuildContext context)async {
     loginsetLoding(true);
    _authrepo.loginApi(data).then((value){
      loginsetLoding(false);
      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace){
      loginsetLoding(false);
      if(kDebugMode){
        print(error.toString());
      }

    });
  }

  Future<void> registrationApi(dynamic data,BuildContext context)async {
    regsetLoding(true);
    _authrepo.registerApi(data).then((value){
      regsetLoding(false);
      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace){
      regsetLoding(false);
      if(kDebugMode){
        print(error.toString());
      }

    });
  }
}