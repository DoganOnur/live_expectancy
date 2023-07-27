import 'package:flutter/material.dart';

class Renkler {
  static const Black = Colors.black;
  static const White = Colors.white;
  static const Blue = Colors.lightBlue;
  static const Yellow = Colors.yellow;
}

class UserData {
  String? tiklacinsiyet;
  double slider_sayac;
  double slider_spor;
  int boy;
  int kilo;
  UserData(
      {required this.kilo,
      required this.slider_sayac,
      required this.slider_spor,
      required this.tiklacinsiyet,
      required this.boy});
}

class Hesap {
  final UserData _userData;
  Hesap(this._userData);
  double Hesaplama() {
    double sonuc;
    sonuc = (_userData.slider_spor * _userData.slider_spor)+50;
    sonuc= sonuc-(_userData.slider_sayac)*3;
    sonuc = sonuc + (_userData.boy / _userData.kilo);
    if (_userData.tiklacinsiyet == 'KADIN') {
      return sonuc + 2;
    } else {
      return sonuc;
    }
  }
}

class yanit {
  List<String> yanitlar = [
    'Ohh Dostum!! Ömrün Baya Uzun. Hayatın Tadını Yaşa',
    'Korkma ömrün ortalama bir insan yaşamı kadar Rahatla daha çok var.Doya doya yaşa! :D',
    'Anın tadını yaşa doya doya yaşa. Hayatında yapabileceğim bütün her şeyi yap. Az kalmış olabilir ömrün:('
  ];

  List<String> gif = [
    'assets/images/uzun_omur.gif',
    'assets/images/mutlu.gif',
    'assets/images/mutsuz.gif',
  ];


}
