import 'package:flutter/material.dart';

import '../Utils/Routes/routes_names.dart';
class HomesScreen extends StatelessWidget {
  const HomesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(),
      body: Center(
        child: TextButton(onPressed: () {
          Navigator.pushNamed(context, RoutesNames.login);
        }, child: Text("previus")),
      ),
    );
  }
}