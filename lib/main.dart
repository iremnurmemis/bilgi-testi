import 'package:bilgi_testi_uyg/constants.dart';
import 'package:bilgi_testi_uyg/test_veri.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BilgiTesti());
}

class BilgiTesti extends StatelessWidget {
  const BilgiTesti({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[700],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SoruSayfasi(),
          ),
        ),
      ),
    );
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];

  TestVeri test_1 = TestVeri();

  void butonFonk(bool secilenButon) {
    if (test_1.testBittiMi() == true) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("BRAVO TESTİ BİTİRİNİZ"),
              actions: [
                FloatingActionButton(
                  child: Text("BAŞA DÖN"),
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      test_1.testiSifirla();
                      secimler = [];
                    });
                  },
                ),
              ],
            );
          });
    } else {
      setState(() {
        test_1.getSoruYaniti() == secilenButon
            ? secimler.add(kDogruIconu)
            : secimler.add(kYanlisIconu);
        test_1.sonrakiSoru();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                test_1.getSoruMetni(),
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Wrap(
          runSpacing: 5.0,
          spacing: 5.0,
          children: secimler,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.0),
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.red)),
                      child: Icon(
                        Icons.thumb_down,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        butonFonk(false);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.0),
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.green)),
                      child: Icon(
                        Icons.thumb_up,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        butonFonk(true);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
