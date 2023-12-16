import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{
 static tostMassage(String mssage){
    Fluttertoast.showToast(
      msg: mssage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.red,
        fontSize: 20.0
    );
  }

  static flashBarerrormassage(String massages,BuildContext context){
         showFlushbar(context: context,
         flushbar: Flushbar(message: massages,
           title: "Hey Ninja",
           titleColor: Colors.white,
            flushbarPosition: FlushbarPosition.TOP,
           flushbarStyle: FlushbarStyle.FLOATING,
           reverseAnimationCurve: Curves.decelerate,
           forwardAnimationCurve: Curves.elasticOut,
           backgroundColor: Colors.red,
           borderRadius: BorderRadius.circular(20),
           padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
           boxShadows: [BoxShadow(color: Colors.blue, offset: Offset(0.0, 2.0), blurRadius: 3.0)],
           backgroundGradient: LinearGradient(colors: [Colors.blueGrey, Colors.black]),
            duration: Duration(seconds: 4),
           icon: Icon(Icons.no_accounts),
         )..show(context),

       );
  }

  static snackBar(String massages,BuildContext context){
   return ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(

         backgroundColor: Colors.pink,
         duration: Duration(seconds: 3),
         content: Text(massages,))
   );
  }

 static fieldFocusChange(BuildContext context,FocusNode current,FocusNode nextFocus){
current.unfocus();
FocusScope.of(context).requestFocus(nextFocus);
 }
}