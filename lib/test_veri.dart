import 'package:bilgi_testi_uyg/soru.dart';

class TestVeri{

  int _soruIndex=0;

  List<Soru> _soruBankasi=[
    Soru("Titanic gelmiş geçmiş en büyük gemidir", false),
    Soru( "Dünyadaki tavuk sayısı insan sayısından fazladır",true),
    Soru("Kelebeklerin ömrü bir gündür", false),
    Soru("Dünya düzdür", false),
    Soru("Kaju fıstığı aslında bir meyvenin sapıdır",false),
  ];


  String getSoruMetni(){
    return _soruBankasi[_soruIndex].soruMetni;
  }

  bool getSoruYaniti(){
    return _soruBankasi[_soruIndex].soruYaniti;
  }

  void sonrakiSoru(){
    if(_soruIndex<_soruBankasi.length-1){
      _soruIndex++;
    }
  }

  void testiSifirla(){
    _soruIndex=0;
  }

  bool testBittiMi(){
    if(_soruIndex==_soruBankasi.length-1){
      return true;
    }else{
      return false;
    }
  }

}

