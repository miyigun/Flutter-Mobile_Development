import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../main.dart';
import 'YeniHedefEkle.dart';

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

class Hedefler extends StatefulWidget {
  @override
  _HedeflerState createState() => _HedeflerState();
}

class _HedeflerState extends State<Hedefler> {
  Controller _controller = Get.find();

  @override

  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(200, 240, 240, 1.0),
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Hedef belirle alışkanlık kazan",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
      ),
      body: Obx(() => AnimationLimiter(
      child: ListView.builder(
        padding: const EdgeInsets.only(left:5.0, right: 5.0, top: 5.0, bottom: 10.0),
        itemCount: _controller.hedefSayisi.value,
        itemBuilder: (context, index) {
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
                child: Obx(() => AnimationLimiter(
                child: Card(
                  //margin: EdgeInsets.only(left:_w/80, right:_w/80, top: _w/80),
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Container(
                    height: _w/0.63,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(187, 224, 248, 1.0),
                    ),
                    child: Row(
                      crossAxisAlignment : CrossAxisAlignment.start,
                      mainAxisAlignment:  MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: _w/1.0745,
                          child:  Column(
                            crossAxisAlignment : CrossAxisAlignment.start,
                            mainAxisAlignment:  MainAxisAlignment.start,
                            children: [
                              SizedBox(height: _w/80),
                              Row(
                                  crossAxisAlignment : CrossAxisAlignment.center,
                                  mainAxisAlignment:  MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: _w/8.22,
                                      height: _w/8,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          image: DecorationImage(
                                            image: AssetImage('assets/images/hedef.png'),
                                            fit: BoxFit.fill,
                                          )
                                      ),
                                    ),
                                    SizedBox(width: _w/16.44,),
                                    Container(
                                      width: _w/2.5,
                                      height: _w/8,
                                      padding: EdgeInsets.symmetric(horizontal: _w/30,vertical: _w/65),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text("Hedef no: "+(index+1).toString(),style: TextStyle(color: Colors.black, fontSize:14, fontWeight: FontWeight.bold)),
                                    ),
                                    SizedBox(width: _w/16.44,),
                                    Container(
                                      width: _w/3.5,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Row(
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.edit_outlined, color: Colors.black),
                                            onPressed: () {
                                              String _popupselection = _controller.hedefler[index].beceri;
                                              List<String> iliskiliBeceriler = List<String>.generate(beceriler.beceriAdlari.length, (i) => beceriler.beceriAdlari[i]);
                                              int TP = _controller.hedefler[index].TP;
                                              int BeceriTP = _controller.hedefler[index].beceriTP;
                                              int altin = _controller.hedefler[index].altin;
                                              int yapilacakGunSayisi=_controller.hedefler[index].yapilacakGun;

                                              //TextField'ın içeriğini bu şekilde kontrol ediyoruz
                                              final hedefAdiControl = TextEditingController();
                                              final bitTarihControl = TextEditingController();
                                              final control = TextEditingController();
                                              final control2 = TextEditingController();
                                              final control3 = TextEditingController();
                                              final iliskilibecericontrol = TextEditingController();
                                              final hedefYapilacakControl = TextEditingController();

                                              setState(() {
                                                hedefAdiControl.text =_controller.hedefler[index].hedef;
                                                _controller.yeniHedefAdi.value=_controller.hedefler[index].hedef;
                                                _controller.yeniHedefBasTarih.value=_controller.hedefler[index].basTarih;
                                                _controller.yeniHedefBitTarih.value=_controller.hedefler[index].bitTarih;
                                                control.text =_controller.hedefler[index].TP.toString();
                                                _controller.yeniHedefTP.value=_controller.hedefler[index].TP;
                                                control2.text =_controller.hedefler[index].altin.toString();
                                                _controller.yeniHedefAltin.value=_controller.hedefler[index].altin;
                                                iliskilibecericontrol.text =_controller.hedefler[index].beceri;
                                                _controller.yeniHedefIliskiliBeceri.value=_controller.hedefler[index].beceri;
                                                _controller.yeniHedefBeceriTP.value=_controller.hedefler[index].beceriTP;
                                                hedefYapilacakControl.text =_controller.hedefler[index].yapilacakGun.toString();
                                                _controller.yeniHedefYapilacakGunSayisi.value=_controller.hedefler[index].yapilacakGun;
                                              });

                                              Alert(
                                                  context: context,
                                                  type: AlertType.none,
                                                  style: alertStyle,
                                                  title: 'Hedefi Düzenle\n',
                                                  content: Column(
                                                      crossAxisAlignment : CrossAxisAlignment.start,
                                                      mainAxisAlignment : MainAxisAlignment.start,
                                                      children: [
                                                        TextField(
                                                          keyboardType: TextInputType.text,
                                                          controller: hedefAdiControl,
                                                          maxLength: 100,
                                                          showCursor: false,
                                                          style: TextStyle(fontSize: 12),
                                                          decoration: InputDecoration(
                                                            //icon: const Icon(Icons.arrow_right, size: 35.0),
                                                            labelText: 'Hedef...',
                                                            labelStyle: TextStyle(
                                                              fontSize: 12,
                                                            ),
                                                            border: const OutlineInputBorder(
                                                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                            ),
                                                          ),
                                                          onChanged: (String value) {
                                                            setState(() {
                                                              _controller.yeniHedefAdi.value = value;
                                                            });
                                                          },
                                                        ),
                                                        Row(
                                                            children: [
                                                              const Text('Tarih Aralığı:',
                                                                  style:
                                                                  TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                                              SizedBox(width: _w/8),
                                                              TextButton(
                                                                  child: Text('Seç',
                                                                      style:
                                                                      TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                                                  onPressed: () {
                                                                    Get.to(() => hedefTarihBelirle());
                                                                  }),
                                                            ]
                                                        ),
                                                        Row(
                                                          children: [
                                                            const Text('Başlangıç Tarihi:  ',
                                                                style:
                                                                TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                                            Obx(()=>
                                                             Text(DateFormat('dd/MM/yyyy').format(DateTime.parse((_controller.yeniHedefBasTarih).toString())),style: TextStyle(color: Colors.redAccent, fontSize: 14))),
                                                          ],
                                                        ),
                                                        SizedBox(height: _w/80),
                                                        Row(
                                                          children: [
                                                            const Text('Bitiş Tarihi:   ',
                                                                style:
                                                                TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                                            SizedBox(width: _w/13),
                                                            //Bu satırı yazmak yarım günüme mal oldu :(
                                                            Obx(()=>
                                                            Text(DateFormat('dd/MM/yyyy').format(DateTime.parse((_controller.yeniHedefBitTarih).toString())), style: TextStyle(color: Colors.redAccent, fontSize: 14))),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            const Text("TP:   ",
                                                                style:
                                                                TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                                                            ButtonBar(
                                                              children: <Widget>[
                                                                Obx(() => Text(
                                                                    "  " + _controller.yeniHedefTP.value.toString(),
                                                                    style:
                                                                    TextStyle(color: Colors.redAccent, fontSize: 14))),
                                                                IconButton(
                                                                  icon: const Icon(Icons.add,size: 20),
                                                                  onPressed: () {
                                                                    setState(() {
                                                                      if (TP < 100)
                                                                      {
                                                                        TP++;
                                                                        _controller.yeniHedefTP.value = TP;
                                                                        control.text = "$TP";
                                                                      }
                                                                    });
                                                                  },
                                                                ),
                                                                IconButton(
                                                                  icon: const Icon(Icons.remove,size: 20),
                                                                  onPressed: () {
                                                                    setState(() {
                                                                      if (TP > 0)
                                                                      {
                                                                        TP--;
                                                                        _controller.yeniHedefTP.value = TP;
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
                                                          children: [
                                                            const Text("Altın: ",
                                                                style:
                                                                TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                                                            ButtonBar(
                                                              children: <Widget>[
                                                                Obx(() => Text(
                                                                    _controller.yeniHedefAltin.value.toString(),
                                                                    style:
                                                                    TextStyle(color: Colors.redAccent, fontSize: 14))),
                                                                IconButton(
                                                                  icon: const Icon(Icons.add,size: 20),
                                                                  onPressed: () {
                                                                    setState(() {
                                                                      if (altin < 100)
                                                                      {
                                                                        altin++;
                                                                        _controller.yeniHedefAltin.value = altin;
                                                                        control2.text = "$altin";
                                                                      }
                                                                    });
                                                                  },
                                                                ),
                                                                IconButton(
                                                                  icon: const Icon(Icons.remove,size: 20),
                                                                  onPressed: () {
                                                                    setState(() {
                                                                      if (altin > 0)
                                                                      {
                                                                        altin--;
                                                                        _controller.yeniHedefAltin.value = altin;
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
                                                              Text('İlişkili Beceri:  ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12)),
                                                              ButtonBar(
                                                                  alignment: MainAxisAlignment.start,
                                                                children: <Widget>[
                                                                  PopupMenuButton<String>(
                                                                    onSelected: (String value) {
                                                                      setState(() {
                                                                        _popupselection = value;
                                                                        _controller.yeniHedefIliskiliBeceri.value=value;
                                                                      });
                                                                    },
                                                                    child:
                                                                    Row(
                                                                      children: <Widget>[
                                                                        Obx(() =>
                                                                            Text(_controller.yeniHedefIliskiliBeceri.value,
                                                                              style: TextStyle(color:Colors.redAccent,fontSize:14))),
                                                                        Icon(Icons.arrow_drop_down,size:30.0),
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
                                                          children: [
                                                            const Text("Beceri TP:   ",
                                                                style:
                                                                TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                                                            ButtonBar(
                                                              children: <Widget>[
                                                                Obx(() => Text(
                                                                    "  " + _controller.yeniHedefBeceriTP.value.toString(),
                                                                    style:
                                                                    TextStyle(color: Colors.redAccent, fontSize: 14),
                                                                    textAlign: TextAlign.center)),
                                                                IconButton(
                                                                  icon: const Icon(Icons.add,size: 20),
                                                                  onPressed: () {
                                                                    setState(() {
                                                                      if (BeceriTP < 100)
                                                                      {
                                                                        BeceriTP++;
                                                                        _controller.yeniHedefBeceriTP.value = BeceriTP;
                                                                        control.text = "$BeceriTP";
                                                                      }
                                                                    });
                                                                  },
                                                                ),
                                                                IconButton(
                                                                  icon: const Icon(Icons.remove,size: 20),
                                                                  onPressed: () {
                                                                    setState(() {
                                                                      if (BeceriTP > 0)
                                                                      {
                                                                        BeceriTP--;
                                                                        _controller.yeniHedefBeceriTP.value = BeceriTP;
                                                                        control.text = "$BeceriTP";
                                                                      }
                                                                    });
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            const Text("Gün Sayısı:",
                                                                style:
                                                                TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                                                            ButtonBar(
                                                              children: <Widget>[
                                                                Obx(() => Text(
                                                                    "  " + _controller.yeniHedefYapilacakGunSayisi.value.toString(),
                                                                    style:
                                                                    TextStyle(color: Colors.redAccent, fontSize: 14),
                                                                    textAlign: TextAlign.center)),
                                                                IconButton(
                                                                  icon: const Icon(Icons.add,size: 20),
                                                                  onPressed: () {
                                                                    setState(() {
                                                                      if (yapilacakGunSayisi < 100)
                                                                      {
                                                                        yapilacakGunSayisi++;
                                                                        _controller.yeniHedefYapilacakGunSayisi.value = yapilacakGunSayisi;
                                                                        control3.text = "$yapilacakGunSayisi";
                                                                      }
                                                                    });
                                                                  },
                                                                ),
                                                                IconButton(
                                                                  icon: const Icon(Icons.remove,size: 20),
                                                                  onPressed: () {
                                                                    setState(() {
                                                                      if (yapilacakGunSayisi > 0)
                                                                      {
                                                                        yapilacakGunSayisi--;
                                                                        _controller.yeniHedefYapilacakGunSayisi.value = yapilacakGunSayisi;
                                                                        control3.text = "$yapilacakGunSayisi";
                                                                      }
                                                                    });
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ]
                                                  ),
                                                  buttons: [
                                                    DialogButton(
                                                      child: Text(
                                                        "TAMAM",
                                                        style: TextStyle(
                                                            color: Colors.white, fontSize: 14),
                                                      ),
                                                      onPressed: () {

                                                        WidgetsBinding.instance!.addPostFrameCallback((_) async {

                                                          try{
                                                            //Görev seçildiğinde görev yapildi diye veritabanına kaydediliyor
                                                            var hedef = Hedef(
                                                                no: _controller.hedefler[index].no,
                                                                hedef: _controller.yeniHedefAdi.value,
                                                                yapilacakGun: _controller.yeniHedefYapilacakGunSayisi.value,
                                                                yapilanGun: _controller.hedefler[index].yapilanGun,
                                                                altin: _controller.yeniHedefAltin.value,
                                                                TP: _controller.yeniHedefTP.value,
                                                                beceri: _controller.yeniHedefIliskiliBeceri.value,
                                                                beceriTP: _controller.yeniHedefBeceriTP.value,
                                                                basTarih: _controller.yeniHedefBasTarih.value,
                                                                bitTarih: _controller.yeniHedefBitTarih.value,
                                                                yapildi: 'Hayır'
                                                            );
                                                            await dosya.hedefGuncelle(hedef);
                                                          } catch (e) {
                                                            print("Görev güncellenemedi");
                                                          }

                                                          // Ardından veritabanından tüm veriler okunarak listelere aktarılarak görev listeleri güncelleniyor
                                                          await dosya
                                                              .hedefListeOlustur()
                                                              .then((List hedefler) async {
                                                            setState(() {
                                                              _controller.hedefler.value = hedefler;
                                                              _controller.hedefSayisi.value = hedefler.length;
                                                              karakter.hedefler = hedefler;
                                                              karakter.hedefSayisi = hedefler.length;
                                                            });
                                                          });

                                                          setState(() {
                                                            _controller.yeniHedefAdi.value = '';
                                                            _controller.yeniHedefBitTarih.value = '';
                                                            _controller.yeniHedefBasTarih.value = '';
                                                            _controller.yeniHedefBeceriTP.value = 0;
                                                            _controller.yeniHedefIliskiliBeceri.value ='';
                                                            _controller.yeniHedefAltin.value = 0;
                                                            _controller.yeniHedefYapilacakGunSayisi.value =0;
                                                            _controller.yeniHedefTP.value = 0;
                                                          });

                                                          Fluttertoast.showToast(
                                                              msg: 'Hedef başarıyla kaydedildi',
                                                              toastLength: Toast.LENGTH_SHORT,
                                                              gravity: ToastGravity.BOTTOM,
                                                              timeInSecForIosWeb: 1,
                                                              backgroundColor: Colors.red,
                                                              textColor: Colors.white,
                                                              fontSize: 12.0);

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
                                                          _controller.yeniHedefAdi.value = '';
                                                          _controller.yeniHedefBitTarih.value = '';
                                                          _controller.yeniHedefBasTarih.value = '';
                                                          _controller.yeniHedefBeceriTP.value = 0;
                                                          _controller.yeniHedefIliskiliBeceri.value ='';
                                                          _controller.yeniHedefAltin.value = 0;
                                                          _controller.yeniHedefYapilacakGunSayisi.value =0;
                                                          _controller.yeniHedefTP.value = 0;
                                                        });
                                                        Get.back();
                                                      },
                                                      color: Color.fromRGBO(0, 179, 134, 1.0),
                                                    ),
                                                  ]).show();
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.delete_outlined, color: Colors.redAccent),
                                            onPressed: () {
                                              Alert(
                                                  context: context,
                                                  type: AlertType.warning,
                                                  style: alertStyle,
                                                  title: 'Hedefi silmek istediğinizden emin misiniz?',
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
                                                          await dosya.hedefSil(_controller.hedefler[index].no);
                                                          // Veritabanından tüm veriler okunarak listelere aktarılarak görev listeleri güncelleniyor
                                                          await dosya.hedefListeOlustur().then((List hedefler) async {
                                                            setState(() {
                                                              _controller.hedefler.value = hedefler;
                                                              _controller.hedefSayisi.value =
                                                                  hedefler.length;
                                                              karakter.hedefSayisi = hedefler.length;
                                                              karakter.hedefler = hedefler;
                                                            });
                                                          });
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

                                                        Get.back();
                                                      },
                                                      color: Color.fromRGBO(0, 179, 134, 1.0),
                                                    ),
                                                  ]).show();

                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]
                              ),
                              SizedBox(height: _w/80),
                              Container(
                                width: _w/1.001,
                                height: _w/3.5,
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
                                  mainAxisAlignment:  MainAxisAlignment.start,
                                  children: [
                                    Text(_controller.hedefler[index].hedef,style: TextStyle(color: Colors.black, fontSize:14, fontWeight: FontWeight.bold)),
                                    Text(''),
                                    //witOpacity deki değer(.4) .0 a yaklaştıkça görünmez oluyor. 1 de oldukça koyu gösteriyor
                                    Row(
                                        children:[
                                          Text('Başlama Tarihi: ',style: TextStyle(color: Colors.black, fontSize:12)),
                                          Obx(() =>
                                          //Bu satırı yazmak yarım günüme mal oldu :(
                                          Text(
                                              DateFormat('dd/MM/yyyy').format(DateTime.parse((_controller.hedefler[index].basTarih).toString())),
                                              style:
                                              TextStyle(color: Colors.redAccent, fontSize: 14),
                                              textAlign: TextAlign.center)),
                                        ]),
                                    Text(''),
                                    Row(
                                        children:[
                                          Text('Bitiş Tarihi:         ',style: TextStyle(color: Colors.black, fontSize:12)),
                                          Obx(() =>
                                          //Bu satırı yazmak yarım günüme mal oldu :(
                                          Text(
                                              DateFormat('dd/MM/yyyy').format(DateTime.parse((_controller.hedefler[index].bitTarih).toString())),
                                              style:
                                              TextStyle(color: Colors.redAccent, fontSize: 14),
                                              textAlign: TextAlign.center)),
                                        ]),
                                  ],
                                ),
                              ),
                              SizedBox(height: _w/80),
                              Row(
                                crossAxisAlignment : CrossAxisAlignment.start,
                                mainAxisAlignment:  MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: _w/3,
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
                                        Text("TP: "+_controller.hedefler[index].TP.toString(),style: TextStyle(color: Colors.black,fontSize:12)),
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
                                              Text("  "+_controller.hedefler[index].altin.toString(),style: TextStyle(color: Colors.black,fontSize:12)),
                                            ]
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: _w/20),
                                  Container(
                                    width: _w/1.85,
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
                                        Text(_controller.hedefler[index].beceri,style: TextStyle(color: Colors.black,fontSize:12)),
                                        Text("TP:  "+_controller.hedefler[index].beceriTP.toString(),style: TextStyle(color: Colors.black,fontSize:12)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: _w/80),
                              Container(
                                width: _w/1.4,
                                height: _w/7,
                                //padding: EdgeInsets.symmetric(horizontal: _w/30,vertical: _w/65),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  crossAxisAlignment : CrossAxisAlignment.center,
                                  mainAxisAlignment:  MainAxisAlignment.start,
                                  children: [
                                    SizedBox(width: _w/40),
                                    Text("Yapılan:   ",style: TextStyle(fontWeight: FontWeight.bold,fontSize:14)),
                                    ButtonBar(
                                      children: <Widget>[
                                        SizedBox(
                                          width: _w/8.22,
                                          child: Obx(() =>
                                              Text(_controller.hedefler[index].yapilanGun.toString()+"/"+_controller.hedefler[index].yapilacakGun.toString(),
                                                  style: TextStyle(color:Colors.redAccent,fontSize:14),
                                                  textAlign: TextAlign.center
                                              )),
                                        ),
                                        IconButton(
                                            icon: const Icon(Icons.add,size:20),
                                            onPressed: () async {
                                              int yapilanGun=_controller.hedefler[index].yapilanGun;
                                              int yapilacakGun=_controller.hedefler[index].yapilacakGun;
                                              if (yapilanGun < yapilacakGun) {
                                                yapilanGun++;
                                                Icon(Icons.add,color: Colors.red);

                                                var hedef = Hedef(
                                                  no: _controller
                                                      .hedefler[index].no,
                                                  hedef: _controller
                                                      .hedefler[index].hedef,
                                                  yapilacakGun: _controller
                                                      .hedefler[index]
                                                      .yapilacakGun,
                                                  yapilanGun: yapilanGun,
                                                  altin: _controller
                                                      .hedefler[index].altin,
                                                  TP: _controller
                                                      .hedefler[index].TP,
                                                  beceri: _controller
                                                      .hedefler[index].beceri,
                                                  beceriTP: _controller
                                                      .hedefler[index].beceriTP,
                                                  basTarih: _controller
                                                      .hedefler[index].basTarih,
                                                  bitTarih: _controller
                                                      .hedefler[index].bitTarih,
                                                  yapildi: 'Hayır'
                                                );

                                                await dosya.hedefGuncelle(hedef);

                                                await dosya.hedefListeOlustur()
                                                    .then((List hedefler) async {
                                                  setState(() {
                                                    _controller.hedefler.value =
                                                        hedefler;
                                                    _controller.hedefSayisi
                                                        .value = hedefler.length;
                                                    karakter.hedefler = hedefler;
                                                    karakter.hedefSayisi =
                                                        hedefler.length;
                                                  });
                                                });
                                              }
                                              if (yapilanGun == yapilacakGun){
                                                Alert(
                                                  context: context,
                                                  style: alertStyle,
                                                  title: "TEBRİKLER!",
                                                  desc: "Hedefinize ulaştınız\n\nÖdül:\n+"+(_controller.hedefler[index].TP).toString()+"  TP\n+"+
                                                      (_controller.hedefler[index].altin).toString()+"  altın\n\nİlişkili Beceri:\n+"+
                                                      (_controller.hedefler[index].beceriTP).toString()+"  TP "+(_controller.hedefler[index].beceri).toString(),
                                                  buttons: [
                                                    DialogButton(
                                                      child: Text(
                                                        "TAMAM",
                                                        style: TextStyle(color: Colors.white, fontSize: 15),
                                                      ),
                                                      onPressed: () {

                                                        WidgetsBinding.instance!.addPostFrameCallback((_) async {
                                                          //Maalesef tek satırda eşitlenmiyor. Bu yolu bulmak için çok uğraştım :(
                                                          int TP = _controller.hedefler[index].TP;
                                                          karakter.TP += TP;
                                                          _controller.karakterTP.value=karakter.TP;
                                                          int altin = _controller.hedefler[index].altin;
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

                                                            String a=DateFormat('dd/MM/yyyy').format(now);

                                                            Alert(
                                                                context: context,
                                                                type: AlertType.none,
                                                                style: alertStyle,
                                                                title: "Tebrikler 1 başarı elde ettiniz!\n",
                                                                desc: a+"\n\n20 altınınız oldu!\n\n"+
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

                                                            String a=DateFormat('dd/MM/yyyy').format(now);

                                                            Alert(
                                                                context: context,
                                                                type: AlertType.none,
                                                                style: alertStyle,
                                                                title: "Tebrikler 1 başarı elde ettiniz!\n",
                                                                desc: a+"\n\n50 altınınız oldu!\n\n"+
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

                                                            String a=DateFormat('dd/MM/yyyy').format(now);

                                                            Alert(
                                                                context: context,
                                                                type: AlertType.none,
                                                                style: alertStyle,
                                                                title: "Tebrikler 1 başarı elde ettiniz!\n",
                                                                desc: a+"\n\n100 altınınız oldu!\n\n"+
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

                                                              String a=DateFormat('dd/MM/yyyy').format(now);

                                                              Alert(
                                                                  context: context,
                                                                  type: AlertType.none,
                                                                  style: alertStyle,
                                                                  title: "Tebrikler 1 başarı elde ettiniz!\n",
                                                                  desc: a+"\n\nKarakter seviyeniz 2 oldu!\n\n"+
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

                                                              String a=DateFormat('dd/MM/yyyy').format(now);

                                                              Alert(
                                                                  context: context,
                                                                  type: AlertType.none,
                                                                  style: alertStyle,
                                                                  title: "Tebrikler 1 başarı elde ettiniz!\n",
                                                                  desc: a+"\n\nKarakter seviyeniz 3 oldu!\n\n"+
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

                                                              String a=DateFormat('dd/MM/yyyy').format(now);

                                                              Alert(
                                                                  context: context,
                                                                  type: AlertType.none,
                                                                  style: alertStyle,
                                                                  title: "Tebrikler 1 başarı elde ettiniz!\n",
                                                                  desc: a+"\n\nKarakter seviyeniz 4 oldu!\n\n"+
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
                                                          String beceri = _controller.bugunkuGorevler[index].beceri;
                                                          int beceriTP = _controller.bugunkuGorevler[index].beceriTP;
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
                                                        });

                                                        WidgetsBinding.instance!.addPostFrameCallback((_) async {

                                                          var hedef = Hedef(
                                                              no: _controller.hedefler[index].no,
                                                              hedef: _controller.hedefler[index].hedef,
                                                              yapilacakGun: _controller.hedefler[index].yapilacakGun,
                                                              yapilanGun: _controller.hedefler[index].yapilanGun,
                                                              altin: _controller.hedefler[index].altin,
                                                              TP: _controller.hedefler[index].TP,
                                                              beceri: _controller.hedefler[index].beceri,
                                                              beceriTP: _controller.hedefler[index].beceriTP,
                                                              basTarih: _controller.hedefler[index].basTarih,
                                                              bitTarih: tarih,
                                                              yapildi: 'Evet'

                                                          );
                                                          await dosya.hedefGuncelle(hedef).then((_)  async{}) ;

                                                          // Ardından veritabanından tüm veriler okunarak listelere aktarılarak görev listeleri güncelleniyor
                                                          await dosya.hedefListeOlustur().then((List hedefler) async{
                                                            setState(() {
                                                              _controller.hedefler.value = hedefler;
                                                              _controller.hedefSayisi.value = hedefler.length;
                                                              karakter.hedefler = hedefler;
                                                              karakter.hedefSayisi = hedefler.length;
                                                            });
                                                          });
                                                        });

                                                        Get.back();
                                                      },
                                                      color: Color.fromRGBO(0, 179, 134, 1.0),
                                                      radius: BorderRadius.circular(0.0),
                                                    ),
                                                  ],
                                                ).show();
                                              }
                                            }
                                        ),
                                        IconButton(
                                            icon: const Icon(Icons.remove,size:20),
                                            onPressed: () async {
                                              int yapilanGun=_controller.hedefler[index].yapilanGun;
                                              int yapilacakGun=_controller.hedefler[index].yapilacakGun;
                                              if (yapilanGun >0) {
                                                setState(() {
                                                  yapilanGun--;
                                                });

                                                var hedef = Hedef(
                                                    no: _controller
                                                        .hedefler[index].no,
                                                    hedef: _controller
                                                        .hedefler[index].hedef,
                                                    yapilacakGun: _controller
                                                        .hedefler[index]
                                                        .yapilacakGun,
                                                    yapilanGun: yapilanGun,
                                                    altin: _controller
                                                        .hedefler[index].altin,
                                                    TP: _controller
                                                        .hedefler[index].TP,
                                                    beceri: _controller
                                                        .hedefler[index].beceri,
                                                    beceriTP: _controller
                                                        .hedefler[index].beceriTP,
                                                    basTarih: _controller
                                                        .hedefler[index].basTarih,
                                                    bitTarih: _controller
                                                        .hedefler[index].bitTarih,
                                                    yapildi: 'Hayır'
                                                );

                                                await dosya.hedefGuncelle(hedef);

                                                await dosya.hedefListeOlustur()
                                                    .then((List hedefler) async {
                                                  setState(() {
                                                    _controller.hedefler.value =
                                                        hedefler;
                                                    _controller.hedefSayisi
                                                        .value = hedefler.length;
                                                    karakter.hedefler = hedefler;
                                                    karakter.hedefSayisi =
                                                        hedefler.length;
                                                  });
                                                });
                                              }
                                              if (yapilanGun == yapilacakGun){
                                                Alert(
                                                  context: context,
                                                  style: alertStyle,
                                                  title: "TEBRİKLER!",
                                                  desc: "Hedefinize ulaştınız\n\nÖdül:\n+"+(_controller.hedefler[index].TP).toString()+"  TP\n+"+
                                                      (_controller.hedefler[index].altin).toString()+"  altın\n\nİlişkili Beceri:\n+"+
                                                      (_controller.hedefler[index].beceriTP).toString()+"  TP "+(_controller.hedefler[index].beceri).toString(),
                                                  buttons: [
                                                    DialogButton(
                                                      child: Text(
                                                        "TAMAM",
                                                        style: TextStyle(color: Colors.white, fontSize: 15),
                                                      ),
                                                      onPressed: () {

                                                        WidgetsBinding.instance!.addPostFrameCallback((_) async {
                                                          //Maalesef tek satırda eşitlenmiyor. Bu yolu bulmak için çok uğraştım :(
                                                          int TP = _controller.hedefler[index].TP;
                                                          karakter.TP += TP;
                                                          _controller.karakterTP.value=karakter.TP;
                                                          int altin = _controller.hedefler[index].altin;
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

                                                            String a=DateFormat('dd/MM/yyyy').format(now);

                                                            Alert(
                                                                context: context,
                                                                type: AlertType.none,
                                                                style: alertStyle,
                                                                title: "Tebrikler 1 başarı elde ettiniz!\n",
                                                                desc: a+"\n\n20 altınınız oldu!\n\n"+
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

                                                            String a=DateFormat('dd/MM/yyyy').format(now);

                                                            Alert(
                                                                context: context,
                                                                type: AlertType.none,
                                                                style: alertStyle,
                                                                title: "Tebrikler 1 başarı elde ettiniz!\n",
                                                                desc: a+"\n\n50 altınınız oldu!\n\n"+
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

                                                            String a=DateFormat('dd/MM/yyyy').format(now);

                                                            Alert(
                                                                context: context,
                                                                type: AlertType.none,
                                                                style: alertStyle,
                                                                title: "Tebrikler 1 başarı elde ettiniz!\n",
                                                                desc: a+"\n\n100 altınınız oldu!\n\n"+
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
                                                                setState(() {
                                                                  karakter.basariSayisi = tumBasarilar.length;
                                                                  _controller.basariSayisi.value = tumBasarilar.length;
                                                                  _controller.basarilar.value = tumBasarilar;
                                                                  karakter.basarilar=tumBasarilar;
                                                                });
                                                              });

                                                              String a=DateFormat('dd/MM/yyyy').format(now);

                                                              Alert(
                                                                  context: context,
                                                                  type: AlertType.none,
                                                                  style: alertStyle,
                                                                  title: "Tebrikler 1 başarı elde ettiniz!\n",
                                                                  desc: a+"\n\nKarakter seviyeniz 2 oldu!\n\n"+
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
                                                                setState(() {
                                                                  karakter.basariSayisi = tumBasarilar.length;
                                                                  _controller.basariSayisi.value = tumBasarilar.length;
                                                                  _controller.basarilar.value = tumBasarilar;
                                                                  karakter.basarilar=tumBasarilar;
                                                                });
                                                              });

                                                              String a=DateFormat('dd/MM/yyyy').format(now);

                                                              Alert(
                                                                  context: context,
                                                                  type: AlertType.none,
                                                                  style: alertStyle,
                                                                  title: "Tebrikler 1 başarı elde ettiniz!\n",
                                                                  desc: a+"\n\nKarakter seviyeniz 3 oldu!\n\n"+
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
                                                                setState(() {
                                                                  karakter.basariSayisi = tumBasarilar.length;
                                                                  _controller.basariSayisi.value = tumBasarilar.length;
                                                                  _controller.basarilar.value = tumBasarilar;
                                                                  karakter.basarilar=tumBasarilar;
                                                                });
                                                              });

                                                              String a=DateFormat('dd/MM/yyyy').format(now);

                                                              Alert(
                                                                  context: context,
                                                                  type: AlertType.none,
                                                                  style: alertStyle,
                                                                  title: "Tebrikler 1 başarı elde ettiniz!\n",
                                                                  desc: a+"\n\nKarakter seviyeniz 4 oldu!\n\n"+
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
                                                          String beceri = _controller.bugunkuGorevler[index].beceri;
                                                          int beceriTP = _controller.bugunkuGorevler[index].beceriTP;
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
                                                        });

                                                        WidgetsBinding.instance!.addPostFrameCallback((_) async {

                                                          var hedef = Hedef(
                                                              no: _controller.hedefler[index].no,
                                                              hedef: _controller.hedefler[index].hedef,
                                                              yapilacakGun: _controller.hedefler[index].yapilacakGun,
                                                              yapilanGun: _controller.hedefler[index].yapilanGun,
                                                              altin: _controller.hedefler[index].altin,
                                                              TP: _controller.hedefler[index].TP,
                                                              beceri: _controller.hedefler[index].beceri,
                                                              beceriTP: _controller.hedefler[index].beceriTP,
                                                              basTarih: _controller.hedefler[index].basTarih,
                                                              bitTarih: tarih,
                                                              yapildi: 'Hayır'
                                                          );
                                                          await dosya.hedefGuncelle(hedef).then((_)  async{}) ;

                                                          // Ardından veritabanından tüm veriler okunarak listelere aktarılarak görev listeleri güncelleniyor
                                                          await dosya.hedefListeOlustur().then((List hedefler) async{
                                                            setState(() {
                                                              _controller.hedefler.value = hedefler;
                                                              _controller.hedefSayisi.value = hedefler.length;
                                                              karakter.hedefler = hedefler;
                                                              karakter.hedefSayisi = hedefler.length;
                                                            });
                                                          });
                                                        });

                                                        Get.back();
                                                      },
                                                      color: Color.fromRGBO(0, 179, 134, 1.0),
                                                      radius: BorderRadius.circular(0.0),
                                                    ),
                                                  ],
                                                ).show();
                                              }
                                            }
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: _w/80),
                                  ],
                                ),
                              ),
                              SizedBox(height: _w/160),
                              Container(
                                height: _w/1.50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: GridView.builder(
                                    scrollDirection : Axis.vertical,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6), // kaç sutun olsun . örnekte 2 stundan olusan liste olacak
                                    itemCount: _controller.hedefler[index].yapilanGun,  //listenin uzunluğu
                                    itemBuilder: (BuildContext context, index) {
                                      return Container(
                                        child: Icon(Icons.check,color: Colors.blue),
                                      );
                                    }
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: _w/40,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
            ));
        },
      ),
    )),
      floatingActionButton: FloatingActionButton(
        //mini : true,
        onPressed: () {
          Get.to(() => YeniHedefEkle());
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.cyan,
      ),
    );
}
}

