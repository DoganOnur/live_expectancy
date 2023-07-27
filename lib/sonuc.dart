import 'package:flutter/material.dart';
import 'class.dart';
import 'constant.dart';
class Sonuc extends StatelessWidget {
  final UserData _userData1;
  Sonuc(this._userData1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sonuç Değerlendirilmesi'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          /* Expanded(
              child: Center(
                child: Text(
                  'Sonuc Degeri: ${Hesap(_userData1).Hesaplama().toStringAsFixed(0)}',
                  style: kMetinStil,
                ),
              ),
            ),*/
            Expanded(
              flex: 6,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    child: Image.asset(
                      Hesap(_userData1).Hesaplama().toInt() > 70
                          ? yanit().gif[0]
                          : Hesap(_userData1).Hesaplama().toInt() > 50
                          ?yanit().gif[1]
                          :yanit().gif[2],
                      width: 350,
                      height: 350,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex:5 ,
              child: Container(
                //padding: EdgeInsets.all(25),
                margin: EdgeInsets.all(35),

                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    Hesap(_userData1).Hesaplama().toInt() > 70
                        ? yanit().yanitlar[0]
                        : Hesap(_userData1).Hesaplama().toInt() > 50
                        ? yanit().yanitlar[1]
                        : yanit().yanitlar[2],
                    style:kMetin,
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Geri Dön ',
                  style: kMetinStil,
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Renkler.White,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

