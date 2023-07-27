import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_expectancy/constant.dart';
import 'package:live_expectancy/class.dart';
import 'package:live_expectancy/sonuc.dart';
import 'container.dart';
import 'icon_cinsiyet.dart';

class Input_page extends StatefulWidget {
  //static String routeName = '/input_page';
  @override
  State<Input_page> createState() => _Input_pageState();
}

class _Input_pageState extends State<Input_page> {
  String tiklacinsiyet = '';
  double slider_sayac = 0;
  double slider_spor = 0;
  int boy = 170;
  int kilo = 50;

  //Kullanici kullanici = Kullanici(ad:'ONUR',yas: 25);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Yasam Beklentisi',
          style: font,
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
                    Expanded(
                      child: Text(
                        'Haftada Kaç Gün Spor Yapıyorsunuz?',
                        style: GoogleFonts.arima(
                            textStyle: TextStyle(fontSize: 20)),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        ' ${slider_spor.toStringAsFixed(0)}',
                        style: kSayiStil,
                      ),
                    ),
                    Expanded(
                      child: Slider(
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
                    Expanded(
                      child: Text(
                        'Günde Kaç Sigara İçiyorsunuz?',
                        style: GoogleFonts.arima(
                            textStyle: TextStyle(fontSize: 25)),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        ' ${slider_sayac.toStringAsFixed(0)}',
                        style: kSayiStil,
                      ),
                    ),
                    Expanded(
                      child: Slider(
                        max: 20,
                        value: slider_sayac,
                        //divisions: 5,// 5 bölenmesi
                        onChanged: (newValue) {
                          setState(() {
                            slider_sayac = newValue;
                          });
                        },
                      ),
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
                          ? Renkler.Blue
                          : Renkler.White,
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
                          ? Renkler.Blue
                          : Renkler.White,
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
        color: Renkler.Blue,
        height: 50,
        child: Center(
          child: TextButton(
            onPressed: () {
              //Navigator.push(context, MaterialPageRoute(builder: (context) => YeniSayfa(metin: 'Korkma Korkma Az Ömrün Kalmadı ''Daha Çok Yaşarsın Sen :)',)));
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Sonuc(
                    UserData(
                        kilo: kilo,
                        slider_spor: slider_spor,
                        slider_sayac: slider_sayac,
                        boy: boy,
                        tiklacinsiyet: tiklacinsiyet),
                  ),
                ),
              );
              //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => YeniSayfa()), (route) => false);// bundan sonra gideceği sayfa bir
              // önceki bütün sayfalar gitti o sayfa geri döndürmez.
            },
            child: Text(
              'Korkma Hesapla Gitsin!',
              style: tape,
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
              quarterTurns: -1, child: Text(metin, style: kMetinStil)),
        ),
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            metin == 'BOY' ? boy.toString() : kilo.toString(),
            style: kSayiStil,
            //labelText: 'Metin',
          ),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    metin == 'BOY' ? boy++ : kilo++;
                  });
                },
                child: Icon(icon2),
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(30.0, 40.0),
                  //padding: EdgeInsets.zero, // Buton içeriği ile kenarlık arasındaki boşluğu kaldırır
                  side: BorderSide(color: Renkler.Blue),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    metin == 'BOY' ? boy-- : kilo--;
                  });
                },
                child: Icon(icon),
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(30.0, 40.0),
                  //padding: EdgeInsets.zero, // Buton içeriği ile kenarlık arasındaki boşluğu kaldırır
                  side: BorderSide(color: Renkler.Blue),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
