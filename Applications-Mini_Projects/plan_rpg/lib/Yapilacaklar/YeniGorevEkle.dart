import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:table_calendar/table_calendar.dart';
import '../main.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum gorevTarih { bugun, yarin, baskatarih}
var gosterilecekTarih=tarih;
String _popupselection='';
String _popupselection2='';
String _beceriIlk=beceriler.beceriAdlari[0];
List<String> iliskiliBeceriler = List<String>.generate(beceriler.beceriAdlari.length, (i) => beceriler.beceriAdlari[i]);

class YeniGorevEkle extends StatefulWidget {
  const YeniGorevEkle({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => YeniGorevEkleState();
}

class YeniGorevEkleState extends State<YeniGorevEkle> {

  Controller _controller = Get.find();

  String _tekrarIlk='1 kez';
  List<String> tekrar=['1 kez','Her gün','Her hafta','Her ay','Her yıl','Özel'];

  String _onemIlk='Çok önemli';
  List<String> onem=['Çok önemli','Önemli','Normal','Önemsiz'];

  var val;
  int TP=0;
  int BeceriTP=0;
  int altin=0;
  int gorevGunuTekrarSayisi=0;

  String _popupselection3='';
  String _popupselection4='';
  String _popupselection5='';

  //TextField'ın içeriğini bu şekilde kontrol ediyoruz
  final gorevAdiControl=TextEditingController();
  final gorevAciklamaControl=TextEditingController();
  final gorevOnemControl=TextEditingController();
  final control=TextEditingController();
  final control2=TextEditingController();
  final control3=TextEditingController();
  final tekrarcontrol=TextEditingController();
  final tarihcontrol=TextEditingController();
  final iliskilibecericontrol=TextEditingController();

  //control a ilk değerini verebilmek için "YeniGorevEkleState" e constructor tanımlamalıyız.
  void initState() {
    super.initState();

    setState(() {
      _controller.yeniGorevIliskiliBeceri.value=_controller.beceriler[0].ad;
      gorevAdiControl.text=_controller.yeniGorevAdi.value;
      gorevAciklamaControl.text=_controller.yeniGorevAciklama.value;
      _controller.gorevGuncelleOnem.value="Çok önemli";
      control.text=_controller.yeniGorevTP.value.toString();
      control2.text=_controller.yeniGorevAltin.value.toString();
      tekrarcontrol.text=_controller.yeniGorevTekrar.value;
      tarihcontrol.text=_controller.yeniGorevTarih.value;
      iliskilibecericontrol.text=_controller.yeniGorevIliskiliBeceri.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;

    return MaterialApp(
      title: 'Hayatını Yönet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text('Yeni Görev Ekle',
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
                if (_controller.yeniGorevAdi.value.length<3) {
                  Fluttertoast.showToast(
                      msg: 'Görev en az 3 harften oluşmalı!',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 12.0);
                } else if (_controller.yeniGorevTekrar.value=="0 kez") {
                  Fluttertoast.showToast(
                      msg: "Tekrar '0 kez' olamaz!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 12.0);
                }else{
                  //Veri tabanındaki görev numaraları belirleniyor
                  var gorevNumaralari=[];
                  int enBuyukKayitNo=karakter.tumGorevSayisi;
                  await dosya.gorevListeOlustur().then((List tumGorevler) async {
                    setState(() {
                      karakter.tumGorevSayisi = tumGorevler.length;
                    });
                    //Veritabanında yapılan kayıtların numaraları yazılma-silinmeden dolayı değişiyor.İlkönce onları tespit ediyoruz.
                    for (int i = 0; i < karakter.tumGorevSayisi; i++) {
                      gorevNumaralari.add(tumGorevler[i].no);
                    }
                    //En büyük kayıt numarası tespit ediliyor

                    for(int i=0;i<karakter.tumGorevSayisi;i++)
                        if (enBuyukKayitNo<gorevNumaralari[i]) enBuyukKayitNo=gorevNumaralari[i];

                  });

                  var gorev = Gorevler(
                      no: enBuyukKayitNo+1,
                      ad: _controller.yeniGorevAdi.value,
                      aciklama: _controller.yeniGorevAciklama.value,
                      tarih: _controller.yeniGorevTarih.value,
                      tekrar: _controller.yeniGorevTekrar.value,
                      yapildi: "Hayır",
                      basariDurumu: '',
                      altin: _controller.yeniGorevAltin.value,
                      TP: _controller.yeniGorevTP.value,
                      beceriTP: _controller.yeniGorevBeceriTP.value,
                      beceri: _controller.yeniGorevIliskiliBeceri.value,
                      onem: _controller.yeniGorevOnem.value
                  );
                  await dosya.gorevEkle(gorev).then((_)  async{}) ;

                  // Ardından veritabanından tüm veriler okunarak listelere aktarılarak görev listeleri güncelleniyor
                  await dosya.gorevListeOlustur().then((List tumGorevler) async{
                    setState(() {
                      _controller.tumGorevler.value = tumGorevler;
                      _controller.tumGorevSayisi.value = tumGorevler.length;
                      karakter.tumGorevler = tumGorevler;
                      karakter.tumGorevSayisi = tumGorevler.length;
                    });
                  });

                  await dosya
                      .gorevBugunTariheGoreListeOlustur()
                      .then((List bugunkuGorevler) async {
                    setState(() {
                      _controller.bugunkuGorevler.value = bugunkuGorevler;
                      _controller.cBugunkuGorevSayisi.value = bugunkuGorevler.length;
                      karakter.bugunkuGorevler = bugunkuGorevler;
                      karakter.bugunkuGorevSayisi = bugunkuGorevler.length;

                    });
                  });

                  await dosya
                      .gorevYarininTarihineGoreListeOlustur()
                      .then((List yarinkiGorevler) async {
                    setState(() {
                      _controller.yarinkiGorevler.value = yarinkiGorevler;
                      _controller.yarinkiGorevSayisi.value = yarinkiGorevler.length;
                      karakter.yarinkiGorevler = yarinkiGorevler;
                      karakter.yarinkiGorevSayisi = yarinkiGorevler.length;
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

                  setState(() {
                    _controller.yeniGorevAdi.value='';
                    _controller.yeniGorevAciklama.value='';
                    _controller.yeniGorevTarih.value=tarih;
                    _controller.yeniGorevTekrar.value='1 kez';
                    _controller.yeniGorevTekrarGunleri.value='';
                    _controller.yeniGorevAltin.value=0;
                    _controller.yeniGorevTP.value=0;
                    _controller.yeniGorevIliskiliBeceri.value=_controller.beceriler[0].ad;
                    _controller.yeniGorevBeceriTP.value=0;
                    _controller.yeniGorevOnem.value=1;
                    _beceriIlk=beceriler.beceriAdlari[0];
                  });

                  Fluttertoast.showToast(
                      msg: 'Görev başarıyla kaydedildi',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 12.0);

                  Get.back();
                };
    });
              },
            ),
            IconButton(
              icon: Icon(Icons.cancel,
                  color: Colors.white, size: 25.0),
              onPressed: () {
                //Yeni Görev ekle iptal edildiği için değiştirilen değerler sıfırlanıyor
                setState(() {
                  _controller.yeniGorevAdi.value='';
                  _controller.yeniGorevAciklama.value='';
                  _controller.yeniGorevTarih.value=tarih;
                  _controller.yeniGorevTekrar.value='1 kez';
                  _controller.yeniGorevAltin.value=0;
                  _controller.yeniGorevTP.value=0;
                  _controller.yeniGorevIliskiliBeceri.value=_controller.beceriler[0].ad;
                  _controller.yeniGorevBeceriTP.value=0;
                  _controller.yeniGorevOnem.value=1;
                  _beceriIlk=beceriler.beceriAdlari[0];
                });
                Get.back();
              },
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.only(left:30.0, right:30.0,top:5),
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.text,
              controller: gorevAdiControl,
              maxLength: 64,
              showCursor: false,
              style: TextStyle(fontSize: 12),
              decoration: InputDecoration(
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
            const Divider(),
            Row(
                children:[
                  const Text('Önem:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12)),
                  SizedBox(width: _w/60),
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
                  SizedBox(width: _w/10.275),
                  if (_controller.yeniGorevOnem.value==1) CircleAvatar(backgroundColor: Colors.red,radius: 5.0,),
                  if (_controller.yeniGorevOnem.value==2) CircleAvatar(backgroundColor: Colors.blue,radius: 5.0,),
                  if (_controller.yeniGorevOnem.value==3) CircleAvatar(backgroundColor: Colors.green,radius: 5.0,),
                  if (_controller.yeniGorevOnem.value==4) CircleAvatar(backgroundColor: Colors.brown,radius: 5.0,),
                ]),
            const Divider(),
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
            const Divider(),
            const Text('Ödül',style: TextStyle(fontWeight: FontWeight.bold,fontSize:12)),
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
                      onPressed: () =>{
                        if (TP<10){
                          TP++,
                          _controller.yeniGorevTP.value = TP,
                          control.text = "$TP",
                        }
                      } ,
                    ),
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () => {
                        if (TP>0){
                          TP--,
                          _controller.yeniGorevTP.value = TP,
                          control.text = "$TP",
                        }
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
                      onPressed: () =>{
                        if (altin<10){
                          altin++,
                          _controller.yeniGorevAltin.value = altin,
                          control2.text = "$altin",
                        }
                      } ,
                    ),
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () => {
                        if (altin>0){
                          altin--,
                          _controller.yeniGorevAltin.value = altin,
                          control2.text = "$altin",
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
            const Divider(),
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
                                        DateTime t=DateTime.parse(tarih);
                                        int kacinciGun=t.weekday;
                                        //Açılan checkbox menüsünde ptesi 0.değer olarak gözüküyor ama weekday özelliğinde 1 olarak gözüküyor.Bunun için
                                        //1 eksiltiyoruz
                                        kacinciGun--;
                                        bool gunlerdenBiriMi=false;
                                        for(int i in values){
                                          if(kacinciGun==i) {
                                            gunlerdenBiriMi=true;
                                            _controller.yeniGorevTarih.value=tarih;
                                            break;
                                          }
                                        }
                                        bool ileriTarih=false;
                                        if (gunlerdenBiriMi==false) {
                                          for(int i in values){
                                            if(i>kacinciGun){
                                              int gunFarki=i-kacinciGun;
                                              DateTime t=DateTime.parse((now.add(Duration(days: gunFarki))).toString());
                                              String dtTarih =DateFormat('yyyy-MM-dd').format(t);
                                              _controller.yeniGorevTarih.value=dtTarih;
                                              ileriTarih=true;
                                              break;
                                            }
                                          }
                                          if(ileriTarih==false){
                                            int gunFarki=7-(kacinciGun-int.parse(values[0].toString()));
                                            DateTime t=DateTime.parse((now.add(Duration(days: gunFarki))).toString());
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
            const Divider(),
            Row(
                children:[
              Text('İlişkili Beceri:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12)),
              SizedBox(width: _w/10),
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
                                    textAlign: TextAlign.start,
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
                      width: 50.0,
                      child: Obx(() =>
                          Text("  "+_controller.yeniGorevBeceriTP.value.toString(),
                              style: TextStyle(color:Colors.redAccent,fontSize:14),
                              textAlign: TextAlign.center
                          )),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () =>{
                        if (BeceriTP<10){
                          BeceriTP++,
                          _controller.yeniGorevBeceriTP.value = BeceriTP,
                          control.text = "$BeceriTP",
                        }
                      } ,
                    ),
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () => {
                        if (BeceriTP>0){
                          BeceriTP--,
                          _controller.yeniGorevBeceriTP.value = BeceriTP,
                          control.text = "$BeceriTP",
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ], ),
      ),
    );
  }
}

class TarihBelirle extends StatefulWidget {
  @override
  _TarihBelirleState createState() => _TarihBelirleState();
}

class _TarihBelirleState extends State<TarihBelirle > {

  Controller _controller = Get.find();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Bir Tarih Seçin", style: TextStyle(fontSize: 20,
          fontWeight: FontWeight.bold,)),
      ),
      body:TableCalendar(
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: DateTime.now(),

        startingDayOfWeek: StartingDayOfWeek.monday,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          // Use `selectedDayPredicate` to determine which day is currently selected.
          // If this returns true, then `day` will be marked as selected.

          // Using `isSameDay` is recommended to disregard
          // the time-part of compared DateTime objects.
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            // Call `setState()` when updating the selected day
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;

              yeniGorev.tarih=DateFormat('yyyy-MM-dd').format(_selectedDay!);
              _controller.yeniGorevTarih.value=DateFormat('yyyy-MM-dd').format(_selectedDay!);
              _controller.yeniGorevTekrar.value='1 kez';
            });

            Get.back();
          }
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            // Call `setState()` when updating calendar format
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          // No need to call `setState()` here
          _focusedDay = focusedDay;
        },
      ),
    );
  }
}
