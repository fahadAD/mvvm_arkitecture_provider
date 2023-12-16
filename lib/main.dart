import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_class_3/Utils/Routes/routes_names.dart';
import 'package:provider_class_3/main1.dart';

import 'Utils/Routes/routes.dart';
import 'View/login_view.dart';
import 'ViewModel/authview_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
         ChangeNotifierProvider(create: (context) => AuthViewModelProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesNames.login,
        onGenerateRoute: Routes.generateRoute,
      ),
    );

  }
}
