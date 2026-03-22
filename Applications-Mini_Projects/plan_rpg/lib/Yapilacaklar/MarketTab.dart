import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../main.dart';

import 'YeniUrunEkle.dart';

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

var choice = 0;

class MarketTab extends StatefulWidget {
  @override
  _MarketTabState createState() => _MarketTabState();
}

class _MarketTabState extends State<MarketTab> {
  Controller _controller = Get.find();

  late var urunAdiDegistir=TextEditingController();
  late var urunStokDegistir=TextEditingController();
  late var urunAltinDegistir=TextEditingController();

  Widget avatarRenk(int secim) {
    return IconButton(
      icon: const Icon(Icons.fiber_manual_record),
      color: iconColor[secim],
      iconSize: 40.0,
      onPressed: () {
        setState(() {
          choice = secim;
          _controller.yeniUrunAvatarRenk.value = choice;
        });
      },
    );
  }

  Widget avatarSecim(int secim){
    return Obx(() =>IconButton(
      icon: Icon(urunAvatar[secim]),
      iconSize: 40.0,
      color: iconColor[ _controller.yeniUrunAvatarRenk.value],
      onPressed: () {
        setState(() {
          _controller.yeniUrunAvatar.value = secim;
          _controller.yeniUrunAvatarRenk.value = choice;
        });
      },
    ));

  }

  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;

    //floatingActionButton ın konumunu belirlemek için ilkönce Scaffold widget tanımlanır. Ardından body olarak ListView yazılır

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(200, 240, 240, 1.0),
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Row(
          children: [
            Text("Mevcut :",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            SizedBox(width: 10),
            DefaultTextStyle(
              style: TextStyle(fontSize: 20, color: Colors.yellowAccent),
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText(_controller.karakterAltin.toString()),
                ],
                repeatForever: true,
                isRepeatingAnimation: true,
              ),
            ),
            SizedBox(width:20),
            Container(
                width:20.0,
                height:20.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      //colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
                      image: AssetImage('assets/images/gold.png'),
                      fit: BoxFit.fill,
                    ))),
          ],
        ),
      ),
      body: Obx(() => AnimationLimiter(
        child: ListView.builder(
          padding: const EdgeInsets.all(5.0),
          physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemCount: _controller.marketUrunSayisi.value,
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
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: _w/25,vertical: _w/80),
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(_w/75),
                      height: _w/4,
                      child: Row(
                        mainAxisAlignment : MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        //mainAxisAlignment : MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(width: _w/40,),
                          Container(
                              width: _w/10.275,
                              height:_w/10.275,
                              child: Icon(urunAvatar[_controller.market[index].avatar],size: 30, color: iconColor[_controller.market[index].avatarRenk]),
                              ),
                          SizedBox(width: _w/40,),
                          Column(
                            crossAxisAlignment : CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: _w/40),
                              SizedBox(
                                  width: _w/1.787,
                                child: Text(_controller.market[index].ad,style: TextStyle(color: Colors.black, fontSize:14, fontWeight: FontWeight.bold)),
                              ),
                              Text('Stok: '+_controller.market[index].stok.toString(),style: TextStyle(color: Colors.black.withOpacity(.6), fontSize:12)),
                              SizedBox(height: _w/40,),
                              SizedBox(
                                width: _w/2,
                                child: Container(
                                  child: Row(
                                    crossAxisAlignment : CrossAxisAlignment.center,
                                    mainAxisAlignment : MainAxisAlignment.spaceAround,
                                    children: [
                                      //SizedBox(height: _w/30),
                                      IconButton(
                                        icon: Icon(Icons.shopping_cart_outlined, color: Colors.green),
                                        onPressed: () {
                                          if (karakter.altin>=karakter.market[index].altin){
                                            Alert(
                                                context: context,
                                                type: AlertType.none,
                                                style: alertStyle,
                                                title: "'"+_controller.market[index].ad+"'\n",
                                                desc: "Marketten satın alındı\n\n"+karakter.altin.toString()+" altın --> "+(karakter.altin-karakter.market[index].altin).toString()+" altın",
                                                buttons: [
                                                  DialogButton(
                                                    child: Text(
                                                      "TAMAM",
                                                      style: TextStyle(
                                                          color: Colors.white, fontSize: 14),
                                                    ),
                                                    onPressed: () async {
                                                      //Eğer ürün stoğu sıfırdan büyükse ürünü satın alabilirsin
                                                      int stok = karakter
                                                          .market[index]
                                                          .stok;
                                                      if (stok>0) {
                                                        WidgetsBinding.instance!
                                                            .addPostFrameCallback((
                                                            _) async {
                                                          setState(() {
                                                            int altin = karakter
                                                                .market[index]
                                                                .altin;
                                                            karakter.altin -=
                                                                altin;
                                                            _controller
                                                                .karakterAltin
                                                                .value =
                                                                karakter.altin;
                                                          });
                                                          //Karakter bilgileri güncelleniyor
                                                          String yazdirilacak = '';
                                                          yazdirilacak =
                                                              karakter.ad +
                                                                  "\n" +
                                                                  karakter
                                                                      .durum +
                                                                  "\n" +
                                                                  karakter
                                                                      .seviye
                                                                      .toString() +
                                                                  "\n" +
                                                                  karakter
                                                                      .sonrakiSeviyeye
                                                                      .toString() +
                                                                  "\n" +
                                                                  karakter.TP
                                                                      .toString() +
                                                                  "\n" +
                                                                  karakter.altin
                                                                      .toString() +
                                                                  "\n" +
                                                                  karakter
                                                                      .avatar
                                                                      .toString() +
                                                                  "\n" +
                                                                  karakter
                                                                      .avatarRenk
                                                                      .toString() +
                                                                  "\n";
                                                          await dosya
                                                              .KadosyayaYaz(
                                                              yazdirilacak);

                                                          //Alınan ürün stoktan düşürülüyor ve satınAlimSayisi 1 arttırılıyor
                                                          int stok = karakter
                                                              .market[index]
                                                              .stok;
                                                          stok--;
                                                          //_controller.market[index].stok.value=stok;
                                                          int satinAlimSayisi = karakter
                                                              .market[index]
                                                              .satinAlimSayisi;
                                                          satinAlimSayisi++;
                                                          //_controller.market[index].satinAlimSayisi.value=satinAlimSayisi;

                                                          var urun = Urun(
                                                              no: _controller
                                                                  .market[index]
                                                                  .no,
                                                              ad: _controller
                                                                  .market[index]
                                                                  .ad,
                                                              altin: _controller
                                                                  .market[index]
                                                                  .altin,
                                                              avatar: _controller
                                                                  .market[index]
                                                                  .avatar,
                                                              avatarRenk: _controller
                                                                  .market[index]
                                                                  .avatarRenk,
                                                              satinAlimSayisi: satinAlimSayisi,
                                                              stok: stok,
                                                              stogaGirisTarihi: tarih
                                                          );
                                                          await dosya
                                                              .urunGuncelle(
                                                              urun).then((
                                                              _) async {});

                                                          await dosya
                                                              .urunListeOlustur()
                                                              .then((
                                                              List urunler) async {
                                                            setState(() {
                                                              karakter
                                                                  .marketUrunSayisi =
                                                                  urunler
                                                                      .length;
                                                              _controller
                                                                  .marketUrunSayisi
                                                                  .value =
                                                                  urunler
                                                                      .length;
                                                              _controller.market
                                                                  .value =
                                                                  urunler;
                                                              karakter.market =
                                                                  urunler;
                                                            });
                                                          });
                                                        });
                                                      }else
                                                        Alert(
                                                          context: context,
                                                          type: AlertType.none,
                                                          style: alertStyle,
                                                          title: "Stokta ürün mevcut değil!",
                                                          buttons: [
                                                            DialogButton(
                                                              child: Text(
                                                                "TAMAM",
                                                                style: TextStyle(color: Colors.white, fontSize: 15),
                                                              ),
                                                              onPressed: () => Get.back(),
                                                              color: Color.fromRGBO(0, 179, 134, 1.0),
                                                              radius: BorderRadius.circular(0.0),
                                                            ),
                                                          ],
                                                        ).show();
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
                                          }else
                                            Alert(
                                                context: context,
                                                type: AlertType.warning,
                                                style: alertStyle,
                                                title: "Yeterli altınınız yok!",
                                                //desc: "Marketten satın alındı\n\n"+karakter.altin.toString()+" altın --> "+(karakter.altin-5).toString()+" altın",
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
                                                    gradient: LinearGradient(colors: [
                                                      Color.fromRGBO(116, 116, 191, 1.0),
                                                      Color.fromRGBO(52, 138, 199, 1.0)
                                                    ]),
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
                                            title: "UYARI",
                                            desc: "Bu ürünü stoktan kaldırmak istediğinizden emin misiniz?",
                                            buttons: [
                                              DialogButton(
                                                child: Text(
                                                  "EVET",
                                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                                ),
                                                onPressed: () async {
                                                  await dosya.urunSil(karakter.market[index].no);

                                                  await dosya.urunListeOlustur().then((List urunler) async {
                                                    setState(() {
                                                      karakter.marketUrunSayisi = urunler.length;
                                                      _controller.marketUrunSayisi.value = urunler.length;
                                                      _controller.market.value = urunler;
                                                      karakter.market=urunler;
                                                    });
                                                  });

                                                  Get.back();
                                                },
                                                color: Color.fromRGBO(0, 179, 134, 1.0),
                                              ),
                                              DialogButton(
                                                child: Text(
                                                  "HAYIR",
                                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                                ),
                                                onPressed: () => Get.back(),
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
                                        icon: Icon(Icons.mode_edit_outlined,color: Colors.black),
                                        onPressed: () {
                                          urunAdiDegistir.text=_controller.market[index].ad;
                                          urunStokDegistir.text=(_controller.market[index].stok).toString();
                                          urunAltinDegistir.text=(_controller.market[index].altin).toString();
                                          _controller.yeniUrunAvatar.value=_controller.market[index].avatar;
                                          _controller.yeniUrunAvatarRenk.value=_controller.market[index].avatarRenk;
                                          Alert(
                                            context: context,
                                            type: AlertType.none,
                                            style: alertStyle,
                                            title: "Ürünü güncelle",
                                            content: Column(
                                              children: [
                                                TextField(
                                                  controller: urunAdiDegistir,
                                                  decoration: InputDecoration(
                                                    labelText: 'Yeni ürün adı...',
                                                  ),
                                                ),
                                                TextField(
                                                  controller: urunStokDegistir,
                                                  keyboardType: TextInputType.number,
                                                  maxLength: 3,
                                                  decoration: InputDecoration(
                                                    labelText: 'Yeni ürün stok...',
                                                  ),
                                                ),
                                                TextField(
                                                  controller: urunAltinDegistir,
                                                  keyboardType: TextInputType.number,
                                                  maxLength: 3,
                                                  decoration: InputDecoration(
                                                    labelText: 'Altın...',
                                                    suffixIcon: Container(
                                                        width:8.0,
                                                        height:8.0,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                              image: AssetImage('assets/images/gold.png'),
                                                              fit: BoxFit.fill,
                                                            ))),
                                                  ),
                                                ),
                                                const Divider(),
                                                Text("Seçilen: ", style: TextStyle(fontSize: 18)),
                                                SizedBox(width:_w/20.55),
                                                Obx(() =>Icon(urunAvatar[_controller.yeniUrunAvatar.value],
                                                    color: iconColor[_controller.yeniUrunAvatarRenk.value],size: 30)),
                                                const Divider(),
                                                const Text('Ürün Renk\n',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        decorationStyle: TextDecorationStyle.dotted,
                                                        decorationThickness: 5.0,
                                                        decoration: TextDecoration.underline,
                                                        fontWeight: FontWeight.bold)),
                                                Row(
                                                  crossAxisAlignment : CrossAxisAlignment.start,
                                                  mainAxisAlignment : MainAxisAlignment.start,
                                                  children: [
                                                    for (int i = 0; i < 4; i++) avatarRenk(i),
                                                  ],
                                                ),
                                                Row(
                                                  crossAxisAlignment : CrossAxisAlignment.start,
                                                  mainAxisAlignment : MainAxisAlignment.start,
                                                  children: [
                                                    for (int i = 4; i < 8; i++) avatarRenk(i),
                                                  ],
                                                ),
                                                Row(
                                                  crossAxisAlignment : CrossAxisAlignment.start,
                                                  mainAxisAlignment : MainAxisAlignment.start,
                                                  children: [
                                                    for (int i = 8; i < 10; i++) avatarRenk(i),
                                                  ],
                                                ),
                                                const Divider(),
                                                const Text('Ürün Avatar\n',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        decorationStyle: TextDecorationStyle.dotted,
                                                        decorationThickness: 5.0,
                                                        decoration: TextDecoration.underline,
                                                        fontWeight: FontWeight.bold)),
                                                //Avatar 1.satır
                                                Row(
                                                  crossAxisAlignment : CrossAxisAlignment.start,
                                                  mainAxisAlignment : MainAxisAlignment.start,
                                                  children: [
                                                    for (int i = 0; i < 4; i++) avatarSecim(i),
                                                  ],
                                                ),
                                                //Avatar 2.satır
                                                Row(
                                                  crossAxisAlignment : CrossAxisAlignment.start,
                                                  mainAxisAlignment : MainAxisAlignment.start,
                                                  children: [
                                                    for (int i = 4; i < 8; i++) avatarSecim(i),
                                                  ],
                                                ),
                                                //Avatar 3.satır
                                                Row(
                                                  crossAxisAlignment : CrossAxisAlignment.start,
                                                  mainAxisAlignment : MainAxisAlignment.start,
                                                  children: [
                                                    for (int i = 8; i < 12; i++) avatarSecim(i),
                                                  ],
                                                ),
                                                //Avatar 4.satır
                                                Row(
                                                  crossAxisAlignment : CrossAxisAlignment.start,
                                                  mainAxisAlignment : MainAxisAlignment.start,
                                                  children: [
                                                    for (int i = 12; i < 16; i++) avatarSecim(i),
                                                  ],
                                                ),
                                                //Avatar 5.satır
                                                Row(
                                                  crossAxisAlignment : CrossAxisAlignment.start,
                                                  mainAxisAlignment : MainAxisAlignment.start,
                                                  children: [
                                                    for (int i = 16; i < 20; i++) avatarSecim(i),
                                                  ],
                                                ),
                                                //Avatar 6.satır
                                                Row(
                                                  crossAxisAlignment : CrossAxisAlignment.start,
                                                  mainAxisAlignment : MainAxisAlignment.start,
                                                  children: [
                                                    for (int i = 20; i < 24; i++) avatarSecim(i),
                                                  ],
                                                ),
                                                Row(
                                                  crossAxisAlignment : CrossAxisAlignment.start,
                                                  mainAxisAlignment : MainAxisAlignment.start,
                                                  children: [
                                                    for (int i = 24; i < 28; i++) avatarSecim(i),
                                                  ],
                                                ),
                                                Row(
                                                  crossAxisAlignment : CrossAxisAlignment.start,
                                                  mainAxisAlignment : MainAxisAlignment.start,
                                                  children: [
                                                    for (int i = 28; i < 30; i++) avatarSecim(i),
                                                  ],
                                                ),
                                                const Divider(),
                                              ],
                                            ),

                                            buttons: [
                                              DialogButton(
                                                child: Text(
                                                  "TAMAM",
                                                  style: TextStyle(color: Colors.white, fontSize: 18),
                                                ),
                                                onPressed: () async {
                                                  if (urunAdiDegistir.text.length != 0 && urunStokDegistir.text.length!=0 && urunAltinDegistir.text.length!=0) {
                                                    var urun1 = Urun(
                                                        no: _controller.market[index].no,
                                                        ad: urunAdiDegistir.text,
                                                        altin: int.parse(urunAltinDegistir.text),
                                                        avatar: _controller.yeniUrunAvatar.value,
                                                        avatarRenk: _controller.yeniUrunAvatarRenk.value,
                                                        satinAlimSayisi: _controller.market[index].satinAlimSayisi,
                                                        stok: int.parse(urunStokDegistir.text),
                                                        stogaGirisTarihi: tarih
                                                    );

                                                    await dosya.urunGuncelle(urun1);

                                                    await dosya.urunListeOlustur().then((List urunler) async {
                                                      setState(() {
                                                        karakter.marketUrunSayisi = urunler.length;
                                                        _controller.marketUrunSayisi.value = urunler.length;
                                                        _controller.market.value = urunler;
                                                        karakter.market=urunler;
                                                      });
                                                    });
                                                    setState(() {
                                                      urunAdiDegistir.text='';
                                                      urunStokDegistir.text='';
                                                      urunAltinDegistir.text='';
                                                      _controller.yeniUrunAvatar.value=0;
                                                      _controller.yeniUrunAvatarRenk.value=0;
                                                    });

                                                    Get.back();
                                                  } else {
                                                    Fluttertoast.showToast(
                                                        msg: 'En az 1 harf giriniz!',
                                                        toastLength: Toast.LENGTH_SHORT,
                                                        gravity: ToastGravity.BOTTOM,
                                                        timeInSecForIosWeb: 1,
                                                        backgroundColor: Colors.red,
                                                        textColor: Colors.white,
                                                        fontSize: 16.0);
                                                  }
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
                                                    urunAdiDegistir.text='';
                                                    urunStokDegistir.text='';
                                                    urunAltinDegistir.text='';
                                                    _controller.yeniUrunAvatar.value=0;
                                                    _controller.yeniUrunAvatarRenk.value=0;
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
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                              height: _w/4,
                            child: Row(
                                children: [
                                  Text("  "+_controller.market[index].altin.toString(),style: TextStyle(color: Colors.black,fontSize:14)),
                                  SizedBox(width: _w/80),
                                  Container(
                                      width:_w/20,
                                      height:_w/20,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage('assets/images/gold.png'),
                                            fit: BoxFit.fill,
                                          ))),
                                ]
                            ),
                          ),
                      ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      ),
      floatingActionButton: FloatingActionButton(
          //mini : true,
        onPressed: () {
          //WARNING, consider using: "Get.to(() => Page())" instead of "Get.to(Page())".
          //Using a widget function instead of a widget fully guarantees that the widget and its controllers will be removed from memory when they are no longer used.
          Get.to(() => YeniOdulEkle());

        },
        child: Icon(Icons.add),
        backgroundColor: Colors.cyan,
      ),
    );
  }
}
