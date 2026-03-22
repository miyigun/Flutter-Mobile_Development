import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../main.dart';
import 'package:fluttertoast/fluttertoast.dart';

var choice = 0;

class YeniOdulEkle extends StatefulWidget {
  const YeniOdulEkle({Key? key}) : super(key: key);

  @override
  _YeniOdulEkleState createState() => _YeniOdulEkleState();
}

class _YeniOdulEkleState extends State<YeniOdulEkle> {

  Controller _controller = Get.find();

  final urunAdiControl=TextEditingController();

  final urunStokControl=TextEditingController();

  int altin=0;

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return MaterialApp(
      title: 'Hayatını Yönet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Color.fromRGBO(200, 240, 240, 1.0),
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text('Yeni Ödül Ekle',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.check,
                  color: Colors.white, size: 25.0),
              onPressed: () async {
                WidgetsBinding.instance!.addPostFrameCallback((_) async {

                  //Yeni görev kaydı
                  if (_controller.yeniUrunAdi.value.length<3) {
                    Fluttertoast.showToast(
                        msg: 'Ürün adı en az 3 harften oluşmalı!',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 12.0);
                  } else{

                    //Veri tabanındaki görev numaraları belirleniyor
                    var urunNumaralari=[];
                    int enBuyukKayitNo=karakter.marketUrunSayisi;
                    await dosya.urunListeOlustur().then((List tumUrunler) async {
                      setState(() {
                        karakter.marketUrunSayisi = tumUrunler.length;
                      });
                      //Veritabanında yapılan kayıtların numaraları yazılma-silinmeden dolayı değişiyor.İlkönce onları tespit ediyoruz.
                      for (int i = 0; i < karakter.marketUrunSayisi; i++) {
                        urunNumaralari.add(tumUrunler[i].no);
                      }
                      //En büyük kayıt numarası tespit ediliyor

                      for(int i=0;i<karakter.marketUrunSayisi;i++)
                        if (enBuyukKayitNo<urunNumaralari[i]) enBuyukKayitNo=urunNumaralari[i];

                    });
                    var urun = Urun(
                        no:  enBuyukKayitNo+1,
                        ad: _controller.yeniUrunAdi.value,
                        altin: _controller.yeniUrunAltin.value,
                        avatar: _controller.yeniUrunAvatar.value,
                        avatarRenk: _controller.yeniUrunAvatarRenk.value,
                        satinAlimSayisi: 0,
                        stok: _controller.yeniUrunStok.value,
                        stogaGirisTarihi: tarih
                    );

                    await dosya.urunEkle(urun).then((_)  async{}) ;

                    // Ardından veritabanından tüm veriler okunarak listelere aktarılarak market ürün listesi güncelleniyor
                    await dosya.urunListeOlustur().then((List tumUrunler) async{
                      setState(() {
                        _controller.market.value = tumUrunler;
                        _controller.marketUrunSayisi.value = tumUrunler.length;
                        karakter.market = tumUrunler;
                        karakter.marketUrunSayisi = tumUrunler.length;
                      });
                    });

                    setState(() {
                      _controller.yeniUrunAdi.value='';
                      _controller.yeniUrunAltin.value=0;
                      _controller.yeniUrunStok.value=0;
                      _controller.yeniUrunAvatar.value=0;
                    });

                    Fluttertoast.showToast(
                        msg: 'Ödül başarıyla kaydedildi',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 12.0);

                    Get.back();
                  }
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.cancel,
                  color: Colors.white, size: 25.0),
              onPressed: () {
                //Yeni Görev ekle iptal edildiği için değiştirilen değerler sıfırlanıyor
                setState(() {
                  _controller.yeniUrunAdi.value='';
                  _controller.yeniUrunAltin.value=0;
                  _controller.yeniUrunStok.value=0;
                  _controller.yeniUrunAvatar.value=0;
                });

                Get.back();
              },
            ),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal:5.0, vertical: 10.0),
          children: <Widget>[
            //SizedBox(height: _w/20.55),
            Card(
                //color: Colors.transparent,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              child: Column(
                  crossAxisAlignment : CrossAxisAlignment.start,
                  children: [
                    Container(
                    height: _w/4,
                    padding: EdgeInsets.symmetric(horizontal: _w/27.4,vertical: _w/40),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: urunAdiControl,
                      maxLength: 32,
                      showCursor: false,
                      style: TextStyle(fontSize: 12),
                      decoration: InputDecoration(
                        labelText: 'Ödül adı...',
                        labelStyle: TextStyle(
                          fontSize: 12,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      onChanged: (String value){
                        setState(() {
                          _controller.yeniUrunAdi.value=value;
                        });
                      },
                    ),
                  ),
                    Container(
                      width: _w/3.5,
                      padding: EdgeInsets.only(left: _w/27.4),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: urunStokControl,
                        maxLength: 3,
                        showCursor: false,
                        style: TextStyle(fontSize: 12),
                        decoration: InputDecoration(
                          labelText: 'Stok adedi...',
                          labelStyle: TextStyle(
                            fontSize: 12,
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                        onChanged: (String value){
                          setState(() {
                            _controller.yeniUrunStok.value=int.parse(value);
                          });
                        },
                      ),
                    ),
                    Row(
                        mainAxisAlignment : MainAxisAlignment.start,
                        children: [
                          SizedBox(width:_w/27.4),
                          Container(
                              width: _w/13.7,
                              height: _w/13.7,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/gold.png'),
                                    fit: BoxFit.fill,
                                  ))),
                          SizedBox(width:_w/20.55),
                          ButtonBar(
                            children: <Widget>[
                              SizedBox(
                                width: 50.0,
                                child: Obx(() =>
                                    Text("  "+_controller.yeniUrunAltin.value.toString(),
                                        style: TextStyle(color:Colors.redAccent,fontSize:16),
                                        textAlign: TextAlign.center
                                    )),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () =>{
                                  if (altin<100){
                                    altin++,
                                    _controller.yeniUrunAltin.value = altin,
                                  }
                                } ,
                              ),
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () => {
                                  if (altin>0){
                                    altin--,
                                    _controller.yeniUrunAltin.value = altin,
                                  }
                                },
                              ),
                            ],
                          ),
                        ]
                    ),
                ]
              ),
            ),
            SizedBox(height: _w/40),
            Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Row(
                    mainAxisAlignment : MainAxisAlignment.center,
                    children: [
                      Text("  Seçilen: ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(width:_w/20.55),
                      Icon(urunAvatar[_controller.yeniUrunAvatar.value],
                          color: iconColor[_controller.yeniUrunAvatarRenk.value],size: 40),
                    ]
                ),
            ),
            SizedBox(height: _w/40),
            const Text(' Renk',
                style: TextStyle(
                    fontSize: 18,
                    //color: Colors.red,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: _w/80),
            Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Container(
                  height: _w/2,
                  child: GridView.builder(
                    itemCount:  iconColor.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).orientation ==
                          Orientation.landscape ? 3: 6,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                    ),
                    itemBuilder: (context,index,) {
                      return Container(
                          child:
                          IconButton(
                            icon: const Icon(Icons.fiber_manual_record),
                            color: iconColor[index],
                            iconSize: 40.0,
                            onPressed: () {
                              choice = index;
                              setState(() {
                                _controller.yeniUrunAvatarRenk.value = choice;
                              });
                            },
                          )
                      );
                    },
                  ),
                ),
            ),
            SizedBox(height: _w/40),
            const Text(' Avatar',
                style: TextStyle(
                    fontSize: 18,
                    //color: Colors.red,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: _w/80),
            Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child:
                Container(
                  height: _w,
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: GridView.builder(
                    itemCount:  urunAvatar.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).orientation ==
                          Orientation.landscape ? 3: 6,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                    ),
                    itemBuilder: (context,index,) {
                      return Container(
                          child: IconButton(
                            icon: Icon(urunAvatar[index]),
                            iconSize: 40.0,
                            color: iconColor[choice],
                            onPressed: () {
                              setState(() {
                                _controller.yeniUrunAvatar.value = index;
                                _controller.yeniUrunAvatarRenk.value = choice;
                              });
                            },
                          )
                      );
                    },
                  ),
                ),
            ),
          ], ),
      ),
    );
  }
}

