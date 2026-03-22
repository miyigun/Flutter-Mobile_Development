import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../main.dart';
import 'YeniGorevEkle.dart';

var alertStyle = AlertStyle(
  animationType: AnimationType.grow,
  isCloseButton: false,
  isOverlayTapDismiss: false,
  descStyle: TextStyle(fontSize: 18,color: Colors.black),
  descTextAlign: TextAlign.left,
  animationDuration: Duration(milliseconds: 400),
  alertBorder: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
    side: BorderSide(
      color: Colors.grey,
    ),
  ),
  titleStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
      color: Colors.black
  ),
  alertAlignment: Alignment.center,
);

var _checkedBugun = List.generate(1000, (index) => false);

enum gorevTarih { bugun, yarin, baskatarih}
var gosterilecekTarih=tarih;
String _popupselection='';
String _popupselection2='';
String _popupselection3='';
String _popupselection4='';
String _popupselection5='';
String _beceriIlk=beceriler.beceriAdlari[0];
List<String> iliskiliBeceriler = List<String>.generate(beceriler.beceriAdlari.length, (i) => beceriler.beceriAdlari[i]);

class yarinGorevListesi extends StatefulWidget {
  const yarinGorevListesi({Key? key}) : super(key: key);

  @override
  _yarinGorevListesiState createState() => _yarinGorevListesiState();
}

class _yarinGorevListesiState extends State<yarinGorevListesi>{
  Controller _controller = Get.find();

  void initState(){

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      if (_controller.yarinkiGorevSayisi.value==0)
        Fluttertoast.showToast(
            msg: 'Yarın göreviniz bulunmamaktadır...',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 12.0);
    });
  }

  @override

  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(200, 240, 240, 1.0),
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Column(
          crossAxisAlignment : CrossAxisAlignment.start,
          children: [
            Text('Yarın: '+DateFormat('dd/MM/yyyy').format(DateTime.parse(yarinTarih)),style: TextStyle(fontWeight: FontWeight.bold, fontSize:20)),
            Obx(() =>Text(_controller.yarinkiGorevSayisi.value.toString()+' görev var',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ))),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_task),
            //butona basıldığında ikonun rengi açık kırmızı renge döner
            splashColor: Colors.redAccent,
            onPressed: () {
              Get.to(() => YeniGorevEkle());
            },
          ),
        ],
      ),
      body: Obx(() => AnimationLimiter(
        child: ListView.builder(
          padding: const EdgeInsets.all(5.0),
          physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemCount: _controller.yarinkiGorevSayisi.value,
          itemBuilder: (context, index) {
            var ayristirilanMetin = [];
            String dosyaIcerik=_controller.yarinkiGorevler[index].tekrar;
            ayristirilanMetin = dosyaIcerik.split(" ");
            return AnimationConfiguration.staggeredList(
              position: index,
              delay: Duration(milliseconds: 100),
              child: SlideAnimation(
                duration: Duration(milliseconds: 2500),
                curve: Curves.fastLinearToSlowEaseIn,
                horizontalOffset: 30,
                verticalOffset: 300.0,
                child: FlipAnimation(
                  duration: Duration(milliseconds: 3000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  flipAxis: FlipAxis.y,
                  child: GestureDetector(
                    child: Row(
                      children: [
                        Card(
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(_w/75),
                            height: _w/1.80,
                            width: _w/1.20,
                            child: Row(
                              mainAxisAlignment : MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width: _w/1.28,
                                  child:  Column(
                                    crossAxisAlignment : CrossAxisAlignment.start,
                                    mainAxisAlignment:  MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        crossAxisAlignment : CrossAxisAlignment.start,
                                        children: [
                                          Column(children: [
                                            Row(children: [
                                              if(ayristirilanMetin[0]=='1' && ayristirilanMetin[1]=='kez') Text("1",style: TextStyle(fontWeight: FontWeight.bold))
                                              //Görev 1 den fazla tekrarlanıyorsa bu ekrana yansıtılıyor
                                              else if(ayristirilanMetin[0]!='1' && ayristirilanMetin[1]=='kez') Text(ayristirilanMetin[0],style: TextStyle(fontWeight: FontWeight.bold))
                                              else if (_controller.yarinkiGorevler[index].tekrar=='Her gün') Text("",style: TextStyle(fontWeight: FontWeight.bold))
                                              else if (_controller.yarinkiGorevler[index].tekrar=='Her hafta') Text("H",style: TextStyle(fontWeight: FontWeight.bold))
                                                else if (_controller.yarinkiGorevler[index].tekrar=='Her ay') Text("A",style: TextStyle(fontWeight: FontWeight.bold))
                                                  else if (_controller.yarinkiGorevler[index].tekrar=='Her yıl') Text("Y",style: TextStyle(fontWeight: FontWeight.bold))
                                                    else Text("H",style: TextStyle(fontWeight: FontWeight.bold)),

                                              if(ayristirilanMetin[0]=='1') Icon(Icons.refresh_outlined)
                                              else if(ayristirilanMetin[0]!='1' && ayristirilanMetin[1]=='kez') Icon(Icons.refresh_outlined)
                                              else if (_controller.yarinkiGorevler[index].tekrar=='Her gün') Icon(Icons.all_inclusive_outlined)
                                                else if (_controller.yarinkiGorevler[index].tekrar=='Her hafta') Icon(Icons.refresh_outlined)
                                                  else if (_controller.yarinkiGorevler[index].tekrar=='Her ay') Icon(Icons.refresh_outlined)
                                                    else if (_controller.yarinkiGorevler[index].tekrar=='Her yıl') Icon(Icons.refresh_outlined)
                                                      else Icon(Icons.refresh_outlined),
                                            ]),

                                            if (_controller.yarinkiGorevler[index].onem==1) CircleAvatar(backgroundColor: Colors.red,radius: 5.0,)
                                            else if (_controller.yarinkiGorevler[index].onem==2) CircleAvatar(backgroundColor: Colors.blue,radius: 5.0,)
                                            else if (_controller.yarinkiGorevler[index].onem==3) CircleAvatar(backgroundColor: Colors.green,radius: 5.0,)
                                            else if (_controller.yarinkiGorevler[index].onem==4) CircleAvatar(backgroundColor: Colors.brown,radius: 5.0,),

                                            for (int i=0;i<ayristirilanMetin.length;i++)
                                              if(ayristirilanMetin[i]=='Pt') Text("Pt",style: TextStyle(color: Colors.black, fontSize:7, fontWeight: FontWeight.bold))
                                              else if(ayristirilanMetin[i]=='Sa') Text("Sa",style: TextStyle(color: Colors.black, fontSize:7, fontWeight: FontWeight.bold))
                                              else if(ayristirilanMetin[i]=='Ça') Text("Ça",style: TextStyle(color: Colors.black, fontSize:7, fontWeight: FontWeight.bold))
                                                else if(ayristirilanMetin[i]=='Pe') Text("Pe",style: TextStyle(color: Colors.black, fontSize:7, fontWeight: FontWeight.bold))
                                                  else if(ayristirilanMetin[i]=='Cu') Text("Cu",style: TextStyle(color: Colors.black, fontSize:7, fontWeight: FontWeight.bold))
                                                    else if(ayristirilanMetin[i]=='Ct') Text("Ct",style: TextStyle(color: Colors.black, fontSize:7, fontWeight: FontWeight.bold))
                                                      else if(ayristirilanMetin[i]=='Pa') Text("Pa",style: TextStyle(color: Colors.black, fontSize:7, fontWeight: FontWeight.bold)),
                                          ]),


                                          SizedBox(width: _w/40),
                                          Column(
                                            mainAxisAlignment : MainAxisAlignment.spaceAround,
                                            crossAxisAlignment : CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: _w/1.50,
                                                child: Text(_controller.yarinkiGorevler[index].ad,style: TextStyle(color: Colors.black, fontSize:14, fontWeight: FontWeight.bold)),
                                              ),
                                              if (_controller.yarinkiGorevler[index].aciklama!='')
                                                Text(_controller.yarinkiGorevler[index].aciklama,style: TextStyle(color: Colors.black.withOpacity(.6), fontSize:12)),

                                              Text('Yarın',style: TextStyle(color: Colors.black.withOpacity(.4), fontSize:12)),

                                              if (_controller.yarinkiGorevler[index].aciklama=='')
                                                Text('',style: TextStyle(color: Colors.black, fontSize:12)),

                                              Text('',style: TextStyle(color: Colors.black, fontSize:12)),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: _w/4,
                                            height: _w/4,
                                            padding: EdgeInsets.symmetric(horizontal: _w/30,vertical: _w/65),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                color: Colors.black,
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: Column(
                                              crossAxisAlignment : CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    'Ödül\n',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize:14,
                                                        decoration: TextDecoration.underline,
                                                        fontWeight: FontWeight.bold
                                                    )),
                                                Text("TP: "+_controller.yarinkiGorevler[index].TP.toString(),style: TextStyle(color: Colors.black,fontSize:12)),
                                                Row(
                                                    children: [
                                                      Container(
                                                          width:_w/20,
                                                          height:_w/20,
                                                          decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                image: AssetImage('assets/images/gold.png'),
                                                                fit: BoxFit.fill,
                                                              ))),
                                                      Text("  "+_controller.yarinkiGorevler[index].altin.toString(),style: TextStyle(color: Colors.black,fontSize:12)),
                                                    ]
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: _w/10),
                                          Container(
                                            width: _w/2.5,
                                            height: _w/4,
                                            padding: EdgeInsets.symmetric(horizontal: _w/30,vertical: _w/65),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                color: Colors.black,
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: Column(
                                              crossAxisAlignment : CrossAxisAlignment.start,
                                              children: [
                                                Text('İlişkili Beceri\n',style: TextStyle(color: Colors.black, fontSize:14,decoration: TextDecoration.underline,fontWeight: FontWeight.bold)),
                                                Text(_controller.yarinkiGorevler[index].beceri,style: TextStyle(color: Colors.black,fontSize:12)),
                                                Text("TP:  "+_controller.yarinkiGorevler[index].beceriTP.toString(),style: TextStyle(color: Colors.black,fontSize:12)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: _w/8.22,
                          height: _w/1.80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment : MainAxisAlignment.start,
                            crossAxisAlignment : CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                icon: Icon(Icons.done_outlined, color: Colors.green, size: 18),
                                onPressed: () {
                                  Alert(
                                      context: context,
                                      type: AlertType.none,
                                      style: alertStyle,
                                      title: 'Görev başarılı!\n'+_controller.yarinkiGorevler[index].ad+"\n",
                                      desc: "Ödül:\n"
                                          "+" + _controller.yarinkiGorevler[index].TP.toString()+" TP\n"+
                                          "+" + _controller.yarinkiGorevler[index].altin.toString()+" Altın\n\n"+
                                          "İlişkili Beceri:\n"+"+" +_controller.yarinkiGorevler[index].beceriTP.toString()+' '+_controller.yarinkiGorevler[index].beceri+"\n\n"+
                                          "Tekrar:\n"+_controller.yarinkiGorevler[index].tekrar,
                                      buttons: [
                                        DialogButton(
                                          child: Text(
                                            "TAMAM",
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 14),
                                          ),
                                          onPressed: () {

                                            WidgetsBinding.instance!.addPostFrameCallback((_) async {
                                              //Maalesef tek satırda eşitlenmiyor. Bu yolu bulmak için çok uğraştım :(
                                              int TP = _controller.yarinkiGorevler[index].TP;
                                              karakter.TP += TP;
                                              _controller.karakterTP.value=karakter.TP;
                                              int altin = _controller.yarinkiGorevler[index].altin;
                                              karakter.altin += altin;
                                              _controller.karakterAltin.value=karakter.altin;
                                              karakter.sonrakiSeviyeye -= TP;
                                              _controller.karakterSonrakiSeviyeye.value=karakter.sonrakiSeviyeye;

                                              //Başarılar kontrol ediliyor
                                              if (karakter.altin>=20 && karakter.basarilar[3].gosterildimi==0){
                                                setState(() {
                                                  int eldeEdilenBasariSayisi=_controller.eldeEdilenBasariSayisi.value;
                                                  eldeEdilenBasariSayisi++;
                                                  _controller.eldeEdilenBasariSayisi.value=eldeEdilenBasariSayisi;
                                                  karakter.TP+=1;
                                                  _controller.karakterTP.value=karakter.TP;
                                                  karakter.altin+=1;
                                                  _controller.karakterAltin.value=karakter.altin;
                                                  basarildimiKontrol[3]=true;
                                                });

                                                var basari1 = Basari(
                                                    no: 4,
                                                    basari: '20 altınınız oldu',
                                                    tarih: tarih,
                                                    basarildimi: 1,
                                                    TP: 1,
                                                    altin: 1,
                                                    gosterildimi: 1
                                                );

                                                await dosya.basariGuncelle(basari1);

                                                await dosya.basariListeOlustur().then((List tumBasarilar) async {
                                                  karakter.basariSayisi = tumBasarilar.length;
                                                  _controller.basariSayisi.value = tumBasarilar.length;
                                                  _controller.basarilar.value = tumBasarilar;
                                                  karakter.basarilar=tumBasarilar;
                                                });

                                                Alert(
                                                    context: context,
                                                    type: AlertType.none,
                                                    style: alertStyle,
                                                    title: "Tebrikler 1 başarı elde ettiniz!\n",
                                                    desc: DateFormat('dd/MM/yyyy').format(DateTime.parse(tarih))+"\n\n20 altınınız oldu!\n\n"+
                                                        "Ödülünüz:\n+1 TP\n+1 Altın",
                                                    buttons: [
                                                      DialogButton(
                                                        child: Text(
                                                          "TAMAM",
                                                          style: TextStyle(
                                                              color: Colors.white, fontSize: 14),
                                                        ),
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        color: Color.fromRGBO(0, 179, 134, 1.0),
                                                      ),
                                                    ]).show();
                                              }

                                              if (karakter.altin>=50 && karakter.basarilar[4].gosterildimi==0){
                                                setState(() {
                                                  int eldeEdilenBasariSayisi=_controller.eldeEdilenBasariSayisi.value;
                                                  eldeEdilenBasariSayisi++;
                                                  _controller.eldeEdilenBasariSayisi.value=eldeEdilenBasariSayisi;
                                                  karakter.TP+=1;
                                                  _controller.karakterTP.value=karakter.TP;
                                                  karakter.altin+=1;
                                                  _controller.karakterAltin.value=karakter.altin;
                                                  basarildimiKontrol[4]=true;
                                                });

                                                var basari1 = Basari(
                                                    no: 5,
                                                    basari: '50 altınınız oldu',
                                                    tarih: tarih,
                                                    basarildimi: 1,
                                                    TP: 1,
                                                    altin: 1,
                                                    gosterildimi: 1
                                                );

                                                await dosya.basariGuncelle(basari1);

                                                await dosya.basariListeOlustur().then((List tumBasarilar) async {
                                                  karakter.basariSayisi = tumBasarilar.length;
                                                  _controller.basariSayisi.value = tumBasarilar.length;
                                                  _controller.basarilar.value = tumBasarilar;
                                                  karakter.basarilar=tumBasarilar;
                                                });

                                                Alert(
                                                    context: context,
                                                    type: AlertType.none,
                                                    style: alertStyle,
                                                    title: "Tebrikler 1 başarı elde ettiniz!\n",
                                                    desc: DateFormat('dd/MM/yyyy').format(DateTime.parse(tarih))+"\n\n50 altınınız oldu!\n\n"+
                                                        "Ödülünüz:\n+1 TP\n+1 Altın",
                                                    buttons: [
                                                      DialogButton(
                                                        child: Text(
                                                          "TAMAM",
                                                          style: TextStyle(
                                                              color: Colors.white, fontSize: 14),
                                                        ),
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        color: Color.fromRGBO(0, 179, 134, 1.0),
                                                      ),
                                                    ]).show();
                                              }

                                              if (karakter.altin>=100 && karakter.basarilar[5].gosterildimi==0){
                                                setState(() {
                                                  int eldeEdilenBasariSayisi=_controller.eldeEdilenBasariSayisi.value;
                                                  eldeEdilenBasariSayisi++;
                                                  _controller.eldeEdilenBasariSayisi.value=eldeEdilenBasariSayisi;

                                                  karakter.TP+=2;
                                                  _controller.karakterTP.value=karakter.TP;
                                                  karakter.altin+=2;
                                                  _controller.karakterAltin.value=karakter.altin;
                                                  basarildimiKontrol[5]=true;
                                                });

                                                var basari1 = Basari(
                                                    no: 6,
                                                    basari: '100 altınınız oldu',
                                                    tarih: tarih,
                                                    basarildimi: 1,
                                                    TP: 2,
                                                    altin: 2,
                                                    gosterildimi: 1
                                                );

                                                await dosya.basariGuncelle(basari1);

                                                await dosya.basariListeOlustur().then((List tumBasarilar) async {
                                                  karakter.basariSayisi = tumBasarilar.length;
                                                  _controller.basariSayisi.value = tumBasarilar.length;
                                                  _controller.basarilar.value = tumBasarilar;
                                                  karakter.basarilar=tumBasarilar;
                                                });

                                                Alert(
                                                    context: context,
                                                    type: AlertType.none,
                                                    style: alertStyle,
                                                    title: "Tebrikler 1 başarı elde ettiniz!\n",
                                                    desc: DateFormat('dd/MM/yyyy').format(DateTime.parse(tarih))+"\n\n100 altınınız oldu!\n\n"+
                                                        "Ödülünüz:\n+2 TP\n+2 Altın",
                                                    buttons: [
                                                      DialogButton(
                                                        child: Text(
                                                          "TAMAM",
                                                          style: TextStyle(
                                                              color: Colors.white, fontSize: 14),
                                                        ),
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        color: Color.fromRGBO(0, 179, 134, 1.0),
                                                      ),
                                                    ]).show();
                                              }

                                              //yeni seviye için 10x2+20 formülünü belirledim. Burada x->karakter.seviye yi gösteriyor
                                              if (karakter.TP>=(10*(karakter.seviye*karakter.seviye)+20)){
                                                karakter.seviye++;
                                                _controller.karakterSeviye.value=karakter.seviye;
                                                //Karakter.seviyenin durumuna göre karakter.durum belirleniyor
                                                int karakterDurum=_controller.karakterSeviye.value;

                                                if (karakterDurum==0) {
                                                  _controller.karakterDurum.value='Acemi';
                                                  karakter.durum='Acemi';
                                                }  else if (karakterDurum==2) {
                                                  _controller.karakterDurum.value='Çırak';
                                                  karakter.durum='Çırak';
                                                }else if (karakterDurum==4) {
                                                  _controller.karakterDurum.value='Becerikli';
                                                  karakter.durum='Becerikli';
                                                }else if (karakterDurum==6) {
                                                  _controller.karakterDurum.value='Uzman';
                                                  karakter.durum='Uzman';
                                                }else if (karakterDurum==8) {
                                                  _controller.karakterDurum.value='Usta';
                                                  karakter.durum='Usta';
                                                }
                                                //Yeni seviyeye geçilince sonrakiSeviyeye değişkenine yeni değer atanıyor
                                                karakter.sonrakiSeviyeye=(10*(karakter.seviye*karakter.seviye)+20)-karakter.TP;
                                                _controller.karakterSonrakiSeviyeye.value=karakter.sonrakiSeviyeye;

                                                //Karakterin seviyesinin arttığı diyalog penceresi ile belirtiliyor.
                                                Alert(
                                                    context: context,
                                                    type: AlertType.none,
                                                    style: alertStyle,
                                                    title: "Tebrikler!\n"+"Karakteriniz "+karakter.seviye.toString()+".seviye oldu!",
                                                    buttons: [
                                                      DialogButton(
                                                        child: Text(
                                                          "TAMAM",
                                                          style: TextStyle(
                                                              color: Colors.white, fontSize: 14),
                                                        ),
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        color: Color.fromRGBO(0, 179, 134, 1.0),
                                                      ),
                                                    ]).show();

                                                //Başarılar kontrol ediliyor
                                                if (karakter.seviye==2 && karakter.basarilar[0].gosterildimi==0){
                                                  setState(() {
                                                    int eldeEdilenBasariSayisi=_controller.eldeEdilenBasariSayisi.value;
                                                    eldeEdilenBasariSayisi++;
                                                    _controller.eldeEdilenBasariSayisi.value=eldeEdilenBasariSayisi;

                                                    karakter.TP+=2;
                                                    _controller.karakterTP.value=karakter.TP;
                                                    karakter.altin+=2;
                                                    _controller.karakterAltin.value=karakter.altin;
                                                    basarildimiKontrol[0]=true;
                                                  });

                                                  var basari1 = Basari(
                                                      no: 1,
                                                      basari: 'Karakter seviyeniz 2 oldu',
                                                      tarih: tarih,
                                                      basarildimi: 1,
                                                      TP: 2,
                                                      altin: 2,
                                                      gosterildimi: 1
                                                  );

                                                  await dosya.basariGuncelle(basari1);

                                                  await dosya.basariListeOlustur().then((List tumBasarilar) async {
                                                    karakter.basariSayisi = tumBasarilar.length;
                                                    _controller.basariSayisi.value = tumBasarilar.length;
                                                    _controller.basarilar.value = tumBasarilar;
                                                    karakter.basarilar=tumBasarilar;
                                                  });

                                                  Alert(
                                                      context: context,
                                                      type: AlertType.none,
                                                      style: alertStyle,
                                                      title: "Tebrikler 1 başarı elde ettiniz!\n",
                                                      desc: DateFormat('dd/MM/yyyy').format(DateTime.parse(tarih))+"\n\nKarakter seviyeniz 2 oldu!\n\n"+
                                                          "Ödülünüz:\n+2 TP\n+2 Altın",
                                                      buttons: [
                                                        DialogButton(
                                                          child: Text(
                                                            "TAMAM",
                                                            style: TextStyle(
                                                                color: Colors.white, fontSize: 14),
                                                          ),
                                                          onPressed: () {
                                                            Get.back();
                                                          },
                                                          color: Color.fromRGBO(0, 179, 134, 1.0),
                                                        ),
                                                      ]).show();
                                                }

                                                if (karakter.seviye==3 && karakter.basarilar[1].gosterildimi==0){
                                                  setState(() {
                                                    int eldeEdilenBasariSayisi=_controller.eldeEdilenBasariSayisi.value;
                                                    eldeEdilenBasariSayisi++;
                                                    _controller.eldeEdilenBasariSayisi.value=eldeEdilenBasariSayisi;

                                                    karakter.TP+=4;
                                                    _controller.karakterTP.value=karakter.TP;
                                                    karakter.altin+=4;
                                                    _controller.karakterAltin.value=karakter.altin;
                                                    basarildimiKontrol[1]=true;
                                                  });

                                                  var basari1 = Basari(
                                                      no: 2,
                                                      basari: 'Karakter seviyeniz 3 oldu',
                                                      tarih: tarih,
                                                      basarildimi: 1,
                                                      TP: 4,
                                                      altin: 4,
                                                      gosterildimi: 1
                                                  );

                                                  await dosya.basariGuncelle(basari1);

                                                  await dosya.basariListeOlustur().then((List tumBasarilar) async {
                                                    karakter.basariSayisi = tumBasarilar.length;
                                                    _controller.basariSayisi.value = tumBasarilar.length;
                                                    _controller.basarilar.value = tumBasarilar;
                                                    karakter.basarilar=tumBasarilar;
                                                  });

                                                  Alert(
                                                      context: context,
                                                      type: AlertType.none,
                                                      style: alertStyle,
                                                      title: "Tebrikler 1 başarı elde ettiniz!\n",
                                                      desc: DateFormat('dd/MM/yyyy').format(DateTime.parse(tarih))+"\n\nKarakter seviyeniz 3 oldu!\n\n"+
                                                          "Ödülünüz:\n+4 TP\n+4 Altın",
                                                      buttons: [
                                                        DialogButton(
                                                          child: Text(
                                                            "TAMAM",
                                                            style: TextStyle(
                                                                color: Colors.white, fontSize: 14),
                                                          ),
                                                          onPressed: () {
                                                            Get.back();
                                                          },
                                                          color: Color.fromRGBO(0, 179, 134, 1.0),
                                                        ),
                                                      ]).show();
                                                }

                                                if (karakter.seviye==4 && karakter.basarilar[2].gosterildimi==0){
                                                  setState(() {
                                                    int eldeEdilenBasariSayisi=_controller.eldeEdilenBasariSayisi.value;
                                                    eldeEdilenBasariSayisi++;
                                                    _controller.eldeEdilenBasariSayisi.value=eldeEdilenBasariSayisi;

                                                    karakter.TP+=4;
                                                    _controller.karakterTP.value=karakter.TP;
                                                    karakter.altin+=4;
                                                    _controller.karakterAltin.value=karakter.altin;
                                                    basarildimiKontrol[2]=true;
                                                  });

                                                  var basari1 = Basari(
                                                      no: 3,
                                                      basari: 'Karakter seviyeniz 4 oldu',
                                                      tarih: tarih,
                                                      basarildimi: 1,
                                                      TP: 4,
                                                      altin: 4,
                                                      gosterildimi: 1
                                                  );

                                                  await dosya.basariGuncelle(basari1);

                                                  await dosya.basariListeOlustur().then((List tumBasarilar) async {
                                                    karakter.basariSayisi = tumBasarilar.length;
                                                    _controller.basariSayisi.value = tumBasarilar.length;
                                                    _controller.basarilar.value = tumBasarilar;
                                                    karakter.basarilar=tumBasarilar;
                                                  });

                                                  Alert(
                                                      context: context,
                                                      type: AlertType.none,
                                                      style: alertStyle,
                                                      title: "Tebrikler 1 başarı elde ettiniz!\n",
                                                      desc: DateFormat('dd/MM/yyyy').format(DateTime.parse(tarih))+"\n\nKarakter seviyeniz 4 oldu!\n\n"+
                                                          "Ödülünüz:\n+4 TP\n+4 Altın",
                                                      buttons: [
                                                        DialogButton(
                                                          child: Text(
                                                            "TAMAM",
                                                            style: TextStyle(
                                                                color: Colors.white, fontSize: 14),
                                                          ),
                                                          onPressed: () {
                                                            Get.back();
                                                          },
                                                          color: Color.fromRGBO(0, 179, 134, 1.0),
                                                        ),
                                                      ]).show();
                                                }

                                              }

                                              //Değişiklikler karakter dosyasına kaydediliyor
                                              yazdirilacak = karakter.ad +
                                                  "\n" +
                                                  karakter.durum +
                                                  "\n" +
                                                  karakter.seviye.toString() +
                                                  "\n" +
                                                  karakter.sonrakiSeviyeye.toString() +
                                                  "\n" +
                                                  karakter.TP.toString() +
                                                  "\n" +
                                                  karakter.altin.toString() +
                                                  "\n" +
                                                  karakter.avatar.toString() +
                                                  "\n" +
                                                  karakter.avatarRenk.toString() +
                                                  "\n";
                                              await dosya.KadosyayaYaz(yazdirilacak);

                                              //Beceri seviyesi arttırılarak veritabanına kaydediliyor. Ardından tekrar okunarak değişkenlere aktarılıyor
                                              String beceri = _controller.yarinkiGorevler[index].beceri;
                                              int beceriTP = _controller.yarinkiGorevler[index].beceriTP;
                                              int becerininVeriTabanindakiIndeksi = beceriler.beceriAdlari.indexOf(beceri);
                                              int arttirilmisBeceriDegeri = beceriler.beceriTP[becerininVeriTabanindakiIndeksi] + beceriTP;
                                              beceriler.beceriTP[becerininVeriTabanindakiIndeksi]=arttirilmisBeceriDegeri;
                                              int beceriSeviye=_controller.beceriler[becerininVeriTabanindakiIndeksi].seviye;

                                              //beceriTP için seviye formülü 2x2+3
                                              if (arttirilmisBeceriDegeri>=5*(beceriSeviye*beceriSeviye)+5) {
                                                beceriSeviye++;

                                                Alert(
                                                    context: context,
                                                    type: AlertType.none,
                                                    style: alertStyle,
                                                    title: "Tebrikler!\n'"+beceri+"' beceriniz "+beceriSeviye.toString()+".seviye oldu!",
                                                    buttons: [
                                                      DialogButton(
                                                        child: Text(
                                                          "TAMAM",
                                                          style: TextStyle(
                                                              color: Colors.white, fontSize: 14),
                                                        ),
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        color: Color.fromRGBO(0, 179, 134, 1.0),
                                                      ),
                                                    ]).show();
                                              }

                                              try {
                                                var beceri1 = Beceri(
                                                    ad: beceri,
                                                    seviye: beceriSeviye,
                                                    beceriTP: arttirilmisBeceriDegeri
                                                );

                                                await dosya.beceriGuncelle(beceri1);
                                              } catch (e) {
                                                print("beceri güncellenemedi");
                                              };

                                              try{
                                                //Görev seçildiğinde görev yapildi diye veritabanına kaydediliyor
                                                var gorev = Gorevler(
                                                  no: _controller.yarinkiGorevler[index].no,
                                                  ad: _controller.yarinkiGorevler[index].ad,
                                                  aciklama:_controller.yarinkiGorevler[index].aciklama,
                                                  tarih: _controller.yarinkiGorevler[index]
                                                      .tarih,
                                                  tekrar: _controller.yarinkiGorevler[index].tekrar,
                                                  yapildi: "Evet",
                                                  basariDurumu: 'Başarılı',
                                                  altin: _controller.yarinkiGorevler[index]
                                                      .altin,
                                                  TP: _controller.yarinkiGorevler[index].TP,
                                                  beceriTP: _controller.yarinkiGorevler[index].beceriTP,
                                                  beceri: _controller.yarinkiGorevler[index]
                                                      .beceri,
                                                  onem: _controller.yarinkiGorevler[index]
                                                      .onem,);

                                                await dosya.gorevGuncelle(gorev);
                                              } catch (e) {
                                                print("Görev güncellenemedi");
                                              }
                                              try{
                                                //Veri tabanındaki görev numaraları belirleniyor
                                                var gorevNumaralari=[];
                                                int enBuyukKayitNo=karakter.tumGorevSayisi;
                                                await dosya.gorevListeOlustur().then((List tumGorevler) async {
                                                  setState(() {
                                                    karakter.tumGorevSayisi = tumGorevler.length;

                                                    //Veritabanında yapılan kayıtların numaraları yazılma-silinmeden dolayı değişiyor.İlkönce onları tespit ediyoruz.
                                                    for (int i = 0; i < karakter.tumGorevSayisi; i++) {
                                                      gorevNumaralari.add(tumGorevler[i].no);
                                                    }
                                                    //En büyük kayıt numarası tespit ediliyor

                                                    for (int i = 0; i < karakter.tumGorevSayisi; i++)
                                                      if (enBuyukKayitNo < gorevNumaralari[i])
                                                        enBuyukKayitNo = gorevNumaralari[i];
                                                  });

                                                });
                                                //Eğer görevin tekrar durumu "Her gün" ise yarın için de aynı görev kaydediliyor
                                                if (_controller.yarinkiGorevler[index].tekrar=="Her gün"){
                                                  //Veritabanına DateTime formatında kaydediyoruz
                                                  //Bu sayede tarihe ekleme-çıkarmayı rahatlıkla yapabiliyoruz
                                                  String t=_controller.yarinkiGorevler[index].tarih;
                                                  DateTime dt=DateTime.parse(t).add(Duration(days: 1));
                                                  //Tarih formatını 'dd-MM-yyyy' yazınca çalışmıyor :( Gün ekleme çalışmıyor
                                                  String dtTarih =DateFormat('yyyy-MM-dd').format(dt);

                                                  var gorev = Gorevler(
                                                    no: enBuyukKayitNo+1,
                                                    ad: _controller.yarinkiGorevler[index].ad,
                                                    aciklama:_controller.yarinkiGorevler[index].aciklama,
                                                    tarih: dtTarih,
                                                    tekrar: _controller.yarinkiGorevler[index].tekrar,
                                                    yapildi: "Hayır",
                                                    basariDurumu: '',
                                                    altin: _controller.yarinkiGorevler[index]
                                                        .altin,
                                                    TP: _controller.yarinkiGorevler[index].TP,
                                                    beceriTP: _controller.yarinkiGorevler[index].beceriTP,
                                                    beceri: _controller.yarinkiGorevler[index]
                                                        .beceri,
                                                    onem: _controller.yarinkiGorevler[index]
                                                        .onem,);

                                                  await dosya.gorevEkle(gorev);
                                                }

                                                //Eğer görevin tekrar durumu "Her hafta" ise gelecek hafta için de aynı görev kaydediliyor
                                                else if (_controller.yarinkiGorevler[index].tekrar=="Her hafta"){
                                                  //Veritabanına DateTime formatında kaydediyoruz
                                                  //Bu sayede tarihe ekleme-çıkarmayı rahatlıkla yapabiliyoruz
                                                  String t=_controller.yarinkiGorevler[index].tarih;
                                                  DateTime dt=DateTime.parse(t).add(Duration(days: 7));
                                                  String dtTarih =DateFormat('yyyy-MM-dd').format(dt);

                                                  var gorev = Gorevler(
                                                    no: enBuyukKayitNo+1,
                                                    ad: _controller.yarinkiGorevler[index].ad,
                                                    aciklama:_controller.yarinkiGorevler[index].aciklama,
                                                    tarih: dtTarih,
                                                    tekrar: _controller.yarinkiGorevler[index].tekrar,
                                                    yapildi: "Hayır",
                                                    basariDurumu: '',
                                                    altin: _controller.yarinkiGorevler[index]
                                                        .altin,
                                                    TP: _controller.yarinkiGorevler[index].TP,
                                                    beceriTP: _controller.yarinkiGorevler[index].beceriTP,
                                                    beceri: _controller.yarinkiGorevler[index]
                                                        .beceri,
                                                    onem: _controller.yarinkiGorevler[index]
                                                        .onem,);
                                                  await dosya.gorevEkle(gorev);
                                                }

                                                //Eğer görevin tekrar durumu "Her ay" ise gelecek hafta için de aynı görev kaydediliyor
                                                else if (_controller.yarinkiGorevler[index].tekrar=="Her ay"){
                                                  //Veritabanına DateTime formatında kaydediyoruz
                                                  //Bu sayede tarihe ekleme-çıkarmayı rahatlıkla yapabiliyoruz
                                                  String t=_controller.yarinkiGorevler[index].tarih;
                                                  DateTime dt=DateTime.parse(t).add(Duration(days: 30));
                                                  String dtTarih =DateFormat('yyyy-MM-dd').format(dt);

                                                  var gorev = Gorevler(
                                                    no: enBuyukKayitNo+1,
                                                    ad: _controller.yarinkiGorevler[index].ad,
                                                    aciklama:_controller.yarinkiGorevler[index].aciklama,
                                                    tarih: dtTarih,
                                                    tekrar: _controller.yarinkiGorevler[index].tekrar,
                                                    yapildi: "Hayır",
                                                    basariDurumu: '',
                                                    altin: _controller.yarinkiGorevler[index]
                                                        .altin,
                                                    TP: _controller.yarinkiGorevler[index].TP,
                                                    beceriTP: _controller.yarinkiGorevler[index].beceriTP,
                                                    beceri: _controller.yarinkiGorevler[index]
                                                        .beceri,
                                                    onem: _controller.yarinkiGorevler[index]
                                                        .onem,);
                                                  await dosya.gorevEkle(gorev);
                                                }

                                                //Eğer görevin tekrar durumu "Her yıl" ise gelecek hafta için de aynı görev kaydediliyor
                                                else if (_controller.yarinkiGorevler[index].tekrar=="Her yıl"){
                                                  //Veritabanına DateTime formatında kaydediyoruz
                                                  //Bu sayede tarihe ekleme-çıkarmayı rahatlıkla yapabiliyoruz
                                                  String t=_controller.yarinkiGorevler[index].tarih;
                                                  DateTime dt=DateTime.parse(t).add(Duration(days: 365));
                                                  String dtTarih =DateFormat('yyyy-MM-dd').format(dt);

                                                  var gorev = Gorevler(
                                                    no: enBuyukKayitNo+1,
                                                    ad: _controller.yarinkiGorevler[index].ad,
                                                    aciklama:_controller.yarinkiGorevler[index].aciklama,
                                                    tarih: dtTarih,
                                                    tekrar: _controller.yarinkiGorevler[index].tekrar,
                                                    yapildi: "Hayır",
                                                    basariDurumu: '',
                                                    altin: _controller.yarinkiGorevler[index]
                                                        .altin,
                                                    TP: _controller.yarinkiGorevler[index].TP,
                                                    beceriTP: _controller.yarinkiGorevler[index].beceriTP,
                                                    beceri: _controller.yarinkiGorevler[index]
                                                        .beceri,
                                                    onem: _controller.yarinkiGorevler[index]
                                                        .onem,);
                                                  await dosya.gorevEkle(gorev);
                                                }

                                                else if (ayristirilanMetin[0]!='1' && ayristirilanMetin[1]=='kez'){
                                                  int deger=int.parse(ayristirilanMetin[0])-1;
                                                  //Veritabanına DateTime formatında kaydediyoruz
                                                  //Bu sayede tarihe ekleme-çıkarmayı rahatlıkla yapabiliyoruz
                                                  String t=_controller.yarinkiGorevler[index].tarih;
                                                  DateTime dt=DateTime.parse(t).add(Duration(days: 1));
                                                  String dtTarih =DateFormat('yyyy-MM-dd').format(dt);

                                                  if (deger!=0){
                                                    //Veri tabanındaki görev numaraları belirleniyor
                                                    var gorevNumaralari=[];
                                                    int enBuyukKayitNo=karakter.yarinkiGorevSayisi;
                                                    await dosya.gorevListeOlustur().then((List yarinkiGorevler) async {
                                                      setState(() {
                                                        karakter.yarinkiGorevSayisi = yarinkiGorevler.length;
                                                        //Veritabanında yapılan kayıtların numaraları yazılma-silinmeden dolayı değişiyor.İlkönce onları tespit ediyoruz.
                                                        for (int i = 0; i < karakter.yarinkiGorevSayisi; i++) {
                                                          gorevNumaralari.add(yarinkiGorevler[i].no);
                                                        }
                                                        //En büyük kayıt numarası tespit ediliyor
                                                        for (int i = 0; i < karakter.yarinkiGorevSayisi; i++)
                                                          if (enBuyukKayitNo < gorevNumaralari[i]) enBuyukKayitNo = gorevNumaralari[i];
                                                      });

                                                    });

                                                    var gorev = Gorevler(
                                                      no: enBuyukKayitNo+1,
                                                      ad: _controller.yarinkiGorevler[index].ad,
                                                      aciklama:_controller.yarinkiGorevler[index].aciklama,
                                                      tarih: dtTarih,
                                                      tekrar: deger.toString()+' kez',
                                                      yapildi: "Hayır",
                                                      basariDurumu: '',
                                                      altin: _controller.yarinkiGorevler[index].altin,
                                                      TP: _controller.yarinkiGorevler[index].TP,
                                                      beceriTP: _controller.yarinkiGorevler[index].beceriTP,
                                                      beceri: _controller.yarinkiGorevler[index].beceri,
                                                      onem: _controller.yarinkiGorevler[index].onem,);
                                                    await dosya.gorevEkle(gorev);
                                                  }
                                                }
                                                else if(ayristirilanMetin[0]=='Pt' || ayristirilanMetin[0]=='Sa' || ayristirilanMetin[0]=='Ça' || ayristirilanMetin[0]=='Pe' || ayristirilanMetin[0]=='Cu' || ayristirilanMetin[0]=='Ct' || ayristirilanMetin[0]=='Pa'){
                                                  //tarih öğesi sayısal formata çevriliyor
                                                  DateTime t=DateTime.parse(_controller.yarinkiGorevler[index].tarih);
                                                  int kacinciGun=t.weekday;
                                                  //ayristirilan metin sayısal formata dönüştürülüyor
                                                  List<int> gunler=[];
                                                  for(int i=0;i<ayristirilanMetin.length;i++){
                                                    if(ayristirilanMetin[i]=='Pt') gunler.add(1);
                                                    else if(ayristirilanMetin[i]=='Sa') gunler.add(2);
                                                    else if(ayristirilanMetin[i]=='Ça') gunler.add(3);
                                                    else if(ayristirilanMetin[i]=='Pe') gunler.add(4);
                                                    else if(ayristirilanMetin[i]=='Cu') gunler.add(5);
                                                    else if(ayristirilanMetin[i]=='Ct') gunler.add(6);
                                                    else if(ayristirilanMetin[i]=='Pa') gunler.add(7);
                                                  }
                                                  //t den daha büyük en yakın bir haftanın günü var mı tespit ediliyor
                                                  int belirliGun=int.parse(kacinciGun.toString());
                                                  bool olumlu=false;
                                                  for(int sayac=1;belirliGun+sayac<=7;sayac++)
                                                    for(int i=0;i<gunler.length;i++){
                                                      if(belirliGun+sayac==gunler[i]) {
                                                        //bulunan gün ile belirli gün arasındaki gün farkı belirlenip tarihte o kadar ileriye gidiliyor
                                                        String ta=_controller.yarinkiGorevler[index].tarih;
                                                        int eklenenGun= gunler[i]-belirliGun;
                                                        DateTime dt=DateTime.parse(ta).add(Duration(days: eklenenGun));
                                                        //Tarih formatını 'dd-MM-yyyy' yazınca çalışmıyor :( Gün ekleme çalışmıyor
                                                        String dtTarih =DateFormat('yyyy-MM-dd').format(dt);
                                                        //Veri tabanındaki görev numaraları belirleniyor
                                                        var gorevNumaralari=[];
                                                        int enBuyukKayitNo=karakter.yarinkiGorevSayisi;
                                                        await dosya.gorevListeOlustur().then((List yarinkiGorevler) async {
                                                          setState(() {
                                                            karakter.yarinkiGorevSayisi = yarinkiGorevler.length;
                                                            //Veritabanında yapılan kayıtların numaraları yazılma-silinmeden dolayı değişiyor.İlkönce onları tespit ediyoruz.
                                                            for (int i = 0; i < karakter.yarinkiGorevSayisi; i++) {
                                                              gorevNumaralari.add(yarinkiGorevler[i].no);
                                                            }
                                                            //En büyük kayıt numarası tespit ediliyor
                                                            for (int i = 0; i < karakter.yarinkiGorevSayisi; i++)
                                                              if (enBuyukKayitNo < gorevNumaralari[i]) enBuyukKayitNo = gorevNumaralari[i];
                                                          });

                                                        });

                                                        var gorev = Gorevler(
                                                            no: enBuyukKayitNo+1,
                                                            ad: _controller.yarinkiGorevler[index].ad,
                                                            aciklama:_controller.yarinkiGorevler[index].aciklama,
                                                            tarih: dtTarih,
                                                            tekrar: _controller.yarinkiGorevler[index].tekrar,
                                                            yapildi: "Hayır",
                                                            basariDurumu: '',
                                                            altin: _controller.yarinkiGorevler[index].altin,
                                                            TP: _controller.yarinkiGorevler[index].TP,
                                                            beceriTP: _controller.yarinkiGorevler[index].beceriTP,
                                                            beceri: _controller.yarinkiGorevler[index].beceri,
                                                            onem: _controller.yarinkiGorevler[index].onem);
                                                        await dosya.gorevEkle(gorev);
                                                        olumlu=true;
                                                        break;
                                                      }
                                                      if(olumlu==true) break;
                                                    }
                                                  if(olumlu==false){
                                                    int enKucukGun=7;
                                                    for(int i=0;i<gunler.length;i++)
                                                      if(gunler[i]<enKucukGun) enKucukGun=gunler[i];

                                                    String ta=_controller.yarinkiGorevler[index].tarih;
                                                    int eklenenGun= 7-belirliGun+enKucukGun;
                                                    DateTime dt=DateTime.parse(ta).add(Duration(days: eklenenGun));
                                                    //Tarih formatını 'dd-MM-yyyy' yazınca çalışmıyor :( Gün ekleme çalışmıyor
                                                    String dtTarih =DateFormat('yyyy-MM-dd').format(dt);
                                                    //Veri tabanındaki görev numaraları belirleniyor
                                                    var gorevNumaralari=[];
                                                    int enBuyukKayitNo=karakter.yarinkiGorevSayisi;
                                                    await dosya.gorevListeOlustur().then((List yarinkiGorevler) async {
                                                      setState(() {
                                                        karakter.yarinkiGorevSayisi = yarinkiGorevler.length;
                                                        //Veritabanında yapılan kayıtların numaraları yazılma-silinmeden dolayı değişiyor.İlkönce onları tespit ediyoruz.
                                                        for (int i = 0; i < karakter.yarinkiGorevSayisi; i++) {
                                                          gorevNumaralari.add(yarinkiGorevler[i].no);
                                                        }
                                                        //En büyük kayıt numarası tespit ediliyor
                                                        for (int i = 0; i < karakter.yarinkiGorevSayisi; i++)
                                                          if (enBuyukKayitNo < gorevNumaralari[i]) enBuyukKayitNo = gorevNumaralari[i];
                                                      });

                                                    });
                                                    var gorev = Gorevler(
                                                        no: enBuyukKayitNo+1,
                                                        ad: _controller.yarinkiGorevler[index].ad,
                                                        aciklama:_controller.yarinkiGorevler[index].aciklama,
                                                        tarih: dtTarih,
                                                        tekrar: _controller.yarinkiGorevler[index].tekrar,
                                                        yapildi: "Hayır",
                                                        basariDurumu: '',
                                                        altin: _controller.yarinkiGorevler[index].altin,
                                                        TP: _controller.yarinkiGorevler[index].TP,
                                                        beceriTP: _controller.yarinkiGorevler[index].beceriTP,
                                                        beceri: _controller.yarinkiGorevler[index].beceri,
                                                        onem: _controller.yarinkiGorevler[index].onem);
                                                    await dosya.gorevEkle(gorev);
                                                  }
                                                }
                                              } catch (e) {
                                                print("Görev yüklenemedi");
                                              }


                                              // Ardından veritabanından tüm veriler okunarak listelere aktarılarak görev listeleri güncelleniyor
                                              await dosya.gorevListeOlustur().then((
                                                  List tumGorevler) async {
                                                setState(() {
                                                  _controller.tumGorevler.value = tumGorevler;
                                                  _controller.tumGorevSayisi.value =
                                                      tumGorevler.length;
                                                  karakter.tumGorevSayisi = tumGorevler.length;
                                                  karakter.tumGorevler = tumGorevler;
                                                });
                                              });

                                              await dosya
                                                  .gorevBugunTariheGoreListeOlustur()
                                                  .then((List bugunkuGorevler) async {
                                                setState(() {
                                                  _controller.bugunkuGorevler.value =
                                                      bugunkuGorevler;
                                                  _controller.cBugunkuGorevSayisi.value =
                                                      bugunkuGorevler.length;
                                                  karakter.bugunkuGorevler = bugunkuGorevler;
                                                  karakter.bugunkuGorevSayisi =
                                                      bugunkuGorevler.length;
                                                  _controller.popupMenuGorevSayisi.value =
                                                      _controller.cBugunkuGorevSayisi.value;
                                                  _controller.secilenGorevler.value = bugunkuGorevler;
                                                  _controller.secilenGorevSayisi.value = bugunkuGorevler.length;
                                                });
                                              });

                                              await dosya
                                                  .gorevYarininTarihineGoreListeOlustur()
                                                  .then((List yarinkiGorevler) async {
                                                setState(() {
                                                  _controller.yarinkiGorevler.value =
                                                      yarinkiGorevler;
                                                  _controller.yarinkiGorevSayisi.value =
                                                      yarinkiGorevler.length;
                                                  karakter.yarinkiGorevler = yarinkiGorevler;
                                                  karakter.yarinkiGorevSayisi =
                                                      yarinkiGorevler.length;
                                                });
                                              });

                                              await dosya.gorevGecmisListeOlustur()
                                                  .then((gecmisGorevler) async {
                                                setState(() {
                                                  _controller.gecmisGorevler.value = gecmisGorevler;
                                                  _controller.gecmisGorevSayisi.value = gecmisGorevler.length;
                                                  karakter.gecmisGorevler = gecmisGorevler;
                                                  karakter.gecmisGorevSayisi = gecmisGorevler.length;
                                                });
                                              });

                                              await dosya.gorevGecikmisGorevListeOlustur().then((List gecikmisGorevler) async{
                                                if(gecikmisGorevler.length!=0) {
                                                  setState(() {
                                                    _controller.gecikmisGorevler.value = gecikmisGorevler;
                                                    _controller.gecikmisGorevSayisi.value = gecikmisGorevler.length;
                                                    karakter.gecikmisGorevler = gecikmisGorevler;
                                                    karakter.gecikmisGorevSayisi = gecikmisGorevler.length;
                                                  });
                                                }
                                              });

                                              await dosya.beceriListeOlustur().then((
                                                  List tumBeceriler) async {
                                                setState(() {
                                                  karakter.beceriSayisi = tumBeceriler.length;
                                                });
                                                _controller.beceriSayisi.value =
                                                    tumBeceriler.length;
                                                _controller.beceriler.value = tumBeceriler;

                                                for (int i = 0; i < tumBeceriler.length; i++) {
                                                  beceriler.beceriAdlari.add(
                                                      tumBeceriler[i].ad);
                                                  beceriler.seviye.add(
                                                      tumBeceriler[i].seviye);
                                                  beceriler.beceriTP.add(
                                                      tumBeceriler[i].beceriTP);
                                                }
                                              });


                                              if (karakter.yarinkiGorevSayisi==0)
                                                Center(child: Text("Yarın göreviniz bulunmamaktadır..."));

                                              await dosya.gorevGrafikListeOlustur().then((List grafik) async{
                                                setState(() {
                                                  _controller.grafik.value=grafik;
                                                  _controller.grafikVeriSayisi.value=grafik.length;
                                                  karakter.grafik=grafik;
                                                  karakter.grafikVeriSayisi=grafik.length;
                                                });
                                              });

                                              await dosya.gorevGrafikListeOlustur2().then((List grafik) async{
                                                setState(() {
                                                  _controller.grafik2.value=grafik;
                                                  _controller.grafikVeriSayisi2.value=grafik.length;
                                                  karakter.grafik2=grafik;
                                                  karakter.grafikVeriSayisi2=grafik.length;
                                                });
                                              });
                                            });

                                            //yeni görev için ekran temizleniyor
                                            _controller.yeniGorevAdi=''.obs;
                                            _controller.yeniGorevTarih=tarih.obs;
                                            _controller.yeniGorevTP=0.obs;
                                            _controller.yeniGorevAltin=0.obs;
                                            _controller.yeniGorevTekrar='1 kez'.obs;
                                            _controller.yeniGorevIliskiliBeceri='Aile'.obs;
                                            _controller.yeniGorevBeceriTP=0.obs;

                                            Get.back();
                                          },
                                          gradient: LinearGradient(colors: [
                                            Color.fromRGBO(116, 116, 191, 1.0),
                                            Color.fromRGBO(52, 138, 199, 1.0)
                                          ]),
                                        ),
                                        DialogButton(
                                          child: Text(
                                            "GERİ AL",
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 14),
                                          ),
                                          onPressed: () {
                                            Get.back();
                                          },
                                          color: Color.fromRGBO(0, 179, 134, 1.0),
                                        ),
                                      ]).show();
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.cancel_outlined, color: Colors.redAccent, size: 18),
                                onPressed: () {
                                  Alert(
                                      context: context,
                                      type: AlertType.none,
                                      style: alertStyle,
                                      title: 'Görev başarısız!\n'+_controller.yarinkiGorevler[index].ad+"\n",
                                      desc: "Kayıp:\n"
                                          "-" + _controller.yarinkiGorevler[index].TP.toString()+" TP\n"+
                                          "-" + _controller.yarinkiGorevler[index].altin.toString()+" Altın\n\n"+
                                          "İlişkili Beceri:\n"+"-" +_controller.yarinkiGorevler[index].beceriTP.toString()+' '+_controller.yarinkiGorevler[index].beceri+"\n\n"+
                                          "Tekrar:\n"+_controller.yarinkiGorevler[index].tekrar,
                                      buttons: [
                                        DialogButton(
                                          child: Text(
                                            "TAMAM",
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 14),
                                          ),
                                          onPressed: () {

                                            WidgetsBinding.instance!.addPostFrameCallback((_) async {
                                              //karakter.TP nin ilk değeri bir yerde tutuluyor
                                              int karakterTPIlkDeger=karakter.TP;
                                              //Maalesef tek satırda eşitlenmiyor. Bu yolu bulmak için çok uğraştım :(
                                              int TP = _controller.yarinkiGorevler[index].TP;
                                              karakter.TP -= TP;
                                              _controller.karakterTP.value=karakter.TP;
                                              int altin = _controller.yarinkiGorevler[index].altin;
                                              karakter.altin -= altin;
                                              _controller.karakterAltin.value=karakter.altin;
                                              karakter.sonrakiSeviyeye += TP;
                                              _controller.karakterSonrakiSeviyeye.value=karakter.sonrakiSeviyeye;

                                              //yeni seviye için 10x2+20 formülünü belirledim. Burada x->karakter.seviye yi gösteriyor
                                              if (karakter.TP<(10*((karakter.seviye-1)*(karakter.seviye-1))+20) && (karakterTPIlkDeger>=(10*((karakter.seviye-1)*(karakter.seviye-1))+20)) && karakter.seviye>0){
                                                //Önceki seviyeye düşülünce sonrakiSeviyeye değişkenine yeni değer atanıyor
                                                karakter.sonrakiSeviyeye=(10*((karakter.seviye-1)*(karakter.seviye-1))+20)-karakter.TP;
                                                _controller.karakterSonrakiSeviyeye.value=karakter.sonrakiSeviyeye;

                                                karakter.seviye--;
                                                _controller.karakterSeviye.value=karakter.seviye;
                                                int karakterDurum=_controller.karakterSeviye.value;

                                                if (karakterDurum==0) {
                                                  _controller.karakterDurum.value='Acemi';
                                                  karakter.durum='Acemi';
                                                }  else if (karakterDurum==2) {
                                                  _controller.karakterDurum.value='Çırak';
                                                  karakter.durum='Çırak';
                                                }else if (karakterDurum==4) {
                                                  _controller.karakterDurum.value='Becerikli';
                                                  karakter.durum='Becerikli';
                                                }else if (karakterDurum==6) {
                                                  _controller.karakterDurum.value='Uzman';
                                                  karakter.durum='Uzman';
                                                }else if (karakterDurum==8) {
                                                  _controller.karakterDurum.value='Usta';
                                                  karakter.durum='Usta';
                                                }

                                                //Karakterin seviyesinin düştüğü diyalog penceresi ile belirtiliyor.
                                                Alert(
                                                    context: context,
                                                    type: AlertType.none,
                                                    style: alertStyle,
                                                    title: "Üzgünüm!\nKarakteriniz "+karakter.seviye.toString()+".seviyeye düştü!",
                                                    buttons: [
                                                      DialogButton(
                                                        child: Text(
                                                          "TAMAM",
                                                          style: TextStyle(
                                                              color: Colors.white, fontSize: 14),
                                                        ),
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        color: Color.fromRGBO(0, 179, 134, 1.0),
                                                      ),
                                                    ]).show();

                                              }

                                              if (karakter.TP<0) {
                                                karakter.TP=0;
                                                _controller.karakterTP.value=0;
                                              }
                                              if (karakter.altin<0) {
                                                karakter.altin=0;
                                                _controller.karakterAltin.value=0;
                                              }
                                              //Değişiklikler karakter dosyasına kaydediliyor
                                              yazdirilacak = karakter.ad +
                                                  "\n" +
                                                  karakter.durum +
                                                  "\n" +
                                                  karakter.seviye.toString() +
                                                  "\n" +
                                                  karakter.sonrakiSeviyeye.toString() +
                                                  "\n" +
                                                  karakter.TP.toString() +
                                                  "\n" +
                                                  karakter.altin.toString() +
                                                  "\n" +
                                                  karakter.avatar.toString() +
                                                  "\n" +
                                                  karakter.avatarRenk.toString() +
                                                  "\n";
                                              await dosya.KadosyayaYaz(yazdirilacak);

                                              //Beceri seviyesi düşürülerek veritabanına kaydediliyor. Ardından tekrar okunarak değişkenlere aktarılıyor
                                              String beceri = _controller.yarinkiGorevler[index].beceri;
                                              int beceriTP = _controller.yarinkiGorevler[index].beceriTP;
                                              int becerininVeriTabanindakiIndeksi = beceriler.beceriAdlari.indexOf(beceri);
                                              int azaltilmisBeceriDegeri = beceriler.beceriTP[becerininVeriTabanindakiIndeksi] - beceriTP;
                                              int beceriSeviye=_controller.beceriler[becerininVeriTabanindakiIndeksi].seviye;

                                              //beceriTP için seviye formülü x2+5
                                              if ((beceriTP>=(5*(beceriSeviye-1)*(beceriSeviye-1))+5) && (azaltilmisBeceriDegeri<(5*(beceriSeviye)*(beceriSeviye))+5) && beceriSeviye>0) {
                                                beceriSeviye--;

                                                Alert(
                                                    context: context,
                                                    type: AlertType.none,
                                                    style: alertStyle,
                                                    title: "Üzgünüm!\n'"+beceri+"' beceriniz "+beceriSeviye.toString()+".seviyeye düştü!",
                                                    buttons: [
                                                      DialogButton(
                                                        child: Text(
                                                          "TAMAM",
                                                          style: TextStyle(
                                                              color: Colors.white, fontSize: 14),
                                                        ),
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        color: Color.fromRGBO(0, 179, 134, 1.0),
                                                      ),
                                                    ]).show();
                                              }

                                              try {
                                                if (azaltilmisBeceriDegeri<0) azaltilmisBeceriDegeri=0;
                                                var beceri1 = Beceri(
                                                    ad: beceri,
                                                    seviye: beceriSeviye,
                                                    beceriTP: azaltilmisBeceriDegeri
                                                );

                                                await dosya.beceriGuncelle(beceri1);
                                              } catch (e) {
                                                print("beceri güncellenemedi");
                                              };

                                              try{
                                                //Görev seçildiğinde görev yapildi diye veritabanına kaydediliyor
                                                var gorev = Gorevler(
                                                  no: _controller.yarinkiGorevler[index].no,
                                                  ad: _controller.yarinkiGorevler[index].ad,
                                                  aciklama:_controller.yarinkiGorevler[index].aciklama,
                                                  tarih: _controller.yarinkiGorevler[index]
                                                      .tarih,
                                                  tekrar: _controller.yarinkiGorevler[index].tekrar,
                                                  yapildi: "Evet",
                                                  basariDurumu: 'Başarısız',
                                                  altin: _controller.yarinkiGorevler[index]
                                                      .altin,
                                                  TP: _controller.yarinkiGorevler[index].TP,
                                                  beceriTP: _controller.yarinkiGorevler[index].beceriTP,
                                                  beceri: _controller.yarinkiGorevler[index]
                                                      .beceri,
                                                  onem: _controller.tumGorevler[index]
                                                      .onem,);

                                                await dosya.gorevGuncelle(gorev);

                                                //Veri tabanındaki görev numaraları belirleniyor
                                                var gorevNumaralari=[];
                                                int enBuyukKayitNo=karakter.tumGorevSayisi;
                                                await dosya.gorevListeOlustur().then((List tumGorevler) async {
                                                  setState(() {
                                                    karakter.tumGorevSayisi =
                                                        tumGorevler.length;

                                                    //Veritabanında yapılan kayıtların numaraları yazılma-silinmeden dolayı değişiyor.İlkönce onları tespit ediyoruz.
                                                    for (int i = 0; i < karakter
                                                        .tumGorevSayisi; i++) {
                                                      gorevNumaralari.add(
                                                          tumGorevler[i].no);
                                                    }
                                                    //En büyük kayıt numarası tespit ediliyor

                                                    for (int i = 0; i < karakter
                                                        .tumGorevSayisi; i++)
                                                      if (enBuyukKayitNo <
                                                          gorevNumaralari[i])
                                                        enBuyukKayitNo =
                                                        gorevNumaralari[i];
                                                  });

                                                });
                                                //Eğer görevin tekrar durumu "Her gün" ise yarın için de aynı görev kaydediliyor
                                                if (_controller.yarinkiGorevler[index].tekrar=="Her gün"){
                                                  //Veritabanına DateTime formatında kaydediyoruz
                                                  //Bu sayede tarihe ekleme-çıkarmayı rahatlıkla yapabiliyoruz
                                                  String t=_controller.yarinkiGorevler[index].tarih;
                                                  DateTime dt=DateTime.parse(t).add(Duration(days: 1));
                                                  //Tarih formatını 'dd-MM-yyyy' yazınca çalışmıyor :( Gün ekleme çalışmıyor
                                                  String dtTarih =DateFormat('yyyy-MM-dd').format(dt);

                                                  var gorev = Gorevler(
                                                    no: enBuyukKayitNo+1,
                                                    ad: _controller.yarinkiGorevler[index].ad,
                                                    aciklama:_controller.yarinkiGorevler[index].aciklama,
                                                    tarih: dtTarih,
                                                    tekrar: _controller.yarinkiGorevler[index].tekrar,
                                                    yapildi: "Hayır",
                                                    basariDurumu: '',
                                                    altin: _controller.yarinkiGorevler[index]
                                                        .altin,
                                                    TP: _controller.yarinkiGorevler[index].TP,
                                                    beceriTP: _controller.yarinkiGorevler[index].beceriTP,
                                                    beceri: _controller.yarinkiGorevler[index]
                                                        .beceri,
                                                    onem: _controller.yarinkiGorevler[index]
                                                        .onem,);

                                                  await dosya.gorevEkle(gorev);
                                                }

                                                //Eğer görevin tekrar durumu "Her hafta" ise gelecek hafta için de aynı görev kaydediliyor
                                                if (_controller.yarinkiGorevler[index].tekrar=="Her hafta"){
                                                  //Veritabanına DateTime formatında kaydediyoruz
                                                  //Bu sayede tarihe ekleme-çıkarmayı rahatlıkla yapabiliyoruz
                                                  String t=_controller.yarinkiGorevler[index].tarih;
                                                  DateTime dt=DateTime.parse(t).add(Duration(days: 7));
                                                  String dtTarih =DateFormat('yyyy-MM-dd').format(dt);

                                                  var gorev = Gorevler(
                                                    no: enBuyukKayitNo+1,
                                                    ad: _controller.yarinkiGorevler[index].ad,
                                                    aciklama:_controller.yarinkiGorevler[index].aciklama,
                                                    tarih: dtTarih,
                                                    tekrar: _controller.yarinkiGorevler[index].tekrar,
                                                    yapildi: "Hayır",
                                                    basariDurumu: '',
                                                    altin: _controller.yarinkiGorevler[index]
                                                        .altin,
                                                    TP: _controller.yarinkiGorevler[index].TP,
                                                    beceriTP: _controller.yarinkiGorevler[index].beceriTP,
                                                    beceri: _controller.yarinkiGorevler[index]
                                                        .beceri,
                                                    onem: _controller.yarinkiGorevler[index]
                                                        .onem,);
                                                  await dosya.gorevEkle(gorev);
                                                }

                                                //Eğer görevin tekrar durumu "Her ay" ise gelecek hafta için de aynı görev kaydediliyor
                                                if (_controller.yarinkiGorevler[index].tekrar=="Her ay"){
                                                  //Veritabanına DateTime formatında kaydediyoruz
                                                  //Bu sayede tarihe ekleme-çıkarmayı rahatlıkla yapabiliyoruz
                                                  String t=_controller.yarinkiGorevler[index].tarih;
                                                  DateTime dt=DateTime.parse(t).add(Duration(days: 30));
                                                  String dtTarih =DateFormat('yyyy-MM-dd').format(dt);

                                                  var gorev = Gorevler(
                                                    no: enBuyukKayitNo+1,
                                                    ad: _controller.yarinkiGorevler[index].ad,
                                                    aciklama:_controller.yarinkiGorevler[index].aciklama,
                                                    tarih: dtTarih,
                                                    tekrar: _controller.yarinkiGorevler[index].tekrar,
                                                    yapildi: "Hayır",
                                                    basariDurumu: '',
                                                    altin: _controller.yarinkiGorevler[index]
                                                        .altin,
                                                    TP: _controller.yarinkiGorevler[index].TP,
                                                    beceriTP: _controller.yarinkiGorevler[index].beceriTP,
                                                    beceri: _controller.yarinkiGorevler[index]
                                                        .beceri,
                                                    onem: _controller.yarinkiGorevler[index]
                                                        .onem,);
                                                  await dosya.gorevEkle(gorev);
                                                }

                                                //Eğer görevin tekrar durumu "Her yıl" ise gelecek hafta için de aynı görev kaydediliyor
                                                if (_controller.yarinkiGorevler[index].tekrar=="Her yıl"){
                                                  //Veritabanına DateTime formatında kaydediyoruz
                                                  //Bu sayede tarihe ekleme-çıkarmayı rahatlıkla yapabiliyoruz
                                                  String t=_controller.yarinkiGorevler[index].tarih;
                                                  DateTime dt=DateTime.parse(t).add(Duration(days: 365));
                                                  String dtTarih =DateFormat('yyyy-MM-dd').format(dt);

                                                  var gorev = Gorevler(
                                                    no: enBuyukKayitNo+1,
                                                    ad: _controller.yarinkiGorevler[index].ad,
                                                    aciklama:_controller.yarinkiGorevler[index].aciklama,
                                                    tarih: dtTarih,
                                                    tekrar: _controller.yarinkiGorevler[index].tekrar,
                                                    yapildi: "Hayır",
                                                    basariDurumu: '',
                                                    altin: _controller.yarinkiGorevler[index]
                                                        .altin,
                                                    TP: _controller.yarinkiGorevler[index].TP,
                                                    beceriTP: _controller.yarinkiGorevler[index].beceriTP,
                                                    beceri: _controller.yarinkiGorevler[index]
                                                        .beceri,
                                                    onem: _controller.yarinkiGorevler[index]
                                                        .onem,);
                                                  await dosya.gorevEkle(gorev);
                                                }

                                                else if(ayristirilanMetin[0]!='1' && ayristirilanMetin[1]=='kez') {
                                                  int deger=int.parse(ayristirilanMetin[0])-1;
                                                  //Veritabanına DateTime formatında kaydediyoruz
                                                  //Bu sayede tarihe ekleme-çıkarmayı rahatlıkla yapabiliyoruz
                                                  String t=_controller.yarinkiGorevler[index].tarih;
                                                  DateTime dt=DateTime.parse(t).add(Duration(days: 1));
                                                  String dtTarih =DateFormat('yyyy-MM-dd').format(dt);

                                                  if (deger!=0){
                                                    //Veri tabanındaki görev numaraları belirleniyor
                                                    var gorevNumaralari=[];
                                                    int enBuyukKayitNo=karakter.yarinkiGorevSayisi;
                                                    await dosya.gorevListeOlustur().then((List yarinkiGorevler) async {
                                                      setState(() {
                                                        karakter.yarinkiGorevSayisi = yarinkiGorevler.length;
                                                        //Veritabanında yapılan kayıtların numaraları yazılma-silinmeden dolayı değişiyor.İlkönce onları tespit ediyoruz.
                                                        for (int i = 0; i < karakter.yarinkiGorevSayisi; i++) {
                                                          gorevNumaralari.add(yarinkiGorevler[i].no);
                                                        }
                                                        //En büyük kayıt numarası tespit ediliyor
                                                        for (int i = 0; i < karakter.yarinkiGorevSayisi; i++)
                                                          if (enBuyukKayitNo < gorevNumaralari[i]) enBuyukKayitNo = gorevNumaralari[i];
                                                      });

                                                    });

                                                    var gorev = Gorevler(
                                                        no: enBuyukKayitNo+1,
                                                        ad: _controller.yarinkiGorevler[index].ad,
                                                        aciklama:_controller.yarinkiGorevler[index].aciklama,
                                                        tarih: dtTarih,
                                                        tekrar: deger.toString()+' kez',
                                                        yapildi: "Hayır",
                                                        basariDurumu: '',
                                                        altin: _controller.yarinkiGorevler[index].altin,
                                                        TP: _controller.yarinkiGorevler[index].TP,
                                                        beceriTP: _controller.yarinkiGorevler[index].beceriTP,
                                                        beceri: _controller.yarinkiGorevler[index].beceri,
                                                        onem: _controller.yarinkiGorevler[index].onem);
                                                    await dosya.gorevEkle(gorev);
                                                  }
                                                }
                                              } catch (e) {
                                                print("Görev yüklenemedi");
                                              }

                                              // Ardından veritabanından tüm veriler okunarak listelere aktarılarak görev listeleri güncelleniyor
                                              await dosya.gorevListeOlustur().then((
                                                  List tumGorevler) async {
                                                setState(() {
                                                  _controller.tumGorevler.value = tumGorevler;
                                                  _controller.tumGorevSayisi.value =
                                                      tumGorevler.length;
                                                  karakter.tumGorevSayisi = tumGorevler.length;
                                                  karakter.tumGorevler = tumGorevler;
                                                });
                                              });

                                              await dosya
                                                  .gorevBugunTariheGoreListeOlustur()
                                                  .then((List bugunkuGorevler) async {
                                                setState(() {
                                                  _controller.bugunkuGorevler.value =
                                                      bugunkuGorevler;
                                                  _controller.cBugunkuGorevSayisi.value =
                                                      bugunkuGorevler.length;
                                                  karakter.bugunkuGorevler = bugunkuGorevler;
                                                  karakter.bugunkuGorevSayisi =
                                                      bugunkuGorevler.length;
                                                  _controller.popupMenuGorevSayisi.value =
                                                      _controller.cBugunkuGorevSayisi.value;
                                                  _controller.secilenGorevler.value = bugunkuGorevler;
                                                  _controller.secilenGorevSayisi.value = bugunkuGorevler.length;
                                                });
                                              });

                                              await dosya
                                                  .gorevYarininTarihineGoreListeOlustur()
                                                  .then((List yarinkiGorevler) async {
                                                setState(() {
                                                  _controller.yarinkiGorevler.value =
                                                      yarinkiGorevler;
                                                  _controller.yarinkiGorevSayisi.value =
                                                      yarinkiGorevler.length;
                                                  karakter.yarinkiGorevler = yarinkiGorevler;
                                                  karakter.yarinkiGorevSayisi =
                                                      yarinkiGorevler.length;
                                                });
                                              });

                                              await dosya.gorevGecmisListeOlustur()
                                                  .then((gecmisGorevler) async {
                                                setState(() {
                                                  _controller.gecmisGorevler.value = gecmisGorevler;
                                                  _controller.gecmisGorevSayisi.value = gecmisGorevler.length;
                                                  karakter.gecmisGorevler = gecmisGorevler;
                                                  karakter.gecmisGorevSayisi = gecmisGorevler.length;
                                                });
                                              });

                                              await dosya.gorevGecikmisGorevListeOlustur().then((List gecikmisGorevler) async{
                                                if(gecikmisGorevler.length!=0) {
                                                  setState(() {
                                                    _controller.gecikmisGorevler.value = gecikmisGorevler;
                                                    _controller.gecikmisGorevSayisi.value = gecikmisGorevler.length;
                                                    karakter.gecikmisGorevler = gecikmisGorevler;
                                                    karakter.gecikmisGorevSayisi = gecikmisGorevler.length;
                                                  });
                                                }
                                              });

                                              WidgetsBinding.instance!.addPostFrameCallback((_) async {
                                                if (karakter.yarinkiGorevSayisi==0)
                                                  Center(child: Text("Yarın göreviniz bulunmamaktadır..."));
                                              });

                                              await dosya.beceriListeOlustur().then((
                                                  List tumBeceriler) async {
                                                setState(() {
                                                  karakter.beceriSayisi = tumBeceriler.length;
                                                });
                                                _controller.beceriSayisi.value =
                                                    tumBeceriler.length;
                                                _controller.beceriler.value = tumBeceriler;

                                                for (int i = 0; i < tumBeceriler.length; i++) {
                                                  beceriler.beceriAdlari.add(
                                                      tumBeceriler[i].ad);
                                                  beceriler.seviye.add(
                                                      tumBeceriler[i].seviye);
                                                  beceriler.beceriTP.add(
                                                      tumBeceriler[i].beceriTP);
                                                }
                                              });

                                              await dosya.gorevGrafikListeOlustur().then((grafik) async {
                                                setState(() {
                                                  _controller.grafikVeriSayisi.value=grafik.length;
                                                  karakter.grafikVeriSayisi=grafik.length;

                                                  _controller.grafik.value=grafik;
                                                  karakter.grafik=grafik;
                                                });
                                              });

                                              await dosya.gorevGrafikListeOlustur2().then((grafik) async {
                                                setState(() {
                                                  _controller.grafikVeriSayisi2.value=grafik.length;
                                                  karakter.grafikVeriSayisi2=grafik.length;

                                                  _controller.grafik2.value=grafik;
                                                  karakter.grafik2=grafik;
                                                });
                                              });
                                            });

                                            setState(() {
                                              //yeni görev için ekran temizleniyor
                                              _controller.yeniGorevAdi=''.obs;
                                              _controller.yeniGorevTarih=tarih.obs;
                                              _controller.yeniGorevTP=0.obs;
                                              _controller.yeniGorevAltin=0.obs;
                                              _controller.yeniGorevTekrar='1 kez'.obs;
                                              _controller.yeniGorevIliskiliBeceri='Aile'.obs;
                                              _controller.yeniGorevBeceriTP=0.obs;
                                            });

                                            Get.back();
                                          },
                                          gradient: LinearGradient(colors: [
                                            Color.fromRGBO(116, 116, 191, 1.0),
                                            Color.fromRGBO(52, 138, 199, 1.0)
                                          ]),
                                        ),
                                        DialogButton(
                                          child: Text(
                                            "GERİ AL",
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 14),
                                          ),
                                          onPressed: () {
                                            _controller.yeniGorevAdi=''.obs;
                                            _controller.yeniGorevTarih=tarih.obs;
                                            _controller.yeniGorevTP=0.obs;
                                            _controller.yeniGorevAltin=0.obs;
                                            _controller.yeniGorevTekrar='1 kez'.obs;
                                            _controller.yeniGorevIliskiliBeceri='Aile'.obs;
                                            _controller.yeniGorevBeceriTP=0.obs;
                                            Get.back();
                                          },
                                          color: Color.fromRGBO(0, 179, 134, 1.0),
                                        ),
                                      ]).show();
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.mode_edit_outlined,color: Colors.black, size: 18),
                                onPressed: () {
                                  String _tekrarIlk=_controller.yarinkiGorevler[index].tekrar;
                                  List<String> tekrar=['1 kez','Her gün','Her hafta','Her ay','Her yıl'];

                                  List<String> onem=['Çok önemli','Önemli','Normal','Önemsiz'];

                                  var val;
                                  int TP=0;
                                  int BeceriTP=_controller.yarinkiGorevler[index].beceriTP;
                                  int altin=0;
                                  int gorevGunuTekrarSayisi=0;

                                  int onemB=_controller.yarinkiGorevler[index].onem;
                                  if (onemB==1) _popupselection3='Çok önemli';
                                  else if (onemB==2) _popupselection3='Önemli';
                                  else if (onemB==3) _popupselection3='Normal';
                                  else if (onemB==4) _popupselection3='Önemsiz';
                                  _controller.gorevGuncelleOnem.value=_popupselection3;

                                  if (ayristirilanMetin[1]=='kez' || ayristirilanMetin[1]=='gün' || ayristirilanMetin[1]=='hafta' || ayristirilanMetin[1]=='yıl')
                                    _popupselection4=_controller.bugunkuGorevler[index].tekrar;
                                  else {
                                    String gunler='';
                                    for (String i in ayristirilanMetin)
                                      gunler+=i;
                                    _controller.yeniGorevTekrar.value=gunler;
                                  }

                                  _popupselection5=_controller.yarinkiGorevler[index].beceri;

                                  //TextField'ın içeriğini bu şekilde kontrol ediyoruz
                                  final gorevAdiControl=TextEditingController();
                                  final gorevAciklamaControl=TextEditingController();
                                  final gorevOnemControl=TextEditingController();
                                  final control=TextEditingController();
                                  final control2=TextEditingController();
                                  final tekrarcontrol=TextEditingController();
                                  final tarihcontrol=TextEditingController();
                                  final iliskilibecericontrol=TextEditingController();

                                  setState(() {
                                    gorevAdiControl.text=_controller.yarinkiGorevler[index].ad;
                                    _controller.yeniGorevAdi.value=_controller.yarinkiGorevler[index].ad;
                                    gorevAciklamaControl.text=_controller.yarinkiGorevler[index].aciklama;
                                    _controller.yeniGorevAciklama.value=_controller.yarinkiGorevler[index].aciklama;
                                    _controller.yeniGorevOnem.value=_controller.yarinkiGorevler[index].onem;
                                    _controller.yeniGorevTarih.value=_controller.yarinkiGorevler[index].tarih;
                                    _controller.yeniGorevTP.value=_controller.yarinkiGorevler[index].TP;
                                    _controller.yeniGorevAltin.value=_controller.yarinkiGorevler[index].altin;
                                    _controller.yeniGorevTekrar.value=_controller.yarinkiGorevler[index].tekrar;
                                    _controller.yeniGorevIliskiliBeceri.value=_controller.yarinkiGorevler[index].beceri;
                                    _controller.yeniGorevBeceriTP.value=_controller.yarinkiGorevler[index].beceriTP;
                                  });
                                  Alert(
                                    context: context,
                                    type: AlertType.none,
                                    style: alertStyle,
                                    title: "Görevi güncelle",
                                    content: Column(
                                      children: [
                                        TextField(
                                          keyboardType: TextInputType.text,
                                          controller: gorevAdiControl,
                                          maxLength: 64,
                                          showCursor: false,
                                          style: TextStyle(fontSize: 12),
                                          decoration: InputDecoration(
                                            //icon: const Icon(Icons.arrow_right, size: 35.0),
                                            labelText: 'Görev...',
                                            labelStyle: TextStyle(
                                              fontSize: 12,
                                            ),
                                            border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                            ),
                                          ),
                                          onChanged: (String value){
                                            setState(() {
                                              _controller.yeniGorevAdi.value=value;
                                            });
                                          },
                                        ),
                                        TextField(
                                          keyboardType: TextInputType.text,
                                          controller: gorevAciklamaControl,
                                          maxLength: 32,
                                          showCursor: false,
                                          style: TextStyle(fontSize: 12),
                                          decoration: InputDecoration(
                                            //icon: const Icon(Icons.arrow_right, size: 35.0),
                                            labelText: 'Görev açıklama...',
                                            labelStyle: TextStyle(
                                              fontSize: 12,
                                            ),
                                            border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                            ),
                                          ),
                                          onChanged: (String value){
                                            setState(() {
                                              _controller.yeniGorevAciklama.value=value;
                                            });
                                          },
                                        ),
                                        Row(
                                            children:[
                                              const Text('Önem:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12)),
                                              ButtonBar(
                                                children: <Widget>[
                                                  PopupMenuButton<String>(
                                                    onSelected: (String value) {
                                                      setState(() {
                                                        _popupselection3 = value;
                                                        //bugün veya yarın tarih seçilirse yeniGorev.tarih e aktar
                                                        //fakat 'Başka bir tarih' seçilirse atama işlemini sonraya bırak
                                                        if (_popupselection3.toString()=="Çok önemli") {
                                                          _controller.gorevGuncelleOnem.value="Çok önemli";
                                                          _controller.yeniGorevOnem.value=1;
                                                        }else if(_popupselection3.toString()=="Önemli"){
                                                          _controller.gorevGuncelleOnem.value="Önemli";
                                                          _controller.yeniGorevOnem.value=2;
                                                        }else if(_popupselection3.toString()=="Normal"){
                                                          _controller.gorevGuncelleOnem.value="Normal";
                                                          _controller.yeniGorevOnem.value=3;
                                                        }else if(_popupselection3.toString()=="Önemsiz"){
                                                          _controller.gorevGuncelleOnem.value="Önemsiz";
                                                          _controller.yeniGorevOnem.value=4;
                                                        }
                                                      });
                                                    },
                                                    child:  Row(
                                                      children: <Widget>[
                                                        SizedBox(
                                                          width: 120.0,
                                                          child: Obx(() =>
                                                              Text(_controller.gorevGuncelleOnem.value,
                                                                  style: TextStyle(color:Colors.redAccent,fontSize:14),
                                                                  textAlign: TextAlign.center
                                                              )),
                                                        ),
                                                        Icon(Icons.arrow_drop_down,size:40.0),
                                                      ],
                                                    ),

                                                    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                                                      const PopupMenuItem<String>(
                                                        value: 'Çok önemli',
                                                        child: const Text('Çok önemli',style: TextStyle(fontSize:12)),
                                                      ),
                                                      const PopupMenuItem<String>(
                                                        value: 'Önemli',
                                                        child: const Text('Önemli',style: TextStyle(fontSize:12)),
                                                      ),
                                                      const PopupMenuItem<String>(
                                                        value: 'Normal',
                                                        child: const Text('Normal',style: TextStyle(fontSize:12)),
                                                      ),
                                                      const PopupMenuItem<String>(
                                                        value: 'Önemsiz',
                                                        child: const Text('Önemsiz',style: TextStyle(fontSize:12)),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ]),
                                        Row(
                                          children:[
                                            const Text('Tarih:  ',style: TextStyle(fontSize:12, fontWeight: FontWeight.bold)),
                                            ButtonBar(
                                              children: <Widget>[
                                                PopupMenuButton<String>(
                                                  onSelected: (String value) {
                                                    setState(() {
                                                      _popupselection2 = value;
                                                      //bugün veya yarın tarih seçilirse yeniGorev.tarih e aktar
                                                      //fakat 'Başka bir tarih' seçilirse atama işlemini sonraya bırak
                                                      if (_popupselection2.toString()=="Bugün") {
                                                        setState(() {
                                                          _controller.yeniGorevTarih.value=tarih;
                                                          _controller.yeniGorevTekrar.value='1 kez';
                                                        });
                                                      }else if(_popupselection2.toString()=="Yarın"){
                                                        setState(() {
                                                          _controller.yeniGorevTarih.value=yarinTarih;
                                                          _controller.yeniGorevTekrar.value='1 kez';
                                                        });
                                                      }else if(_popupselection2.toString()=="Başka bir tarih"){
                                                        Get.to(() => TarihBelirle());
                                                      }
                                                    });
                                                  },
                                                  child:  Row(
                                                    children: <Widget>[
                                                      SizedBox(
                                                        width: 120.0,
                                                        child: Obx(() =>
                                                        //Bu satırı yazmak yarım günüme mal oldu :(
                                                        Text(DateFormat('dd/MM/yyyy').format(DateTime.parse(_controller.yeniGorevTarih.value)),
                                                            style: TextStyle(color:Colors.redAccent,fontSize:14),
                                                            textAlign: TextAlign.center
                                                        )),
                                                      ),
                                                      Icon(Icons.arrow_drop_down,size:40.0),
                                                    ],
                                                  ),

                                                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                                                    const PopupMenuItem<String>(
                                                      value: 'Bugün',
                                                      child: const Text('Bugün',style: TextStyle(fontSize:12)),
                                                    ),
                                                    const PopupMenuItem<String>(
                                                      value: 'Yarın',
                                                      child: const Text('Yarın',style: TextStyle(fontSize:12)),
                                                    ),
                                                    const PopupMenuItem<String>(
                                                      value: 'Başka bir tarih',
                                                      child: const Text('Başka bir tarih',style: TextStyle(fontSize:12)),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children:[
                                            const Text("TP:   ",style: TextStyle(fontWeight: FontWeight.bold,fontSize:12)),
                                            ButtonBar(
                                              children: <Widget>[
                                                SizedBox(
                                                  width: 50.0,
                                                  child: Obx(() =>
                                                      Text("  "+_controller.yeniGorevTP.value.toString(),
                                                          style: TextStyle(color:Colors.redAccent,fontSize:14),
                                                          textAlign: TextAlign.center
                                                      )),
                                                ),
                                                IconButton(
                                                  icon: const Icon(Icons.add),
                                                  onPressed: () {
                                                    setState(() {
                                                      if (TP<10){
                                                        TP++;
                                                        _controller.yeniGorevTP.value = TP;
                                                        control.text = "$TP";
                                                      }
                                                    });
                                                  } ,
                                                ),
                                                IconButton(
                                                  icon: const Icon(Icons.remove),
                                                  onPressed: () {
                                                    setState(() {
                                                      if (TP>0){
                                                        TP--;
                                                        _controller.yeniGorevTP.value = TP;
                                                        control.text = "$TP";
                                                      }
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children:[
                                            const Text("Altın: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12)),
                                            ButtonBar(
                                              children: <Widget>[
                                                SizedBox(
                                                  width: 50.0,
                                                  child: Obx(() =>
                                                      Text(_controller.yeniGorevAltin.value.toString(),
                                                          style: TextStyle(color:Colors.redAccent,fontSize:14),
                                                          textAlign: TextAlign.center
                                                      )),
                                                ),
                                                IconButton(
                                                  icon: const Icon(Icons.add),
                                                  onPressed: () {
                                                    setState(() {
                                                      if (altin<10){
                                                        altin++;
                                                        _controller.yeniGorevAltin.value = altin;
                                                        control2.text = "$altin";
                                                      }
                                                    });
                                                  } ,
                                                ),
                                                IconButton(
                                                  icon: const Icon(Icons.remove),
                                                  onPressed: () {
                                                    setState(() {
                                                      if (altin>0){
                                                        altin--;
                                                        _controller.yeniGorevAltin.value = altin;
                                                        control2.text = "$altin";
                                                      }
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                            children:[
                                              Row(
                                                  children:[
                                                    const Text('Tekrar:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12)),
                                                    ButtonBar(
                                                      children: <Widget>[
                                                        PopupMenuButton<String>(
                                                          onSelected: (String value) async {
                                                            setState(()  {
                                                              _popupselection4 = value;
                                                            });
                                                            //bugün veya yarın tarih seçilirse yeniGorev.tarih e aktar
                                                            //fakat 'Başka bir tarih' seçilirse atama işlemini sonraya bırak
                                                            if (_popupselection4.toString()=="1 kez") {
                                                              setState(() {
                                                                _controller.yeniGorevTekrar.value="1 kez";
                                                              });
                                                            }else if(_popupselection4.toString()=="Her gün"){
                                                              setState(() {
                                                                _controller.yeniGorevTekrar.value="Her gün";
                                                              });
                                                            }else if(_popupselection4.toString()=="Her hafta"){
                                                              setState(() {
                                                                _controller.yeniGorevTekrar.value="Her hafta";
                                                              });
                                                            }else if(_popupselection4.toString()=="Her ay"){
                                                              setState(() {
                                                                _controller.yeniGorevTekrar.value="Her ay";
                                                              });
                                                            }else if(_popupselection4.toString()=="Her yıl"){
                                                              setState(() {
                                                                _controller.yeniGorevTekrar.value="Her yıl";
                                                              });
                                                            }else if(_popupselection4.toString()=="Belirli sayıda"){
                                                              Alert(
                                                                  context: context,
                                                                  type: AlertType.none,
                                                                  style: alertStyle,
                                                                  title: 'Görev kaç kez tekrarlanacak?',
                                                                  content: Row(
                                                                    children:[
                                                                      const Text("Tekrar Sayısı:",style: TextStyle(fontWeight: FontWeight.bold,fontSize:12)),
                                                                      ButtonBar(
                                                                        children: <Widget>[
                                                                          SizedBox(
                                                                            width: _w/16.44,
                                                                            child: Obx(()=>Text(_controller.yeniGorevGunuTekrarSayisi.value.toString(),
                                                                                style: TextStyle(color:Colors.redAccent,fontSize:14)
                                                                            )),
                                                                          ),
                                                                          IconButton(
                                                                            icon: const Icon(Icons.add,size:16),
                                                                            onPressed: () {
                                                                              setState(() {
                                                                                gorevGunuTekrarSayisi++;
                                                                                _controller.yeniGorevGunuTekrarSayisi.value = gorevGunuTekrarSayisi;
                                                                              });
                                                                            } ,
                                                                          ),
                                                                          IconButton(
                                                                            icon: const Icon(Icons.remove,size:16),
                                                                            onPressed: () {
                                                                              if (gorevGunuTekrarSayisi>0){
                                                                                setState(() {
                                                                                  gorevGunuTekrarSayisi--;
                                                                                  _controller.yeniGorevGunuTekrarSayisi.value = gorevGunuTekrarSayisi;
                                                                                });
                                                                              }
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  buttons: [
                                                                    DialogButton(
                                                                      child: Text(
                                                                        "TAMAM",
                                                                        style: TextStyle(
                                                                            color: Colors.white, fontSize: 14),
                                                                      ),
                                                                      onPressed: () {
                                                                        setState(() {
                                                                          _controller.yeniGorevTekrar.value=_controller.yeniGorevGunuTekrarSayisi.value.toString()+" kez";
                                                                          gorevGunuTekrarSayisi=0;
                                                                          _controller.yeniGorevGunuTekrarSayisi.value = gorevGunuTekrarSayisi;
                                                                        });

                                                                        Get.back();
                                                                      },
                                                                      gradient: LinearGradient(colors: [
                                                                        Color.fromRGBO(116, 116, 191, 1.0),
                                                                        Color.fromRGBO(52, 138, 199, 1.0)
                                                                      ]),
                                                                    ),
                                                                    DialogButton(
                                                                      child: Text(
                                                                        "GERİ AL",
                                                                        style: TextStyle(
                                                                            color: Colors.white, fontSize: 14),
                                                                      ),
                                                                      onPressed: () {
                                                                        setState(() {
                                                                          gorevGunuTekrarSayisi=0;
                                                                          _controller.yeniGorevGunuTekrarSayisi.value = gorevGunuTekrarSayisi;
                                                                        });
                                                                        Get.back();
                                                                      },
                                                                      color: Color.fromRGBO(0, 179, 134, 1.0),
                                                                    ),
                                                                  ]).show();

                                                            } else if(_popupselection4.toString()=="Haftanın belirli günleri"){
                                                              List <String> haftaninGunleri=['Pazartesi','Salı','Çarşamba','Perşembe','Cuma','Cumartesi','Pazar'];
                                                              var values= await showDialogGroupedCheckbox(
                                                                  context: context,
                                                                  cancelDialogText: "Geri Al",
                                                                  isMultiSelection: true,
                                                                  itemsTitle: haftaninGunleri,
                                                                  submitDialogText: "Seç",
                                                                  dialogTitle:Text("Haftanın belirli günleri",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)) ,
                                                                  values: List.generate(7, (index) => index));
                                                              if (values!=null) {
                                                                setState(() {
                                                                  //Seçilen günlerin sayısal karşılıkları küçükten büyüğe sıralanıyor
                                                                  late int araDegisken;
                                                                  for(int i=0;i<values.length;i++)
                                                                    for(int j=values.length-1;j>i;j--)
                                                                      if(values[j]<values[j-1]) {
                                                                        araDegisken=values[j-1];
                                                                        values[j-1]=values[j];
                                                                        values[j]=araDegisken;
                                                                      }
                                                                  //Tekrarda belirtilen gün eğer tarihe uymuyorsa tarih değiştiriliyor
                                                                  DateTime t=DateTime.parse(yarinTarih);
                                                                  int kacinciGun=t.weekday;
                                                                  //Açılan checkbox menüsünde ptesi 0.değer olarak gözüküyor ama weekday özelliğinde 1 olarak gözüküyor.Bunun için
                                                                  //1 eksiltiyoruz
                                                                  kacinciGun--;
                                                                  bool gunlerdenBiriMi=false;
                                                                  for(int i in values){
                                                                    if(kacinciGun==i) {
                                                                      gunlerdenBiriMi=true;
                                                                      _controller.yeniGorevTarih.value=yarinTarih;
                                                                      break;
                                                                    }
                                                                  }
                                                                  bool ileriTarih=false;
                                                                  if (gunlerdenBiriMi==false) {
                                                                    for(int i in values){
                                                                      if(i>kacinciGun){
                                                                        int gunFarki=i-kacinciGun;
                                                                        DateTime t=DateTime.parse((yarin.add(Duration(days: gunFarki))).toString());
                                                                        String dtTarih =DateFormat('yyyy-MM-dd').format(t);
                                                                        _controller.yeniGorevTarih.value=dtTarih;
                                                                        ileriTarih=true;
                                                                        break;
                                                                      }
                                                                    }
                                                                    if(ileriTarih==false){
                                                                      int gunFarki=7-(kacinciGun-int.parse(values[0].toString()));
                                                                      DateTime t=DateTime.parse((yarin.add(Duration(days: gunFarki))).toString());
                                                                      String dtTarih =DateFormat('yyyy-MM-dd').format(t);
                                                                      _controller.yeniGorevTarih.value=dtTarih;
                                                                    }
                                                                  }

                                                                  String gunler='';
                                                                  for (int i in values) {
                                                                    if (i==0) gunler+='Pt ';
                                                                    else if (i==1) gunler+='Sa ';
                                                                    else if (i==2) gunler+='Ça ';
                                                                    else if (i==3) gunler+='Pe ';
                                                                    else if (i==4) gunler+='Cu ';
                                                                    else if (i==5) gunler+='Ct ';
                                                                    else if (i==6) gunler+='Pa ';
                                                                  }
                                                                  _controller.yeniGorevTekrar.value=gunler;
                                                                });
                                                              }
                                                            }
                                                          },
                                                          child:  Row(
                                                            children: <Widget>[
                                                              SizedBox(
                                                                width: 120.0,
                                                                child: Obx(() =>
                                                                    Text(_controller.yeniGorevTekrar.value,
                                                                        style: TextStyle(color:Colors.redAccent,fontSize:14),
                                                                        textAlign: TextAlign.center
                                                                    )),
                                                              ),
                                                              Icon(Icons.arrow_drop_down,size:40.0),
                                                            ],
                                                          ),

                                                          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                                                            const PopupMenuItem<String>(
                                                              value: '1 kez',
                                                              child: const Text('1 kez',style: TextStyle(fontSize:12)),
                                                            ),
                                                            const PopupMenuItem<String>(
                                                              value: 'Her gün',
                                                              child: const Text('Her gün',style: TextStyle(fontSize:12)),
                                                            ),
                                                            const PopupMenuItem<String>(
                                                              value: 'Her hafta',
                                                              child: const Text('Her hafta',style: TextStyle(fontSize:12)),
                                                            ),
                                                            const PopupMenuItem<String>(
                                                              value: 'Her ay',
                                                              child: const Text('Her ay',style: TextStyle(fontSize:12)),
                                                            ),
                                                            const PopupMenuItem<String>(
                                                              value: 'Her yıl',
                                                              child: const Text('Her yıl',style: TextStyle(fontSize:12)),
                                                            ),
                                                            const PopupMenuItem<String>(
                                                              value: 'Belirli sayıda',
                                                              child: const Text('Belirli sayıda',style: TextStyle(fontSize:12)),
                                                            ),
                                                            const PopupMenuItem<String>(
                                                              value: 'Haftanın belirli günleri',
                                                              child: const Text('Haftanın belirli günleri',style: TextStyle(fontSize:12)),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ]),
                                              SizedBox(width: _w/40),
                                            ]),
                                        Row(
                                            children:[
                                              Text('İlişkili Beceri:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12)),
                                              ButtonBar(
                                                children: <Widget>[
                                                  PopupMenuButton<String>(
                                                    onSelected: (String value) {
                                                      setState(() {
                                                        _popupselection5 = value;
                                                        _controller.yeniGorevIliskiliBeceri.value=value;
                                                      });
                                                    },
                                                    child:
                                                    Row(
                                                      children: <Widget>[
                                                        SizedBox(
                                                          width: _w/4.11,
                                                          child: Obx(() =>
                                                              Text(_controller.yeniGorevIliskiliBeceri.value,
                                                                style: TextStyle(color:Colors.redAccent,fontSize:14),
                                                                textAlign: TextAlign.center,
                                                              )),
                                                        ),
                                                        Icon(Icons.arrow_drop_down,size:40.0),
                                                      ],
                                                    ),

                                                    itemBuilder: (BuildContext context) => iliskiliBeceriler.map<PopupMenuEntry<String>>((String beceri){
                                                      return PopupMenuItem<String>(
                                                        value: beceri,
                                                        child: Text(beceri,style: TextStyle(fontSize:12)),
                                                      );
                                                    }).toList(),
                                                  ),
                                                ],
                                              ),
                                            ]),
                                        Row(
                                          children:[
                                            const Text("Beceri TP:   ",style: TextStyle(fontWeight: FontWeight.bold,fontSize:12)),
                                            ButtonBar(
                                              children: <Widget>[
                                                SizedBox(
                                                  width: _w/8.22,
                                                  child: Obx(() =>
                                                      Text("  "+_controller.yeniGorevBeceriTP.value.toString(),
                                                          style: TextStyle(color:Colors.redAccent,fontSize:14),
                                                          textAlign: TextAlign.center
                                                      )),
                                                ),
                                                IconButton(
                                                  icon: const Icon(Icons.add),
                                                  onPressed: () {
                                                    setState(() {
                                                      if (BeceriTP<10){
                                                        BeceriTP++;
                                                        _controller.yeniGorevBeceriTP.value = BeceriTP;
                                                        control.text = "$BeceriTP";
                                                      }
                                                    });
                                                  } ,
                                                ),
                                                IconButton(
                                                  icon: const Icon(Icons.remove),
                                                  onPressed: () {
                                                    setState(() {
                                                      if (BeceriTP>0){
                                                        BeceriTP--;
                                                        _controller.yeniGorevBeceriTP.value = BeceriTP;
                                                        control.text = "$BeceriTP";
                                                      }
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "TAMAM",
                                          style: TextStyle(color: Colors.white, fontSize: 18),
                                        ),
                                        onPressed: () async {

                                          var gorev = Gorevler(
                                              no: _controller.yarinkiGorevler[index].no,
                                              ad: _controller.yeniGorevAdi.value,
                                              aciklama:_controller.yeniGorevAciklama.value,
                                              tarih: _controller.yeniGorevTarih.value,
                                              tekrar: _controller.yeniGorevTekrar.value,
                                              yapildi: _controller.yarinkiGorevler[index].yapildi,
                                              basariDurumu: _controller.yarinkiGorevler[index].basariDurumu,
                                              altin: _controller.yeniGorevAltin.value,
                                              TP: _controller.yeniGorevTP.value,
                                              beceriTP: _controller.yeniGorevBeceriTP.value,
                                              beceri: _controller.yeniGorevIliskiliBeceri.value,
                                              onem: _controller.yeniGorevOnem.value
                                          );

                                          await dosya.gorevGuncelle(gorev);

                                          // Ardından veritabanından tüm veriler okunarak listelere aktarılarak görev listeleri güncelleniyor
                                          await dosya.gorevListeOlustur().then((
                                              List tumGorevler) async {
                                            setState(() {
                                              _controller.tumGorevler.value = tumGorevler;
                                              _controller.tumGorevSayisi.value =
                                                  tumGorevler.length;
                                              karakter.tumGorevSayisi = tumGorevler.length;
                                              karakter.tumGorevler = tumGorevler;
                                            });
                                          });

                                          await dosya
                                              .gorevBugunTariheGoreListeOlustur()
                                              .then((List bugunkuGorevler) async {
                                            setState(() {
                                              _controller.bugunkuGorevler.value =
                                                  bugunkuGorevler;
                                              _controller.cBugunkuGorevSayisi.value =
                                                  bugunkuGorevler.length;
                                              karakter.bugunkuGorevler = bugunkuGorevler;
                                              karakter.bugunkuGorevSayisi =
                                                  bugunkuGorevler.length;
                                              _controller.popupMenuGorevSayisi.value =
                                                  _controller.cBugunkuGorevSayisi.value;
                                              _controller.secilenGorevler.value = bugunkuGorevler;
                                              _controller.secilenGorevSayisi.value = bugunkuGorevler.length;
                                            });
                                          });

                                          await dosya
                                              .gorevYarininTarihineGoreListeOlustur()
                                              .then((List yarinkiGorevler) async {
                                            setState(() {
                                              _controller.yarinkiGorevler.value =
                                                  yarinkiGorevler;
                                              _controller.yarinkiGorevSayisi.value =
                                                  yarinkiGorevler.length;
                                              karakter.yarinkiGorevler = yarinkiGorevler;
                                              karakter.yarinkiGorevSayisi =
                                                  yarinkiGorevler.length;
                                            });
                                          });

                                          await dosya.gorevGecmisListeOlustur()
                                              .then((gecmisGorevler) async {
                                            setState(() {
                                              _controller.gecmisGorevler.value = gecmisGorevler;
                                              _controller.gecmisGorevSayisi.value = gecmisGorevler.length;
                                              karakter.gecmisGorevler = gecmisGorevler;
                                              karakter.gecmisGorevSayisi = gecmisGorevler.length;
                                            });
                                          });

                                          await dosya.gorevGecikmisGorevListeOlustur().then((List gecikmisGorevler) async{
                                            if(gecikmisGorevler.length!=0) {
                                              setState(() {
                                                _controller.gecikmisGorevler.value = gecikmisGorevler;
                                                _controller.gecikmisGorevSayisi.value = gecikmisGorevler.length;
                                                karakter.gecikmisGorevler = gecikmisGorevler;
                                                karakter.gecikmisGorevSayisi = gecikmisGorevler.length;
                                              });
                                            }
                                          });

                                          await dosya.beceriListeOlustur().then((
                                              List tumBeceriler) async {
                                            setState(() {
                                              karakter.beceriSayisi = tumBeceriler.length;
                                            });
                                            _controller.beceriSayisi.value =
                                                tumBeceriler.length;
                                            _controller.beceriler.value = tumBeceriler;

                                            for (int i = 0; i < tumBeceriler.length; i++) {
                                              beceriler.beceriAdlari.add(
                                                  tumBeceriler[i].ad);
                                              beceriler.seviye.add(
                                                  tumBeceriler[i].seviye);
                                              beceriler.beceriTP.add(
                                                  tumBeceriler[i].beceriTP);
                                            }
                                          });

                                          await dosya.gorevGrafikListeOlustur().then((grafik) async {
                                            setState(() {
                                              _controller.grafikVeriSayisi.value=grafik.length;
                                              karakter.grafikVeriSayisi=grafik.length;

                                              _controller.grafik.value=grafik;
                                              karakter.grafik=grafik;
                                            });
                                          });

                                          await dosya.gorevGrafikListeOlustur2().then((grafik) async {
                                            setState(() {
                                              _controller.grafikVeriSayisi2.value=grafik.length;
                                              karakter.grafikVeriSayisi2=grafik.length;

                                              _controller.grafik2.value=grafik;
                                              karakter.grafik2=grafik;
                                            });
                                          });

                                          setState(() {
                                            //yeni görev için ekran temizleniyor
                                            _controller.yeniGorevAdi=''.obs;
                                            _controller.yeniGorevTarih=tarih.obs;
                                            _controller.yeniGorevTP=0.obs;
                                            _controller.yeniGorevAltin=0.obs;
                                            _controller.yeniGorevTekrar='1 kez'.obs;
                                            _controller.yeniGorevIliskiliBeceri='Aile'.obs;
                                            _controller.yeniGorevBeceriTP=0.obs;
                                          });

                                          Get.back();

                                        },
                                        color: Color.fromRGBO(0, 179, 134, 1.0),
                                      ),
                                      DialogButton(
                                        child: Text(
                                          "İPTAL",
                                          style: TextStyle(color: Colors.white, fontSize: 18),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _controller.yeniGorevAdi=''.obs;
                                            _controller.yeniGorevTarih=tarih.obs;
                                            _controller.yeniGorevTP=0.obs;
                                            _controller.yeniGorevAltin=0.obs;
                                            _controller.yeniGorevTekrar='1 kez'.obs;
                                            _controller.yeniGorevIliskiliBeceri='Aile'.obs;
                                            _controller.yeniGorevBeceriTP=0.obs;
                                          });

                                          Get.back();
                                        },
                                        gradient: LinearGradient(colors: [
                                          Color.fromRGBO(116, 116, 191, 1.0),
                                          Color.fromRGBO(52, 138, 199, 1.0)
                                        ]),
                                      )
                                    ],
                                  ).show();

                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.redo, color: Colors.blue, size: 18),
                                onPressed: () {
                                  Alert(
                                    context: context,
                                    type: AlertType.warning,
                                    style: alertStyle,
                                    title: "Bu görevi atlamak istediğinizden emin misiniz?",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "EVET",
                                          style: TextStyle(color: Colors.white, fontSize: 18),
                                        ),
                                        onPressed: () async {
                                          WidgetsBinding.instance!.addPostFrameCallback((_) async {
                                            await dosya.gorevSil(_controller.yarinkiGorevler[index].no);

                                            try{
                                              //Veri tabanındaki görev numaraları belirleniyor
                                              var gorevNumaralari=[];
                                              int enBuyukKayitNo=karakter.tumGorevSayisi;
                                              await dosya.gorevListeOlustur().then((List tumGorevler) async {
                                                setState(() {
                                                  karakter.tumGorevSayisi = tumGorevler.length;

                                                  //Veritabanında yapılan kayıtların numaraları yazılma-silinmeden dolayı değişiyor.İlkönce onları tespit ediyoruz.
                                                  for (int i = 0; i < karakter.tumGorevSayisi; i++) {
                                                    gorevNumaralari.add(tumGorevler[i].no);
                                                  }
                                                  //En büyük kayıt numarası tespit ediliyor

                                                  for (int i = 0; i < karakter.tumGorevSayisi; i++)
                                                    if (enBuyukKayitNo < gorevNumaralari[i])
                                                      enBuyukKayitNo = gorevNumaralari[i];
                                                });

                                              });
                                              //Eğer görevin tekrar durumu "Her gün" ise yarın için de aynı görev kaydediliyor
                                              if (_controller.yarinkiGorevler[index].tekrar=="Her gün"){
                                                //Veritabanına DateTime formatında kaydediyoruz
                                                //Bu sayede tarihe ekleme-çıkarmayı rahatlıkla yapabiliyoruz
                                                String t=_controller.yarinkiGorevler[index].tarih;
                                                DateTime dt=DateTime.parse(t).add(Duration(days: 1));
                                                //Tarih formatını 'dd-MM-yyyy' yazınca çalışmıyor :( Gün ekleme çalışmıyor
                                                String dtTarih =DateFormat('yyyy-MM-dd').format(dt);

                                                var gorev = Gorevler(
                                                  no: enBuyukKayitNo+1,
                                                  ad: _controller.yarinkiGorevler[index].ad,
                                                  aciklama:_controller.yarinkiGorevler[index].aciklama,
                                                  tarih: dtTarih,
                                                  tekrar: _controller.yarinkiGorevler[index].tekrar,
                                                  yapildi: "Hayır",
                                                  basariDurumu: '',
                                                  altin: _controller.yarinkiGorevler[index]
                                                      .altin,
                                                  TP: _controller.yarinkiGorevler[index].TP,
                                                  beceriTP: _controller.yarinkiGorevler[index].beceriTP,
                                                  beceri: _controller.yarinkiGorevler[index]
                                                      .beceri,
                                                  onem: _controller.yarinkiGorevler[index]
                                                      .onem,);

                                                await dosya.gorevEkle(gorev);
                                              }

                                              //Eğer görevin tekrar durumu "Her hafta" ise gelecek hafta için de aynı görev kaydediliyor
                                              else if (_controller.yarinkiGorevler[index].tekrar=="Her hafta"){
                                                //Veritabanına DateTime formatında kaydediyoruz
                                                //Bu sayede tarihe ekleme-çıkarmayı rahatlıkla yapabiliyoruz
                                                String t=_controller.yarinkiGorevler[index].tarih;
                                                DateTime dt=DateTime.parse(t).add(Duration(days: 7));
                                                String dtTarih =DateFormat('yyyy-MM-dd').format(dt);

                                                var gorev = Gorevler(
                                                  no: enBuyukKayitNo+1,
                                                  ad: _controller.yarinkiGorevler[index].ad,
                                                  aciklama:_controller.yarinkiGorevler[index].aciklama,
                                                  tarih: dtTarih,
                                                  tekrar: _controller.yarinkiGorevler[index].tekrar,
                                                  yapildi: "Hayır",
                                                  basariDurumu: '',
                                                  altin: _controller.yarinkiGorevler[index]
                                                      .altin,
                                                  TP: _controller.yarinkiGorevler[index].TP,
                                                  beceriTP: _controller.yarinkiGorevler[index].beceriTP,
                                                  beceri: _controller.yarinkiGorevler[index]
                                                      .beceri,
                                                  onem: _controller.yarinkiGorevler[index]
                                                      .onem,);
                                                await dosya.gorevEkle(gorev);
                                              }

                                              //Eğer görevin tekrar durumu "Her ay" ise gelecek hafta için de aynı görev kaydediliyor
                                              else if (_controller.yarinkiGorevler[index].tekrar=="Her ay"){
                                                //Veritabanına DateTime formatında kaydediyoruz
                                                //Bu sayede tarihe ekleme-çıkarmayı rahatlıkla yapabiliyoruz
                                                String t=_controller.yarinkiGorevler[index].tarih;
                                                DateTime dt=DateTime.parse(t).add(Duration(days: 30));
                                                String dtTarih =DateFormat('yyyy-MM-dd').format(dt);

                                                var gorev = Gorevler(
                                                  no: enBuyukKayitNo+1,
                                                  ad: _controller.yarinkiGorevler[index].ad,
                                                  aciklama:_controller.yarinkiGorevler[index].aciklama,
                                                  tarih: dtTarih,
                                                  tekrar: _controller.yarinkiGorevler[index].tekrar,
                                                  yapildi: "Hayır",
                                                  basariDurumu: '',
                                                  altin: _controller.yarinkiGorevler[index]
                                                      .altin,
                                                  TP: _controller.yarinkiGorevler[index].TP,
                                                  beceriTP: _controller.yarinkiGorevler[index].beceriTP,
                                                  beceri: _controller.yarinkiGorevler[index]
                                                      .beceri,
                                                  onem: _controller.yarinkiGorevler[index]
                                                      .onem,);
                                                await dosya.gorevEkle(gorev);
                                              }

                                              //Eğer görevin tekrar durumu "Her yıl" ise gelecek hafta için de aynı görev kaydediliyor
                                              else if (_controller.yarinkiGorevler[index].tekrar=="Her yıl"){
                                                //Veritabanına DateTime formatında kaydediyoruz
                                                //Bu sayede tarihe ekleme-çıkarmayı rahatlıkla yapabiliyoruz
                                                String t=_controller.yarinkiGorevler[index].tarih;
                                                DateTime dt=DateTime.parse(t).add(Duration(days: 365));
                                                String dtTarih =DateFormat('yyyy-MM-dd').format(dt);

                                                var gorev = Gorevler(
                                                  no: enBuyukKayitNo+1,
                                                  ad: _controller.yarinkiGorevler[index].ad,
                                                  aciklama:_controller.yarinkiGorevler[index].aciklama,
                                                  tarih: dtTarih,
                                                  tekrar: _controller.yarinkiGorevler[index].tekrar,
                                                  yapildi: "Hayır",
                                                  basariDurumu: '',
                                                  altin: _controller.yarinkiGorevler[index]
                                                      .altin,
                                                  TP: _controller.yarinkiGorevler[index].TP,
                                                  beceriTP: _controller.yarinkiGorevler[index].beceriTP,
                                                  beceri: _controller.yarinkiGorevler[index]
                                                      .beceri,
                                                  onem: _controller.yarinkiGorevler[index]
                                                      .onem,);
                                                await dosya.gorevEkle(gorev);
                                              }

                                              else if (ayristirilanMetin[0]!='1' && ayristirilanMetin[1]=='kez'){
                                                int deger=int.parse(ayristirilanMetin[0])-1;
                                                //Veritabanına DateTime formatında kaydediyoruz
                                                //Bu sayede tarihe ekleme-çıkarmayı rahatlıkla yapabiliyoruz
                                                String t=_controller.yarinkiGorevler[index].tarih;
                                                DateTime dt=DateTime.parse(t).add(Duration(days: 1));
                                                String dtTarih =DateFormat('yyyy-MM-dd').format(dt);

                                                if (deger!=0){
                                                  //Veri tabanındaki görev numaraları belirleniyor
                                                  var gorevNumaralari=[];
                                                  int enBuyukKayitNo=karakter.yarinkiGorevSayisi;
                                                  await dosya.gorevListeOlustur().then((List yarinkiGorevler) async {
                                                    setState(() {
                                                      karakter.yarinkiGorevSayisi = yarinkiGorevler.length;
                                                      //Veritabanında yapılan kayıtların numaraları yazılma-silinmeden dolayı değişiyor.İlkönce onları tespit ediyoruz.
                                                      for (int i = 0; i < karakter.yarinkiGorevSayisi; i++) {
                                                        gorevNumaralari.add(yarinkiGorevler[i].no);
                                                      }
                                                      //En büyük kayıt numarası tespit ediliyor
                                                      for (int i = 0; i < karakter.yarinkiGorevSayisi; i++)
                                                        if (enBuyukKayitNo < gorevNumaralari[i]) enBuyukKayitNo = gorevNumaralari[i];
                                                    });

                                                  });

                                                  var gorev = Gorevler(
                                                    no: enBuyukKayitNo+1,
                                                    ad: _controller.yarinkiGorevler[index].ad,
                                                    aciklama:_controller.yarinkiGorevler[index].aciklama,
                                                    tarih: dtTarih,
                                                    tekrar: deger.toString()+' kez',
                                                    yapildi: "Hayır",
                                                    basariDurumu: '',
                                                    altin: _controller.yarinkiGorevler[index].altin,
                                                    TP: _controller.yarinkiGorevler[index].TP,
                                                    beceriTP: _controller.yarinkiGorevler[index].beceriTP,
                                                    beceri: _controller.yarinkiGorevler[index].beceri,
                                                    onem: _controller.yarinkiGorevler[index].onem,);
                                                  await dosya.gorevEkle(gorev);
                                                }
                                              }
                                            } catch (e) {
                                              print("Görev yüklenemedi");
                                            }


                                            // Ardından veritabanından tüm veriler okunarak listelere aktarılarak görev listeleri güncelleniyor
                                            await dosya.gorevListeOlustur().then((
                                                List tumGorevler) async {
                                              setState(() {
                                                _controller.tumGorevler.value = tumGorevler;
                                                _controller.tumGorevSayisi.value =
                                                    tumGorevler.length;
                                                karakter.tumGorevSayisi = tumGorevler.length;
                                                karakter.tumGorevler = tumGorevler;
                                              });
                                            });

                                            await dosya
                                                .gorevBugunTariheGoreListeOlustur()
                                                .then((List bugunkuGorevler) async {
                                              setState(() {
                                                _controller.bugunkuGorevler.value =
                                                    bugunkuGorevler;
                                                _controller.cBugunkuGorevSayisi.value =
                                                    bugunkuGorevler.length;
                                                karakter.bugunkuGorevler = bugunkuGorevler;
                                                karakter.bugunkuGorevSayisi =
                                                    bugunkuGorevler.length;
                                                _controller.popupMenuGorevSayisi.value =
                                                    _controller.cBugunkuGorevSayisi.value;
                                                _controller.secilenGorevler.value = bugunkuGorevler;
                                                _controller.secilenGorevSayisi.value = bugunkuGorevler.length;
                                              });
                                            });

                                            await dosya
                                                .gorevYarininTarihineGoreListeOlustur()
                                                .then((List yarinkiGorevler) async {
                                              setState(() {
                                                _controller.yarinkiGorevler.value =
                                                    yarinkiGorevler;
                                                _controller.yarinkiGorevSayisi.value =
                                                    yarinkiGorevler.length;
                                                karakter.yarinkiGorevler = yarinkiGorevler;
                                                karakter.yarinkiGorevSayisi =
                                                    yarinkiGorevler.length;
                                              });
                                            });

                                            await dosya.gorevGecmisListeOlustur()
                                                .then((gecmisGorevler) async {
                                              setState(() {
                                                _controller.gecmisGorevler.value = gecmisGorevler;
                                                _controller.gecmisGorevSayisi.value = gecmisGorevler.length;
                                                karakter.gecmisGorevler = gecmisGorevler;
                                                karakter.gecmisGorevSayisi = gecmisGorevler.length;
                                              });
                                            });

                                            await dosya.gorevGecikmisGorevListeOlustur().then((List gecikmisGorevler) async{
                                              if(gecikmisGorevler.length!=0) {
                                                setState(() {
                                                  _controller.gecikmisGorevler.value = gecikmisGorevler;
                                                  _controller.gecikmisGorevSayisi.value = gecikmisGorevler.length;
                                                  karakter.gecikmisGorevler = gecikmisGorevler;
                                                  karakter.gecikmisGorevSayisi = gecikmisGorevler.length;
                                                });
                                              }
                                            });

                                            await dosya.beceriListeOlustur().then((
                                                List tumBeceriler) async {
                                              setState(() {
                                                karakter.beceriSayisi = tumBeceriler.length;
                                              });
                                              _controller.beceriSayisi.value =
                                                  tumBeceriler.length;
                                              _controller.beceriler.value = tumBeceriler;

                                              for (int i = 0; i < tumBeceriler.length; i++) {
                                                beceriler.beceriAdlari.add(
                                                    tumBeceriler[i].ad);
                                                beceriler.seviye.add(
                                                    tumBeceriler[i].seviye);
                                                beceriler.beceriTP.add(
                                                    tumBeceriler[i].beceriTP);
                                              }
                                            });


                                            if (karakter.yarinkiGorevSayisi==0)
                                              Center(child: Text("Yarın göreviniz bulunmamaktadır..."));

                                            await dosya.gorevGrafikListeOlustur().then((List grafik) async{
                                              setState(() {
                                                _controller.grafik.value=grafik;
                                                _controller.grafikVeriSayisi.value=grafik.length;
                                                karakter.grafik=grafik;
                                                karakter.grafikVeriSayisi=grafik.length;
                                              });
                                            });

                                            await dosya.gorevGrafikListeOlustur2().then((List grafik) async{
                                              setState(() {
                                                _controller.grafik2.value=grafik;
                                                _controller.grafikVeriSayisi2.value=grafik.length;
                                                karakter.grafik2=grafik;
                                                karakter.grafikVeriSayisi2=grafik.length;
                                              });
                                            });
                                          });

                                          Get.back();
                                        },
                                        color: Color.fromRGBO(0, 179, 134, 1.0),
                                      ),
                                      DialogButton(
                                        child: Text(
                                          "HAYIR",
                                          style: TextStyle(color: Colors.white, fontSize: 18),
                                        ),
                                        onPressed: () {
                                          Get.back();
                                        },
                                        gradient: LinearGradient(colors: [
                                          Color.fromRGBO(116, 116, 191, 1.0),
                                          Color.fromRGBO(52, 138, 199, 1.0)
                                        ]),
                                      )
                                    ],
                                  ).show();
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                      onLongPress: (){
                        Alert(
                            context: context,
                            type: AlertType.warning,
                            style: alertStyle,
                            title: 'Görevi silmek istediğinizden emin misiniz?',
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "EVET",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                onPressed: () {

                                  WidgetsBinding.instance!.addPostFrameCallback((_) async {
                                    //Görev veritabanından siliniyor
                                    await dosya.gorevSil(_controller.yarinkiGorevler[index].no);
                                    // Veritabanından tüm veriler okunarak listelere aktarılarak görev listeleri güncelleniyor
                                    await dosya.gorevListeOlustur().then((
                                        List tumGorevler) async {
                                      setState(() {
                                        _controller.tumGorevler.value = tumGorevler;
                                        _controller.tumGorevSayisi.value =
                                            tumGorevler.length;
                                        karakter.tumGorevSayisi = tumGorevler.length;
                                        karakter.tumGorevler = tumGorevler;
                                      });
                                    });

                                    await dosya
                                        .gorevBugunTariheGoreListeOlustur()
                                        .then((List bugunkuGorevler) async {
                                      setState(() {
                                        _controller.bugunkuGorevler.value =
                                            bugunkuGorevler;
                                        _controller.cBugunkuGorevSayisi.value =
                                            bugunkuGorevler.length;
                                        karakter.bugunkuGorevler = bugunkuGorevler;
                                        karakter.bugunkuGorevSayisi =
                                            bugunkuGorevler.length;
                                        _controller.popupMenuGorevSayisi.value =
                                            _controller.cBugunkuGorevSayisi.value;
                                        _controller.secilenGorevler.value = bugunkuGorevler;
                                        _controller.secilenGorevSayisi.value = bugunkuGorevler.length;
                                      });
                                    });

                                    await dosya
                                        .gorevYarininTarihineGoreListeOlustur()
                                        .then((List yarinkiGorevler) async {
                                      setState(() {
                                        _controller.yarinkiGorevler.value =
                                            yarinkiGorevler;
                                        _controller.yarinkiGorevSayisi.value =
                                            yarinkiGorevler.length;
                                        karakter.yarinkiGorevler = yarinkiGorevler;
                                        karakter.yarinkiGorevSayisi =
                                            yarinkiGorevler.length;
                                      });
                                    });

                                    await dosya.gorevGecmisListeOlustur()
                                        .then((gecmisGorevler) async {
                                      setState(() {
                                        _controller.gecmisGorevler.value = gecmisGorevler;
                                        _controller.gecmisGorevSayisi.value = gecmisGorevler.length;
                                        karakter.gecmisGorevler = gecmisGorevler;
                                        karakter.gecmisGorevSayisi = gecmisGorevler.length;
                                      });
                                    });

                                    await dosya.gorevGecikmisGorevListeOlustur().then((List gecikmisGorevler) async{
                                      if(gecikmisGorevler.length!=0) {
                                        setState(() {
                                          _controller.gecikmisGorevler.value = gecikmisGorevler;
                                          _controller.gecikmisGorevSayisi.value = gecikmisGorevler.length;
                                          karakter.gecikmisGorevler = gecikmisGorevler;
                                          karakter.gecikmisGorevSayisi = gecikmisGorevler.length;
                                        });
                                      }
                                    });

                                    await dosya.beceriListeOlustur().then((
                                        List tumBeceriler) async {
                                      setState(() {
                                        karakter.beceriSayisi = tumBeceriler.length;
                                      });
                                      _controller.beceriSayisi.value =
                                          tumBeceriler.length;
                                      _controller.beceriler.value = tumBeceriler;

                                      for (int i = 0; i < tumBeceriler.length; i++) {
                                        beceriler.beceriAdlari.add(
                                            tumBeceriler[i].ad);
                                        beceriler.seviye.add(
                                            tumBeceriler[i].seviye);
                                        beceriler.beceriTP.add(
                                            tumBeceriler[i].beceriTP);
                                      }
                                    });

                                    await dosya.gorevGrafikListeOlustur().then((List grafik) async{
                                      setState(() {
                                        _controller.grafik.value=grafik;
                                        _controller.grafikVeriSayisi.value=grafik.length;
                                        karakter.grafik=grafik;
                                        karakter.grafikVeriSayisi=grafik.length;
                                      });
                                    });

                                    await dosya.gorevGrafikListeOlustur2().then((List grafik) async{
                                      setState(() {
                                        _controller.grafik2.value=grafik;
                                        _controller.grafikVeriSayisi2.value=grafik.length;
                                        karakter.grafik2=grafik;
                                        karakter.grafikVeriSayisi2=grafik.length;
                                      });
                                    });

                                  });

                                  //yeni görev için ekran temizleniyor
                                  _controller.yeniGorevAdi=''.obs;
                                  _controller.yeniGorevTarih=tarih.obs;
                                  _controller.yeniGorevTP=0.obs;
                                  _controller.yeniGorevAltin=0.obs;
                                  _controller.yeniGorevTekrar='1 kez'.obs;
                                  _controller.yeniGorevIliskiliBeceri='Aile'.obs;
                                  _controller.yeniGorevBeceriTP=0.obs;

                                  Get.back();
                                },
                                gradient: LinearGradient(colors: [
                                  Color.fromRGBO(116, 116, 191, 1.0),
                                  Color.fromRGBO(52, 138, 199, 1.0)
                                ]),
                              ),
                              DialogButton(
                                child: Text(
                                  "GERİ AL",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                onPressed: () {
                                  Get.back();
                                },
                                color: Color.fromRGBO(0, 179, 134, 1.0),
                              ),
                            ]).show();
                      }
                  ),
                ),
              ),
            );
          },
        ),
      ),
      ),
    );
  }

}

