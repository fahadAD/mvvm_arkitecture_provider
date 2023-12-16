import 'package:flutter/material.dart';
import 'package:provider_class_3/Res/all_colors.dart';
class RoundButton extends StatelessWidget {
 final String text;
 final bool loading;
 final VoidCallback onPress;

    RoundButton({super.key,required this.text,this.loading=false,required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          color: appColors.buttonColor,
          borderRadius: BorderRadius.circular(10)
        ),
         height: 40,width: 200,
        child: Center(child:loading? CircularProgressIndicator(color: Colors.white,): Text(text,style: TextStyle(color: appColors.whiteColor,fontWeight: FontWeight.bold),)),
      ),
    );
  }
}
