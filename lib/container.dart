import 'package:flutter/material.dart';
class MyContainer extends StatelessWidget {
  final Color renk;
  final Widget? child;
  final void Function()? onPress;
  //constructor
  MyContainer({this.renk = Colors.white, this.child,this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(16),
          color: renk,
        ),
        child: child,
      ),
    );
  }
}