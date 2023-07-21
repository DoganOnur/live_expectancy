import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_expectancy/constant.dart';
import 'container.dart';
import 'icon_cinsiyet.dart';

class Input extends StatefulWidget {
  const Input({Key? key}) : super(key: key);
  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  String tiklacinsiyet = '';
  double slider_sayac = 0;
  double slider_spor = 0;
  int boy = 170;
  int kilo=50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Yasam Beklentisi',
          style: GoogleFonts.satisfy(textStyle: TextStyle(fontSize: 35)),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: MyContainer(
                      child: buildRowOutlineButton('BOY'),
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                      child: buildRowOutlineButton('KİLO'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: MyContainer(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Haftada Kaç Gün Spor Yapıyorsunuz?',
                      style:
                          GoogleFonts.arima(textStyle: TextStyle(fontSize: 20)),
                    ),
                    Text(
                      ' ${slider_spor.toStringAsFixed(0)}',
                      style: kSayiStil,
                    ),
                    Slider(
                      min: 0,
                      max: 7,
                      divisions: 7,
                      value: slider_spor,
                      //divisions: 5,// 5 böldü
                      onChanged: (newValue) {
                        setState(() {
                          slider_spor = newValue;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: MyContainer(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Günde Kaç Sigara İçiyorsunuz?',
                      style:
                          GoogleFonts.arima(textStyle: TextStyle(fontSize: 25)),
                    ),
                    Text(
                      ' ${slider_sayac.toStringAsFixed(0)}',
                      style: kSayiStil,
                    ),
                    Slider(
                      max: 20,
                      value: slider_sayac,
                      //divisions: 5,// 5 böldü
                      onChanged: (newValue) {
                        setState(() {
                          slider_sayac = newValue;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MyContainer(
                      onPress: () {
                        setState(() {
                          tiklacinsiyet = 'KADIN';
                        });
                      },
                      renk: tiklacinsiyet == 'KADIN'
                          ? Colors.black54
                          : Colors.white,
                      child: IconCinsiyet(
                          cinsiyet: 'KADIN', icon: FontAwesomeIcons.venus),
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                      onPress: () {
                        setState(() {
                          tiklacinsiyet = 'ERKEK';
                        });
                      },
                      renk: tiklacinsiyet == 'ERKEK'
                          ? Colors.black54
                          : Colors.white,
                      child: IconCinsiyet(
                          cinsiyet: 'ERKEK', icon: FontAwesomeIcons.mars),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black54,
        height: 50,
        child: Center(
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Korkma hesapla gitsin!',
              style: GoogleFonts.tapestry(
                  textStyle: TextStyle(color: Colors.white, fontSize: 25)),
            ),
          ),
        ),
      ),
    );
  }

  Row buildRowOutlineButton(String metin) {
    return Row(
                      //mainAxisSize: MainAxisSize.min,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RotatedBox(
                              quarterTurns: -1,
                              child: Text(metin, style: kMetinStil)),
                        ),
                        RotatedBox(
                            quarterTurns: -1,
                            child: Text(metin=='BOY'?boy.toString():kilo.toString(), style: kSayiStil)),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    metin=='BOY'?boy++:kilo++;
                                  });
                                },
                                child: Icon(FontAwesomeIcons.plus),
                                style: OutlinedButton.styleFrom(
                                  minimumSize: Size(30.0, 40.0),
                                  //padding: EdgeInsets.zero, // Buton içeriği ile kenarlık arasındaki boşluğu kaldırır
                                  side: BorderSide(color: Colors.lightBlue),
                                ),
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    metin=='BOY'?boy--:kilo--;
                                  });
                                },
                                child: Icon(FontAwesomeIcons.minus),
                                style: OutlinedButton.styleFrom(
                                  minimumSize: Size(30.0,40.0),
                                  //padding: EdgeInsets.zero, // Buton içeriği ile kenarlık arasındaki boşluğu kaldırır
                               side: BorderSide(color: Colors.lightBlue),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
  }
}
