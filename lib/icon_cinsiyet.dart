import 'package:flutter/material.dart';
import 'package:live_expectancy/constant.dart';

class IconCinsiyet extends StatelessWidget {
  final IconData? icon;
  final String cinsiyet;
  IconCinsiyet({this.icon, this.cinsiyet = ''});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 50,
          color: Colors.black54,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          cinsiyet,
          style:kMetinStil,)
      ],
    );
  }
}
