import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_class_3/Utils/Routes/routes_names.dart';
import 'package:provider_class_3/View/home_screen.dart';
import 'package:provider_class_3/View/login_view.dart';
import 'package:provider_class_3/View/registration_view.dart';

class Routes{
   static Route<dynamic> generateRoute(RouteSettings settings){
     switch(settings.name){
       case RoutesNames.home:return MaterialPageRoute(builder: (BuildContext context) => HomesScreen(),);
       case RoutesNames.login:return MaterialPageRoute(builder: (BuildContext context) => LoginView(),);
       case RoutesNames.registrations:return MaterialPageRoute(builder: (BuildContext context) => RegistrationView(),);

       default:return MaterialPageRoute(builder: (context) {
      return const Scaffold(
        body:  Center(child: Text("no routes define")),
      );
         },);


     }
   }
}