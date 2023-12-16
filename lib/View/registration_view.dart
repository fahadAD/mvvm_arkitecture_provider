import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_class_3/Res/all_colors.dart';
import 'package:provider_class_3/Res/round_button.dart';
import 'package:provider_class_3/Utils/Routes/routes_names.dart';
import 'package:provider_class_3/Utils/utils.dart';
import 'package:provider_class_3/View/home_screen.dart';

import '../ViewModel/authview_provider.dart';
class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {

  ValueNotifier<bool> _obsucerText=ValueNotifier<bool>(true);

  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordConmtroller=TextEditingController();
  FocusNode emailFocusNode=FocusNode();
  FocusNode passwordFocusNode=FocusNode();
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModelProvider>(
      builder: (context, value, child) {
        return Scaffold(

          appBar: AppBar(title: Text("Sign up")),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: TextFormField(
                    controller: _emailController,
                    focusNode: emailFocusNode,
                    onFieldSubmitted: (value) {
                      Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
                    },
                    decoration: InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),),
                ),
                SizedBox(height: 10,),

                ValueListenableBuilder(
                  valueListenable: _obsucerText,
                  builder: (context, value, child) {
                    return   Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: TextFormField(
                        obscureText: _obsucerText.value,
                        controller: _passwordConmtroller,
                        focusNode: passwordFocusNode,
                        decoration: InputDecoration(
                            suffixIcon: InkWell(
                                onTap: () {
                                  _obsucerText.value=!_obsucerText.value;
                                },child: Icon(_obsucerText.value?Icons.visibility_off_sharp:Icons.visibility)),
                            hintText: "Password",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),),
                    );
                  },),

                SizedBox(height: 20,),

                RoundButton(
                  loading: value.regloding,
                  text: "Text", onPress:  () {
                  if(_emailController.text.isEmpty){
                    Utils.flashBarerrormassage("enter email", context);
                  }else if(_passwordConmtroller.text.isEmpty){
                    Utils.flashBarerrormassage("enter password", context);
                  }else if(_passwordConmtroller.text.length<6){
                    Utils.flashBarerrormassage("minimum 6", context);
                  }else{
                    Map data={
                      "email":_emailController.text,
                      "password":_passwordConmtroller.text,
                    };
                    // value.loginApi(data,context);
                    value.registrationApi(data, context);
                    print("registration done");
                  }

                },),
                SizedBox(height: 20,),
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesNames.login);
                    },
                    child: Text("Already have An Account? Then Sign in")),

              ],
            ),
          ),
        );
      },);
  }
}
