import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../main.dart';

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

class Ayarlar extends StatefulWidget {
  @override
  _AyarlarState createState() => _AyarlarState();
}

class _AyarlarState extends State<Ayarlar> {
  Controller _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    //floatingActionButton ın konumunu belirlemek için ilkönce Scaffold widget tanımlanır. Ardından body olarak ListView yazılır

    return Scaffold(
      backgroundColor: Color.fromRGBO(200, 240, 240, 1.0),
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Ayarlar", style: TextStyle(fontSize: 20,
          fontWeight: FontWeight.bold,)),
      ),
      body: Container(

        width: 400,
        //  Yükseklik
        height: 500,
        //  Hizalama
        //alignment: Alignment.center,
        //  İçten boşluk
        padding: EdgeInsets.all(10),
        //  Dıştan boşluk
        margin: EdgeInsets.all(10),
        child: ListView(
          //padding: const EdgeInsets.all(30.0),
          children: <Widget>[
            Column(
              //Yazıyı satırda sola yaslamak için Column widget ının içinde aşağıdaki kodu yazıyoruz
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Row(
                  children: [
                    Icon(Icons.replay_outlined),
                    SizedBox(width: 20.0),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Alert(
                          context: context,
                          type: AlertType.warning,
                          style: alertStyle,
                          title: "UYARI",
                          desc: "Tüm ilerlemeleri kaldırmak istediğinizden emin misiniz?",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "EVET",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () async {
                                //İlk ayarlara dönülüyor
                                String yazdirilacak = karakter.ad+"\nAcemi\n0\n20\n0\n0\n"+karakter.avatar.toString()+"\n"+karakter.avatarRenk.toString()+"\n";
                                await dosya.KadosyayaYaz(yazdirilacak);

                                setState(() {
                                  karakter.durum = "Acemi";
                                  karakter.seviye = 0;
                                  karakter.TP = 0;
                                  karakter.altin = 0;
                                  karakter.sonrakiSeviyeye = 20;

                                  _controller.karakterDurum.value = "Acemi";
                                  _controller.karakterSeviye.value=0;
                                  _controller.karakterTP.value=0;
                                  _controller.karakterAltin.value=0;
                                  _controller.karakterSonrakiSeviyeye.value=20;
                                });

                                //Beceriler ilk değerlerine döndürülüyor
                                //Döngüde her defasında yeniden tanımlamada hata vermesin diye döngüden önce değişkeni tanımlıyoruz
                                var beceri = Beceri(
                                    ad: beceriler.beceriAdlari[0],
                                    seviye: 0,
                                    beceriTP: 0
                                );

                                for (int i=0;i<karakter.beceriSayisi;i++){
                                  beceri = Beceri(
                                      ad: beceriler.beceriAdlari[i],
                                      seviye: 0,
                                      beceriTP: 0
                                  );

                                  await dosya.beceriGuncelle(beceri);
                                }

                                await dosya.beceriListeOlustur().then((List tumBeceriler) async {

                                  setState(() {
                                    karakter.beceriSayisi = tumBeceriler.length;
                                    _controller.beceriSayisi.value = tumBeceriler.length;
                                    _controller.beceriler.value = tumBeceriler;

                                    beceriler.beceriAdlari=[];
                                    beceriler.seviye=[];
                                    beceriler.beceriTP=[];

                                    for (int i = 0; i < tumBeceriler.length; i++) {
                                      beceriler.beceriAdlari.add(tumBeceriler[i].ad);
                                      beceriler.seviye.add(tumBeceriler[i].seviye);
                                      beceriler.beceriTP.add(tumBeceriler[i].beceriTP);
                                    }
                                  });
                                });

                                //Başarılar ilk değerlerine döndürülüyor
                                var basari1 = Basari(
                                    no: 1,
                                    basari: "Karakter seviyeniz 2 oldu",
                                    tarih: '',
                                    basarildimi: 0,
                                    TP: 2,
                                    altin: 2,
                                    gosterildimi: 0
                                );
                                var basari2 = Basari(
                                    no: 2,
                                    basari: "Karakter seviyeniz 3 oldu",
                                    tarih: '',
                                    basarildimi: 0,
                                    TP: 4,
                                    altin: 4,
                                    gosterildimi: 0
                                );
                                var basari3 = Basari(
                                    no: 3,
                                    basari: "Karakter seviyeniz 4 oldu",
                                    tarih: '',
                                    basarildimi: 0,
                                    TP: 4,
                                    altin: 4,
                                    gosterildimi: 0
                                );
                                var basari4 = Basari(
                                    no: 4,
                                    basari: "20 altınınız oldu",
                                    tarih: '',
                                    basarildimi: 0,
                                    TP: 1,
                                    altin: 1,
                                    gosterildimi: 0
                                );
                                var basari5 = Basari(
                                    no: 5,
                                    basari: "50 altınınız oldu",
                                    tarih: '',
                                    basarildimi: 0,
                                    TP: 1,
                                    altin: 1,
                                    gosterildimi: 0
                                );
                                var basari6 = Basari(
                                    no: 6,
                                    basari: "100 altınınız oldu",
                                    tarih: '',
                                    basarildimi: 0,
                                    TP: 2,
                                    altin: 2,
                                    gosterildimi: 0
                                );

                                await dosya.basariGuncelle(basari1);
                                await dosya.basariGuncelle(basari2);
                                await dosya.basariGuncelle(basari3);
                                await dosya.basariGuncelle(basari4);
                                await dosya.basariGuncelle(basari5);
                                await dosya.basariGuncelle(basari6);

                                await dosya.basariListeOlustur().then((List tumBasarilar) async {
                                  karakter.basariSayisi = tumBasarilar.length;
                                  _controller.basariSayisi.value = tumBasarilar.length;
                                  _controller.basarilar.value = tumBasarilar;
                                  karakter.basarilar=tumBasarilar;

                                  karakter.eldeEdilenBasariSayisi=0;
                                  //Elde edilen başarıya karşılık gelen tik değerleri sıfırlanıyor
                                  for (int i=0;i<karakter.basariSayisi;i++) {
                                    basarildimiKontrol[i] = false;
                                  }

                                  _controller.eldeEdilenBasariSayisi.value=karakter.eldeEdilenBasariSayisi;
                                });

                                await dosya.gorevGrafikListeOlustur().then((List grafik) async {
                                  setState(() {
                                    _controller.grafik.value = grafik;
                                    _controller.grafikVeriSayisi.value = grafik.length;
                                    karakter.grafik = grafik;
                                    karakter.grafikVeriSayisi = grafik.length;
                                  });
                                });

                                await dosya.gorevGrafikListeOlustur2().then((List grafik2) async {
                                  setState(() {
                                    _controller.grafik2.value = grafik2;
                                    _controller.grafikVeriSayisi2.value = grafik2.length;
                                    karakter.grafik2 = grafik2;
                                    karakter.grafikVeriSayisi2 = grafik2.length;
                                  });
                                });
                                //İlerlemeler sıfırlandı
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
                      child: const Text('İlerlemeyi kaldır', style: TextStyle(fontSize: 20)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.restart_alt_outlined),
                    SizedBox(width: 20.0),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Alert(
                          context: context,
                          type: AlertType.warning,
                          title: "UYARI",
                          style: alertStyle,
                          desc: "Tüm verileri sıfırlamak istediğinizden emin misiniz?\n(Karakter adı hariç)",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "EVET",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () async {
                                WidgetsBinding.instance!.addPostFrameCallback((_) async {
                                //Tüm veriler sıfırlanıp program varsayılan ayarlarına döndürülüyor
                                //Karakter verileri sıfırlanıyor
                                String yazdirilacak = karakter.ad+"\nAcemi\n0\n20\n0\n0\n0\n0\n";
                                await dosya.KadosyayaYaz(yazdirilacak);

                                setState(() {
                                  //karakter.ad = "Murat";
                                  karakter.durum = "Acemi";
                                  karakter.seviye = 0;
                                  karakter.TP = 0;
                                  karakter.altin = 0;
                                  karakter.sonrakiSeviyeye = 20;
                                  karakter.avatar = 0;
                                  karakter.avatarRenk = 0;

                                  //_controller.karakterAdi.value="Murat";
                                  _controller.karakterDurum.value = "Acemi";
                                  _controller.karakterSeviye.value=0;
                                  _controller.karakterTP.value=0;
                                  _controller.karakterAltin.value=0;
                                  _controller.karakterSonrakiSeviyeye.value=20;
                                  _controller.avatar.value = 0;
                                  _controller.avatarRenk.value = 0;
                                });

                                var gorevNumaralari=[];
                                //Görevlerin hepsi siliniyor ve varsayılan 4 görev tekrardan veritabanına kaydediliyor
                                await dosya.gorevListeOlustur().then((List tumGorevler) async {
                                  setState(() {
                                    karakter.tumGorevSayisi = tumGorevler.length;
                                  });
                                  //Veritabanında yapılan kayıtların numaraları yazılma-silinmeden dolayı değişiyor.İlkönce onları tespit ediyoruz.
                                  for (int i=0;i<karakter.tumGorevSayisi;i++){
                                    gorevNumaralari.add(tumGorevler[i].no);
                                  }

                                  for(int i=0;i<karakter.tumGorevSayisi;i++)
                                    await dosya.gorevSil(gorevNumaralari[i]);
                                });

                                var gorev1 = Gorevler(
                                    no: 1,
                                    ad: 'Kitap okunacak',
                                    aciklama: '30 dk',
                                    tarih: tarih,
                                    tekrar: 'Her gün',
                                    yapildi: 'Hayır',
                                    basariDurumu: '',
                                    altin: 1,
                                    TP: 1,
                                    beceriTP: 1,
                                    beceri: 'Kişisel Gelişim',
                                    onem: 2);
                                var gorev2 = Gorevler(
                                    no: 2,
                                    ad: 'Satranca çalışılacak',
                                    aciklama: '5 kombinezon çözülecek',
                                    tarih: tarih,
                                    tekrar: 'Her gün',
                                    yapildi: 'Hayır',
                                    basariDurumu: '',
                                    altin: 1,
                                    TP: 1,
                                    beceriTP: 1,
                                    beceri: 'Satranç',
                                    onem: 2);
                                var gorev3 = Gorevler(
                                    no: 3,
                                    ad: 'Alışveriş yapılacak',
                                    aciklama: 'Ekmek,peynir,zeytin alınacak',
                                    tarih: tarih,
                                    tekrar: 'Her hafta',
                                    yapildi: 'Hayır',
                                    basariDurumu: '',
                                    altin: 1,
                                    TP: 1,
                                    beceriTP: 1,
                                    beceri: 'Ev Düzeni',
                                    onem: 1);
                                var gorev4 = Gorevler(
                                    no: 4,
                                    ad: 'Yürüyüş yapılacak',
                                    aciklama: '10.000 adım atılacak',
                                    tarih: tarih,
                                    tekrar: 'Her gün',
                                    yapildi: 'Hayır',
                                    basariDurumu: '',
                                    altin: 1,
                                    TP: 1,
                                    beceriTP: 1,
                                    beceri: 'Yürüyüş',
                                    onem: 1);

                                await dosya.gorevEkle(gorev1);
                                await dosya.gorevEkle(gorev2);
                                await dosya.gorevEkle(gorev3);
                                await dosya.gorevEkle(gorev4);

                                await dosya.gorevListeOlustur().then((List tumGorevler) async {
                                  setState(() {
                                    _controller.tumGorevler.value = tumGorevler;
                                    _controller.tumGorevSayisi.value = tumGorevler.length;
                                    karakter.tumGorevler = tumGorevler;
                                    karakter.tumGorevSayisi = tumGorevler.length;
                                  });
                                });

                                await dosya
                                    .gorevBugunTariheGoreListeOlustur()
                                    .then((List bugunkuGorevler) async{
                                  setState(() {
                                    _controller.bugunkuGorevler.value = bugunkuGorevler;
                                    _controller.cBugunkuGorevSayisi.value = bugunkuGorevler.length;
                                    _controller.popupMenuGorevSayisi.value =
                                        _controller.cBugunkuGorevSayisi.value;
                                    _controller.secilenGorevler.value = bugunkuGorevler;
                                    _controller.secilenGorevSayisi.value = bugunkuGorevler.length;

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

                                gorevNumaralari=[];
                                //Görevlerin hepsi siliniyor ve varsayılan 4 görev tekrardan veritabanına kaydediliyor
                                await dosya.gorevGecmisListeOlustur().then((List gecmisGorevler) async {
                                  setState(() {
                                    karakter.gecmisGorevSayisi = gecmisGorevler.length;
                                  });
                                  //Veritabanında yapılan kayıtların numaraları yazılma-silinmeden dolayı değişiyor.İlkönce onları tespit ediyoruz.
                                  for (int i=0;i<karakter.gecmisGorevSayisi;i++){
                                    gorevNumaralari.add(gecmisGorevler[i].no);
                                  }

                                  for(int i=0;i<karakter.gecmisGorevSayisi;i++)
                                    await dosya.gorevSil(gorevNumaralari[i]);
                                });
                                //Bütün beceriler siliniyor ve daha sonra varsayılan beceriler yükleniyor
                                //Beceriler ilk değerlerine sıfırlanıyor
                                for(int i=0;i<karakter.beceriSayisi;i++)
                                  await dosya.beceriSil(beceriler.beceriAdlari[i]);

                                await dosya.gorevGecmisListeOlustur()
                                    .then((gecmisGorevler) async {
                                  setState(() {
                                    _controller.gecmisGorevler.value = gecmisGorevler;
                                    _controller.gecmisGorevSayisi.value = gecmisGorevler.length;
                                    karakter.gecmisGorevler = gecmisGorevler;
                                    karakter.gecmisGorevSayisi = gecmisGorevler.length;
                                  });
                                });

                                var beceriAdlari=[];
                                //Becerilerin hepsi siliniyor ve varsayılanlar tekrardan veritabanına kaydediliyor
                                await dosya.beceriListeOlustur().then((List beceriler) async {
                                  setState(() {
                                    karakter.beceriSayisi = beceriler.length;
                                  });
                                  //Veritabanında yapılan kayıtların numaraları yazılma-silinmeden dolayı değişiyor.İlkönce onları tespit ediyoruz.
                                  //Bütün beceriler siliniyor ve daha sonra varsayılan beceriler yükleniyor
                                  //Beceriler ilk değerlerine sıfırlanıyor
                                  for (int i=0;i<karakter.beceriSayisi;i++){
                                    beceriAdlari.add(beceriler[i].ad);
                                  }

                                  for(int i=0;i<karakter.beceriSayisi;i++)
                                    await dosya.beceriSil(beceriAdlari[i]);
                                });


                                var beceri1 = Beceri(
                                    ad: 'Aile',
                                    seviye: 0,
                                    beceriTP: 0
                                );
                                var beceri2 = Beceri(
                                    ad: 'Ev Düzeni',
                                    seviye: 0,
                                    beceriTP: 0
                                );
                                var beceri3 = Beceri(
                                    ad: 'Kişisel Bakım',
                                    seviye: 0,
                                    beceriTP: 0
                                );
                                var beceri4 = Beceri(
                                    ad: 'Mesleki Yeterlilik',
                                    seviye: 0,
                                    beceriTP: 0
                                );
                                var beceri5 = Beceri(
                                    ad: 'İletişim',
                                    seviye: 0,
                                    beceriTP: 0
                                );
                                var beceri6 = Beceri(
                                    ad: 'Alimlik',
                                    seviye: 0,
                                    beceriTP: 0
                                );
                                var beceri7 = Beceri(
                                    ad: 'Disiplin',
                                    seviye: 0,
                                    beceriTP: 0
                                );
                                var beceri8 = Beceri(
                                    ad: 'Ekonomi',
                                    seviye: 0,
                                    beceriTP: 0
                                );
                                var beceri9 = Beceri(
                                    ad: 'Yemek Pişirme',
                                    seviye: 0,
                                    beceriTP: 0
                                );
                                var beceri10 = Beceri(
                                    ad: 'Satranç',
                                    seviye: 0,
                                    beceriTP: 0
                                );
                                var beceri11 = Beceri(
                                    ad: 'Araba',
                                    seviye: 0,
                                    beceriTP: 0
                                );
                                var beceri12 = Beceri(
                                    ad: 'Meditasyon',
                                    seviye: 0,
                                    beceriTP: 0
                                );
                                var beceri13 = Beceri(
                                    ad: 'Matematik',
                                    seviye: 0,
                                    beceriTP: 0
                                );
                                var beceri14 = Beceri(
                                    ad: 'Müzik',
                                    seviye: 0,
                                    beceriTP: 0
                                );
                                var beceri15 = Beceri(
                                    ad: 'Vücut Geliştirme',
                                    seviye: 0,
                                    beceriTP: 0
                                );
                                var beceri16 = Beceri(
                                    ad: 'Yürüyüş',
                                    seviye: 0,
                                    beceriTP: 0
                                );
                                var beceri17 = Beceri(
                                    ad: 'Kişisel Gelişim',
                                    seviye: 0,
                                    beceriTP: 0
                                );

                                await dosya.beceriEkle(beceri1);
                                await dosya.beceriEkle(beceri2);
                                await dosya.beceriEkle(beceri3);
                                await dosya.beceriEkle(beceri4);
                                await dosya.beceriEkle(beceri5);
                                await dosya.beceriEkle(beceri6);
                                await dosya.beceriEkle(beceri7);
                                await dosya.beceriEkle(beceri8);
                                await dosya.beceriEkle(beceri9);
                                await dosya.beceriEkle(beceri10);
                                await dosya.beceriEkle(beceri11);
                                await dosya.beceriEkle(beceri12);
                                await dosya.beceriEkle(beceri13);
                                await dosya.beceriEkle(beceri14);
                                await dosya.beceriEkle(beceri15);
                                await dosya.beceriEkle(beceri16);
                                await dosya.beceriEkle(beceri17);

                                await dosya.beceriListeOlustur().then((List tumBeceriler) async {

                                  setState(() {
                                    karakter.beceriSayisi = tumBeceriler.length;
                                    _controller.beceriSayisi.value = tumBeceriler.length;
                                    _controller.beceriler.value = tumBeceriler;

                                    beceriler.beceriAdlari=[];
                                    beceriler.seviye=[];
                                    beceriler.beceriTP=[];

                                    for (int i = 0; i < tumBeceriler.length; i++) {
                                      beceriler.beceriAdlari.add(tumBeceriler[i].ad);
                                      beceriler.seviye.add(tumBeceriler[i].seviye);
                                      beceriler.beceriTP.add(tumBeceriler[i].beceriTP);
                                    }
                                  });
                                });

                                //Başarılar ilk değerlerine sıfırlanıyor
                                var basari1 = Basari(
                                    no: 1,
                                    basari: "Karakter seviyeniz 2 oldu",
                                    tarih: '',
                                    basarildimi: 0,
                                    TP: 2,
                                    altin: 2,
                                    gosterildimi: 0
                                );
                                var basari2 = Basari(
                                    no: 2,
                                    basari: "Karakter seviyeniz 3 oldu",
                                    tarih: '',
                                    basarildimi: 0,
                                    TP: 4,
                                    altin: 4,
                                    gosterildimi: 0
                                );
                                var basari3 = Basari(
                                    no: 3,
                                    basari: "Karakter seviyeniz 4 oldu",
                                    tarih: '',
                                    basarildimi: 0,
                                    TP: 4,
                                    altin: 4,
                                    gosterildimi: 0
                                );
                                var basari4 = Basari(
                                    no: 4,
                                    basari: "20 altınınız oldu",
                                    tarih: '',
                                    basarildimi: 0,
                                    TP: 1,
                                    altin: 1,
                                    gosterildimi: 0
                                );
                                var basari5 = Basari(
                                    no: 5,
                                    basari: "50 altınınız oldu",
                                    tarih: '',
                                    basarildimi: 0,
                                    TP: 1,
                                    altin: 1,
                                    gosterildimi: 0
                                );
                                var basari6 = Basari(
                                    no: 6,
                                    basari: "100 altınınız oldu",
                                    tarih: '',
                                    basarildimi: 0,
                                    TP: 2,
                                    altin: 2,
                                    gosterildimi: 0
                                );

                                await dosya.basariGuncelle(basari1);
                                await dosya.basariGuncelle(basari2);
                                await dosya.basariGuncelle(basari3);
                                await dosya.basariGuncelle(basari4);
                                await dosya.basariGuncelle(basari5);
                                await dosya.basariGuncelle(basari6);

                                await dosya.basariListeOlustur().then((List tumBasarilar) async {
                                  karakter.basariSayisi = tumBasarilar.length;
                                  _controller.basariSayisi.value = tumBasarilar.length;
                                  _controller.basarilar.value = tumBasarilar;
                                  karakter.basarilar=tumBasarilar;

                                  karakter.eldeEdilenBasariSayisi=0;
                                  for (int i=0;i<karakter.basariSayisi;i++)
                                    basarildimiKontrol[i] = false;

                                  _controller.eldeEdilenBasariSayisi.value=karakter.eldeEdilenBasariSayisi;
                                });

                                var hedefNumaralari=[];
                                //Becerilerin hepsi siliniyor ve varsayılanlar tekrardan veritabanına kaydediliyor
                                await dosya.hedefListeOlustur().then((List hedefler) async {
                                  setState(() {
                                    karakter.hedefSayisi = hedefler.length;
                                  });
                                  //Veritabanında yapılan kayıtların numaraları yazılma-silinmeden dolayı değişiyor.İlkönce onları tespit ediyoruz.
                                  //Bütün hedefler siliniyor ve daha sonra varsayılan hedefler yükleniyor
                                  //Hedefler ilk değerlerine sıfırlanıyor
                                  for (int i=0;i<karakter.hedefSayisi;i++){
                                    hedefNumaralari.add(hedefler[i].no);
                                  }

                                  for(int i=0;i<karakter.hedefSayisi;i++)
                                    await dosya.hedefSil(hedefNumaralari[i]);
                                });

                                var hedef = Hedef(
                                    no: 1,
                                    hedef: '1 ay boyunca günde 10.000 adım atılacak',
                                    yapilacakGun: 30,
                                    yapilanGun: 0,
                                    altin: 30,
                                    TP: 30,
                                    beceri: 'Yürüyüş',
                                    beceriTP: 30,
                                    basTarih: tarih,
                                    bitTarih: birAySonraTarih,
                                    yapildi: 'Hayır'
                                );

                                //Eğer veritabanında hiç veri yoksa 1 tane kayıt oluşturuluyor ve bu veriler ilk değerler olarak atanıyor
                                await dosya.hedefEkle(hedef);

                                await dosya.hedefListeOlustur().then((List hedefler) async {
                                  setState(() {
                                    _controller.hedefler.value = hedefler;
                                    _controller.hedefSayisi.value = hedefler.length;
                                    karakter.hedefler = hedefler;
                                    karakter.hedefSayisi = hedefler.length;
                                  });
                                });

                                await dosya.gorevGrafikListeOlustur().then((List grafik) async {
                                  setState(() {
                                    _controller.grafik.value = grafik;
                                    _controller.grafikVeriSayisi.value = grafik.length;
                                    karakter.grafik = grafik;
                                    karakter.grafikVeriSayisi = grafik.length;
                                  });
                                });

                                await dosya.gorevGrafikListeOlustur2().then((List grafik2) async {
                                  setState(() {
                                    _controller.grafik2.value = grafik2;
                                    _controller.grafikVeriSayisi2.value = grafik2.length;
                                    karakter.grafik2 = grafik2;
                                    karakter.grafikVeriSayisi2 = grafik2.length;
                                  });
                                });

                                Get.back();
                                });
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
                      child: const Text('Tüm verileri sıfırla', style: TextStyle(fontSize: 20)),
                    ),
                  ],
                ),
                Row(
                  children:[
                    Icon(Icons.info_outlined),
                    SizedBox(width: 20.0),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Alert(
                          context: context,
                          style: alertStyle,

                          type: AlertType.info,
                          title: "HAKKINDA",
                          desc: "Program Murat İyigün tarafından yazılmıştır.\n\nHayatınızın rutinine renk katmak amaçlanmaktadır.\n\nYapım yılı: 2021\n\nİletişim: miyigun@hotmail.com\n\nVersiyon: 1.0",
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

                      },
                      child: const Text('Hakkında', style: TextStyle(fontSize: 20)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.login_outlined),
                    SizedBox(width: 20.0),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Alert(
                          context: context,
                          type: AlertType.warning,
                          style: alertStyle,
                          title: "UYARI",
                          desc: "Programdan çıkmak istediğinizden emin misiniz?",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "EVET",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () => exit(0),
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
                      child: const Text('Çıkış', style: TextStyle(fontSize: 20)),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


