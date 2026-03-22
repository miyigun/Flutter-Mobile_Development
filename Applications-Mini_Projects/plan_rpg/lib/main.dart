import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:plan_rpg/Yapilacaklar/YapilmisGorevListesi.dart';
import 'package:plan_rpg/Yapilacaklar/Grafik.dart';
import 'package:plan_rpg/Yapilacaklar/Hedefler.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'Ayarlar/AyarlarTab.dart';
import 'Gorev.dart';
import 'Scene1/karakterAvatar.dart';
import 'Yapilacaklar/Araclar.dart';
import 'Yapilacaklar/GecikmisGorevListesi.dart';
import 'Yapilacaklar/MarketTab.dart';
import 'Yapilacaklar/bugunGorevListesi.dart';
import 'Yapilacaklar/tumGorevListesi.dart';
import 'Yapilacaklar/yarinGorevListesi.dart';
import 'karakter.dart';
import 'package:flutter/material.dart';
import 'beceriler.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
//bu paketi eklemek için pubspec.yaml'a 'flutter.icon:' yazdım
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:intl/intl.dart';
// import ‘package:google_mobile_ads/google_mobile_ads.dart’;

class Controller extends GetxController {
  var _karakterAdi = ''.obs;
  var _karakterDurum='Acemi'.obs;
  var _avatar=0.obs;
  var _avatarRenk=0.obs;
  var _karakterSeviye=0.obs;
  var _karakterTP=0.obs;
  var _karakterAltin=0.obs;
  var _karakterSonrakiSeviyeye=20.obs;
  var _beceriler=[].obs;
  var _beceriSayisi=0.obs;
  var _basarilar=[].obs;
  var _basariSayisi=0.obs;
  var _tumGorevler=[].obs;
  var _bugunkuGorevler=[].obs;
  var _yarinkiGorevler=[].obs;
  var _gecmisGorevler=[].obs;
  var _tumGorevSayisi=0.obs;
  var _market=[].obs;
  var _cBugunkuGorevSayisi=0.obs;
  var _yarinkiGorevSayisi=0.obs;
  var _gecmisGorevSayisi=0.obs;
  var _yeniGorevAdi=''.obs;
  var _yeniGorevTarih=tarih.obs;
  var _yeniGorevBeceriTP=0.obs;
  var _yeniGorevTP=0.obs;
  var _yeniGorevAltin=0.obs;
  var _yeniGorevTekrar='1 kez'.obs;
  var _yeniGorevIliskiliBeceri=''.obs;
  var _popupMenuGorevGunu='Bugün'.obs;
  var _popupMenuGorevSayisi=0.obs;
  var _secilenGorevSayisi=0.obs;
  var _secilenGorevler=[].obs;
  var _eldeEdilenBasariSayisi=0.obs;
  var _basarildimiKontrol=[].obs;
  var _marketUrunSayisi=0.obs;
  var _yeniGorevAciklama=''.obs;
  var _yeniUrunAdi=''.obs;
  var _yeniUrunAltin=0.obs;
  var _yeniUrunStok=0.obs;
  var _yeniUrunAvatar=0.obs;
  var _yeniUrunAvatarRenk=0.obs;
  var _yeniGorevOnem=1.obs;
  var _hedefSayisi=0.obs;
  var _hedefler=[].obs;
  var _yeniHedefAdi=''.obs;
  var _yeniHedefTP=0.obs;
  var _yeniHedefAltin=0.obs;
  var _yeniHedefBasTarih=''.obs;
  var _yeniHedefBitTarih=''.obs;
  var _yeniHedefIliskiliBeceri=''.obs;
  var _yeniHedefBeceriTP=0.obs;
  var _yeniHedefYapilacakGunSayisi=0.obs;
  var _grafik=[].obs;
  var _grafikVeriSayisi=0.obs;
  var _grafik2=[].obs;
  var _grafikVeriSayisi2=0.obs;
  var _gorevGuncelleOnem=''.obs;
  var _gorevGuncelleTekrar=''.obs;
  var _yeniGorevGunuTekrarSayisi=0.obs;
  var _yeniGorevTekrarGunleri=''.obs;
  var _gecikmisGorevler=[].obs;
  var _gecikmisGorevSayisi=0.obs;

  get gecikmisGorevSayisi => _gecikmisGorevSayisi;

  set gecikmisGorevSayisi(value) {
    _gecikmisGorevSayisi = value;
  }

  get gecikmisGorevler => _gecikmisGorevler;

  set gecikmisGorevler(value) {
    _gecikmisGorevler = value;
  }

  get yeniGorevTekrarGunleri => _yeniGorevTekrarGunleri;

  set yeniGorevTekrarGunleri(value) {
    _yeniGorevTekrarGunleri = value;
  }

  get yeniGorevGunuTekrarSayisi => _yeniGorevGunuTekrarSayisi;

  set yeniGorevGunuTekrarSayisi(value) {
    _yeniGorevGunuTekrarSayisi = value;
  }

  get gorevGuncelleTekrar => _gorevGuncelleTekrar;

  set gorevGuncelleTekrar(value) {
    _gorevGuncelleTekrar = value;
  }

  get gorevGuncelleOnem => _gorevGuncelleOnem;

  set gorevGuncelleOnem(value) {
    _gorevGuncelleOnem = value;
  }

  get grafikVeriSayisi2 => _grafikVeriSayisi2;

  set grafikVeriSayisi2(value) {
    _grafikVeriSayisi2 = value;
  }

  get grafik2 => _grafik2;

  set grafik2(value) {
    _grafik2 = value;
  }

  get grafikVeriSayisi => _grafikVeriSayisi;

  set grafikVeriSayisi(value) {
    _grafikVeriSayisi = value;
  }

  get grafik => _grafik;

  set grafik(value) {
    _grafik = value;
  }

  get yeniHedefYapilacakGunSayisi => _yeniHedefYapilacakGunSayisi;

  set yeniHedefYapilacakGunSayisi(value) {
    _yeniHedefYapilacakGunSayisi = value;
  }

  get yeniHedefBeceriTP => _yeniHedefBeceriTP;

  set yeniHedefBeceriTP(value) {
    _yeniHedefBeceriTP = value;
  }

  get yeniHedefIliskiliBeceri => _yeniHedefIliskiliBeceri;

  set yeniHedefIliskiliBeceri(value) {
    _yeniHedefIliskiliBeceri = value;
  }

  get yeniHedefBitTarih => _yeniHedefBitTarih;

  set yeniHedefBitTarih(value) {
    _yeniHedefBitTarih = value;
  }

  get yeniHedefBasTarih => _yeniHedefBasTarih;

  set yeniHedefBasTarih(value) {
    _yeniHedefBasTarih = value;
  }

  get yeniHedefAltin => _yeniHedefAltin;

  set yeniHedefAltin(value) {
    _yeniHedefAltin = value;
  }

  get yeniHedefTP => _yeniHedefTP;

  set yeniHedefTP(value) {
    _yeniHedefTP = value;
  }

  get yeniHedefAdi => _yeniHedefAdi;

  set yeniHedefAdi(value) {
    _yeniHedefAdi = value;
  }

  get hedefler => _hedefler;

  set hedefler(value) {
    _hedefler = value;
  }

  get hedefSayisi => _hedefSayisi;

  set hedefSayisi(value) {
    _hedefSayisi = value;
  }

  get yeniGorevOnem => _yeniGorevOnem;

  set yeniGorevOnem(value) {
    _yeniGorevOnem = value;
  }

  get yeniUrunAvatarRenk => _yeniUrunAvatarRenk;

  set yeniUrunAvatarRenk(value) {
    _yeniUrunAvatarRenk = value;
  }

  get yeniUrunAvatar => _yeniUrunAvatar;

  set yeniUrunAvatar(value) {
    _yeniUrunAvatar = value;
  }

  get yeniUrunStok => _yeniUrunStok;

  set yeniUrunStok(value) {
    _yeniUrunStok = value;
  }

  get yeniUrunAltin => _yeniUrunAltin;

  set yeniUrunAltin(value) {
    _yeniUrunAltin = value;
  }

  get yeniUrunAdi => _yeniUrunAdi;

  set yeniUrunAdi(value) {
    _yeniUrunAdi = value;
  }

  get yeniGorevAciklama => _yeniGorevAciklama;

  set yeniGorevAciklama(value) {
    _yeniGorevAciklama = value;
  }

  get marketUrunSayisi => _marketUrunSayisi;

  set marketUrunSayisi(value) {
    _marketUrunSayisi = value;
  }

  get basarildimiKontrol => _basarildimiKontrol;

  set basarildimiKontrol(value) {
    _basarildimiKontrol = value;
  }

  get eldeEdilenBasariSayisi => _eldeEdilenBasariSayisi;

  set eldeEdilenBasariSayisi(value) {
    _eldeEdilenBasariSayisi = value;
  }

  get karakterDurum => _karakterDurum;

  set karakterDurum(value) {
    _karakterDurum = value;
  }

  get karakterSeviye => _karakterSeviye;

  set karakterSeviye(value) {
    _karakterSeviye = value;
  }

  get yeniGorevBeceriTP => _yeniGorevBeceriTP;

  set yeniGorevBeceriTP(value) {
    _yeniGorevBeceriTP = value;
  }

  get market => _market;

  set market(value) {
    _market = value;
  }

  get gecmisGorevler => _gecmisGorevler;

  set gecmisGorevler(value) {
    _gecmisGorevler = value;
  }

  get gecmisGorevSayisi => _gecmisGorevSayisi;

  set gecmisGorevSayisi(value) {
    _gecmisGorevSayisi = value;
  }

  get secilenGorevSayisi => _secilenGorevSayisi;

  set secilenGorevSayisi(value) {
    _secilenGorevSayisi = value;
  }

  get popupMenuGorevGunu => _popupMenuGorevGunu;

  set popupMenuGorevGunu(value) {
    _popupMenuGorevGunu = value;
  }

  get yeniGorevAdi => _yeniGorevAdi;

  set yeniGorevAdi(value) {
    _yeniGorevAdi = value;
  }

  get tumGorevler => _tumGorevler;

  set tumGorevler(value) {
    _tumGorevler = value;
  }

  get basarilar => _basarilar;

  set basarilar(value) {
    _basarilar = value;
  }

  get beceriSayisi => _beceriSayisi;

  set beceriSayisi(value) {
    _beceriSayisi = value;
  }

  get karakterAdi => _karakterAdi.value;

  set karakterAdi(value) => _karakterAdi.value = value;

  get avatar => _avatar;

  set avatar(value) {
    _avatar = value;
  }

  get avatarRenk => _avatarRenk;

  set avatarRenk(value) {
    _avatarRenk = value;
  }

  get beceriler => _beceriler;

  set beceriler(value) {
    _beceriler = value;
  }

  get basariSayisi => _basariSayisi;

  set basariSayisi(value) {
    _basariSayisi = value;
  }

  get bugunkuGorevler => _bugunkuGorevler;

  set bugunkuGorevler(value) {
    _bugunkuGorevler = value;
  }

  get yarinkiGorevler => _yarinkiGorevler;

  set yarinkiGorevler(value) {
    _yarinkiGorevler = value;
  }

  get tumGorevSayisi => _tumGorevSayisi;

  set tumGorevSayisi(value) {
    _tumGorevSayisi = value;
  }

  get cBugunkuGorevSayisi => _cBugunkuGorevSayisi;

  set cBugunkuGorevSayisi(value) {
    _cBugunkuGorevSayisi = value;
  }

  get yarinkiGorevSayisi => _yarinkiGorevSayisi;

  set yarinkiGorevSayisi(value) {
    _yarinkiGorevSayisi = value;
  }

  get yeniGorevTarih => _yeniGorevTarih;

  set yeniGorevTarih(value) {
    _yeniGorevTarih = value;
  }

  get yeniGorevTP => _yeniGorevTP;

  set yeniGorevTP(value) {
    _yeniGorevTP = value;
  }

  get yeniGorevAltin => _yeniGorevAltin;

  set yeniGorevAltin(value) {
    _yeniGorevAltin = value;
  }

  get yeniGorevTekrar => _yeniGorevTekrar;

  set yeniGorevTekrar(value) {
    _yeniGorevTekrar = value;
  }

  get yeniGorevIliskiliBeceri => _yeniGorevIliskiliBeceri;

  set yeniGorevIliskiliBeceri(value) {
    _yeniGorevIliskiliBeceri = value;
  }

  get popupMenuGorevSayisi => _popupMenuGorevSayisi;

  set popupMenuGorevSayisi(value) {
    _popupMenuGorevSayisi = value;
  }

  get secilenGorevler => _secilenGorevler;

  set secilenGorevler(value) {
    _secilenGorevler = value;
  }

  get karakterTP => _karakterTP;

  set karakterTP(value) {
    _karakterTP = value;
  }

  get karakterAltin => _karakterAltin;

  set karakterAltin(value) {
    _karakterAltin = value;
  }

  get karakterSonrakiSeviyeye => _karakterSonrakiSeviyeye;

  set karakterSonrakiSeviyeye(value) {
    _karakterSonrakiSeviyeye = value;
  }
}

class Grafik {
  final int no;
  final String tarih;
  final String basariDurumu;
  final int TP;
  final int altin;

  Grafik({required this.no, required this.tarih,required this.basariDurumu,required this.TP,required this.altin});

  @override
  String toString() {
    return 'Grafik{no: $no, tarih: $tarih, basariDurumu: $basariDurumu, TP: $TP, altin: $altin}';
  }

}

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

//Herhangi bir kütüphane import etmeden tarihi ayarlayabilirim
//String convertedDateTime = "${now.day.toString()}/${now.month.toString().padLeft(2,'0')}/${now.year.toString().padLeft(2,'0')} ${now.hour.toString()}-${now.minute.toString()}";
//Bugünün,dünün ve yarının tarihleri ayarlanıyor
DateTime now = DateTime.now();
String tarih =DateFormat('yyyy-MM-dd').format(now);
//"${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}/${now.year.toString().padLeft(2, '0')}";
DateTime dun = DateTime.now().subtract(Duration(days: 1));
String dunTarih =DateFormat('yyyy-MM-dd').format(dun);
//"${dun.day.toString().padLeft(2, '0')}/${dun.month.toString().padLeft(2, '0')}/${dun.year.toString().padLeft(2, '0')}";
DateTime yarin = DateTime.now().add(Duration(days: 1));
String yarinTarih =DateFormat('yyyy-MM-dd').format(yarin);
//"${yarin.day.toString().padLeft(2, '0')}/${yarin.month.toString().padLeft(2, '0')}/${yarin.year.toString().padLeft(2, '0')}";
DateTime birHaftaSonra = DateTime.now().add(Duration(days: 7));
String birHaftaSonraTarih =DateFormat('yyyy-MM-dd').format(birHaftaSonra);
//"${birHaftaSonra.day.toString().padLeft(2, '0')}/${birHaftaSonra.month.toString().padLeft(2, '0')}/${birHaftaSonra.year.toString().padLeft(2, '0')}";
DateTime birAySonra = DateTime.now().add(Duration(days: 30));
String birAySonraTarih =DateFormat('yyyy-MM-dd').format(birAySonra);
//"${birAySonra.day.toString().padLeft(2, '0')}/${birAySonra.month.toString().padLeft(2, '0')}/${birAySonra.year.toString().padLeft(2, '0')}";
DateTime birYilSonra = DateTime.now().add(Duration(days: 365));
String birYilSonraTarih =DateFormat('yyyy-MM-dd').format(birYilSonra);
//"${birYilSonra.day.toString().padLeft(2, '0')}/${birYilSonra.month.toString().padLeft(2, '0')}/${birYilSonra.year.toString().padLeft(2, '0')}";

Karakter karakter = new Karakter(
    "Murat", "Acemi", 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, [], [], [], [],[],[],0,[],0,[],0,0,[],[],0,[],0,[],0);
Beceriler beceriler = new Beceriler([],[], [],[]);
Gorev gorev = new Gorev(0, "", "", "", "","", 0, 0, 0,"");
DosyaIslemleri dosya = new DosyaIslemleri();
var yeniKullaniciAdiGirisi = TextEditingController();
var yeniBeceriGirisi = TextEditingController();
var yazdirilacak = '';
int gosterilenTab = 0;
final iliskilibecericontrol=TextEditingController();
final items = List<String>.generate(beceriler.beceriAdlari.length, (i) => beceriler.beceriAdlari[i]);
Gorev yeniGorev=new Gorev(0, '', '', '', '','', 0, 0,0, '');
enum gorevTarih { bugun, yarin, baskatarih}
var gosterilecekTarih=tarih;
List<bool> basarildimiKontrol=List.generate(100, (index) => false);

// You can also test with your own ad unit IDs by registering your device as a
// test device. Check the logs for your device's ID value.
const String testDevice = 'YOUR_DEVICE_ID';
const int maxFailedLoadAttempts = 3;

const iconColor = <Color>[
  Colors.blue,
  Colors.black,
  Colors.red,
  Colors.green,
  Colors.yellow,
  Colors.pink,
  Colors.orange,
  Colors.lime,
  Colors.brown,
  Colors.cyan,
  Colors.blueGrey,
  Colors.amber,
  Colors.grey,
  Colors.indigo,
  Colors.purple,
  Colors.teal,
];

final  List<IconData> avatar = [
  Icons.military_tech_sharp,
  Icons.favorite_sharp,
  Icons.accessibility_new_sharp,
  Icons.science_sharp,
  Icons.emoji_people_sharp,
  Icons.directions_bike_sharp,
  Icons.family_restroom_sharp,
  Icons.pregnant_woman_sharp,
  Icons.sentiment_satisfied_sharp,
  Icons.cake_sharp,
  Icons.female_sharp,
  Icons.male_sharp,
  Icons.hiking_sharp,
  Icons.sports_kabaddi_sharp,
  Icons.sports_tennis_sharp,
  Icons.sports_handball_sharp,
  Icons.kayaking_sharp,
  Icons.downhill_skiing_sharp,
  Icons.nordic_walking_sharp,
  Icons.kitesurfing_sharp,
  Icons.snowboarding_sharp,
  Icons.snowshoeing_sharp,
  Icons.ice_skating_sharp,
  Icons.sledding_sharp,
  Icons.celebration_sharp,
  Icons.star_sharp,
  Icons.star_outline_sharp,
  Icons.pool_sharp,
  Icons.bathtub_sharp,
  Icons.face_outlined,
  Icons.flutter_dash_outlined,
  Icons.outlet_outlined,
  Icons.rowing_outlined,
  Icons.sentiment_very_satisfied_outlined,
  Icons.self_improvement_outlined,
  Icons.sentiment_neutral_outlined,
  Icons.mood_bad_outlined,
  Icons.emoji_nature_outlined,
  Icons.sports_outlined,
  Icons.outdoor_grill_outlined,
  Icons.elderly_outlined,
  Icons.follow_the_signs_outlined,
  Icons.surfing_outlined,
  Icons.kayaking_outlined,
  Icons.sports_cricket_outlined,
  Icons.directions_run_outlined,
  Icons.directions_walk_outlined,
  Icons.sailing_outlined,
  Icons.hail_outlined,
  Icons.support_agent_outlined,
  Icons.toys_outlined,
  Icons.fitness_center_outlined,
  Icons.beach_access_outlined,
  Icons.tapas_outlined,
  Icons.ac_unit,
  Icons.all_inclusive,
  Icons.attach_money,
  Icons.audiotrack,
  Icons.card_giftcard,
  Icons.color_lens,
  Icons.card_travel,
  Icons.child_friendly,
  Icons.content_cut,
  Icons.desktop_mac,
  Icons.drive_eta,
  Icons.directions_boat,
  Icons.flight,
  //Icons.goat,
  Icons.hotel,
  Icons.hourglass_empty,
  Icons.linked_camera,
  Icons.local_post_office,
  Icons.print,
  Icons.smoking_rooms,
  Icons.spa,
  Icons.straighten,
  Icons.vpn_key,
];

final List<IconData> urunAvatar=[
  Icons.coffee_outlined,
  Icons.local_bar_outlined,
  Icons.emoji_food_beverage_outlined,
  Icons.local_drink_outlined,
  FontAwesome5.gulp,
  Icons.icecream_outlined,
  FontAwesome5.pizza_slice,
  Icons.lunch_dining_outlined,
  FontAwesome5.birthday_cake,
  Icons.tapas_outlined,
  Icons.directions_walk_outlined,
  Icons.headset_outlined,
  Icons.pool_outlined,
  Icons.yard_outlined,
  Icons.local_movies_outlined,
  Icons.dining_outlined,
  Icons.local_post_office_outlined,
  Icons.outdoor_grill_outlined,
  Icons.restaurant_outlined,
  Icons.liquor_outlined,
  Icons.ramen_dining_outlined,
  Icons.sailing_outlined,
  Icons.local_drink_outlined,
  Icons.wine_bar_outlined,
  Icons.fitness_center_outlined,
  Icons.iron_outlined,
  Icons.local_cafe_outlined,
  Icons.flatware_outlined,
  Icons.blender_outlined,
  Icons.card_travel,
  Icons.color_lens,
  Icons.content_cut,
  Icons.desktop_mac,
  Icons.directions_subway,
  Icons.drive_eta,
  Icons.directions_boat,
  Icons.flight,
  //Icons.goat,
  Icons.hotel,
  Icons.hourglass_empty,
  Icons.linked_camera,
  Icons.local_post_office,
  Icons.print,
  Icons.smoking_rooms,
  Icons.spa,
  Icons.straighten,
  Icons.vpn_key,
];

class Gorevler {
  final int no;
  final String ad;
  final String aciklama;
  final String tarih;
  final String tekrar;
  final String yapildi;
  final String basariDurumu;
  final int altin;
  final int TP;
  final int beceriTP;
  final String beceri;
  final int onem;

  Gorevler({
    required this.no,
    required this.ad,
    required this.aciklama,
    required this.tarih,
    required this.tekrar,
    required this.yapildi,
    required this.basariDurumu,
    required this.altin,
    required this.TP,
    required this.beceriTP,
    required this.beceri,
    required this.onem
  });

  Map<String, dynamic> toMap() {
    return {
      'no': no,
      'ad': ad,
      'aciklama': aciklama,
      'tarih': tarih,
      'tekrar': tekrar,
      'yapildi': yapildi,
      'basariDurumu': basariDurumu,
      'altin': altin,
      'TP': TP,
      'beceriTP': beceriTP,
      'beceri': beceri,
      'onem': onem
    };
  }

  @override
  String toString() {
    return 'Gorevler{no: $no, ad: $ad,aciklama: $aciklama, tarih: $tarih, tekrar: $tekrar, yapildi: $yapildi, basariDurumu: $basariDurumu, altin: $altin, TP: $TP,beceriTP: $beceriTP,beceri: $beceri,onem: $onem}';
  }
}

class Beceri {
  final String ad;
  final int seviye;
  final int beceriTP;

  Beceri({
    required this.ad,
    required this.seviye,
    required this.beceriTP
  });

  Map<String, dynamic> toMap() {
    return {
      'ad': ad,
      'seviye': seviye,
      'beceriTP': beceriTP
    };
  }

  @override
  String toString() {
    return 'Beceri{ad: $ad, seviye: $seviye ,beceriTP: $beceriTP}';
  }
}

class Basari {
  final int no;
  final String basari;
  final String tarih;
  final int basarildimi;
  final int TP;
  final int altin;
  final int gosterildimi;

  Basari({
    required this.no,
    required this.basari,
    required this.tarih,
    required this.basarildimi,
    required this.TP,
    required this.altin,
    required this.gosterildimi
  });

  Map<String, dynamic> toMap() {
    return {
      'no': no,
      'basari': basari,
      'tarih': tarih,
      'basarildimi': basarildimi,
      'TP': TP,
      'altin': altin,
      'gosterildimi': gosterildimi
    };
  }

  @override
  String toString() {
    return 'Basari{no: $no, basari: $basari, tarih: $tarih, basarildimi: $basarildimi, TP: $TP, altin: $altin, gosterildimi: $gosterildimi}';
  }
}

class Urun {
  final int no;
  final String ad;
  final int altin;
  final int avatar;
  final int avatarRenk;
  final int satinAlimSayisi;
  final int stok;
  final String stogaGirisTarihi;

  Urun({
    required this.no,
    required this.ad,
    required this.altin,
    required this.avatar,
    required this.avatarRenk,
    required this.satinAlimSayisi,
    required this.stok,
    required this.stogaGirisTarihi
  });

  Map<String, dynamic> toMap() {
    return {
      'no': no,
      'ad': ad,
      'altin': altin,
      'avatar': avatar,
      'avatarRenk': avatarRenk,
      'satinAlimSayisi': satinAlimSayisi,
      'stok': stok,
      'stogaGirisTarihi': stogaGirisTarihi
    };
  }

  @override
  String toString() {
    return 'Urun{no: $no, ad: $ad, altin: $altin, avatar: $avatar, avatarRenk: $avatarRenk, satinAlimSayisi: $satinAlimSayisi, stok: $stok, stogaGirisTarihi: $stogaGirisTarihi}';
  }
}

class Hedef {
  final int no;
  final String hedef;
  final int yapilacakGun;
  final int yapilanGun;
  final int altin;
  final int TP;
  final String beceri;
  final int beceriTP;
  final String basTarih;
  final String bitTarih;
  final String yapildi;

  Hedef({
    required this.no,
    required this.hedef,
    required this.yapilacakGun,
    required this.yapilanGun,
    required this.altin,
    required this.TP,
    required this.beceri,
    required this.beceriTP,
    required this.basTarih,
    required this.bitTarih,
    required this.yapildi
  });

  Map<String, dynamic> toMap() {
    return {
      'no': no,
      'hedef': hedef,
      'yapilacakGun': yapilacakGun,
      'yapilanGun': yapilanGun,
      'altin': altin,
      'TP': TP,
      'beceri': beceri,
      'beceriTP': beceriTP,
      'basTarih': basTarih,
      'bitTarih': bitTarih,
      'yapildi': yapildi
    };
  }

  @override
  String toString() {
    return 'Hedef{no: $no, hedef: $hedef,yapilacakGun: $yapilacakGun, yapilanGun: $yapilanGun, altin: $altin, TP: $TP, beceri: $beceri, beceriTP: $beceriTP, basTarih: $basTarih, bitTarih: $bitTarih, yapildi: $yapildi}';
  }
}

void main() {
  //Veritabanı ile ilgili işlemler
  //flutter ı güncellediğimizde hata oluşmaması için bu kodu yazıyoruz
  //Bunun için 'package:flutter/widgets.dart' ı import etmek gerekiyor
  WidgetsFlutterBinding.ensureInitialized();

  runApp(GetMaterialApp(
      title: 'Plan RPG',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DoIt(dosyaIslemleri: DosyaIslemleri())));
}

class DosyaIslemleri {
  //Karakter dosyası ile ilgili fonksiyonlar
//oluşturulacak dosya yolu
  Future<String> get _klasorYolu async {
    final klasor = await getApplicationDocumentsDirectory();
    return klasor.path;
  }

//dosya oluşturma
  Future<File> get _KadosyaOlustur async {
    final yol = await _klasorYolu;
    return File('$yol/karakter8.txt');
  }

//dosya okuma
  Future<String> KadosyaOku() async {
    try {
      final myDosya = await _KadosyaOlustur;
      final dosyaIcerik = myDosya.readAsString();
      return dosyaIcerik;
    } catch (e) {
      return "Hata $e";
    }
  }

//dosya yazma
  Future<File> KadosyayaYaz(String yazilacakDeger) async {
    final myDosya = await _KadosyaOlustur;
    return myDosya.writeAsString(yazilacakDeger);
  }

  //
  //dosya varlık kontrolü
  Future<bool> KadosyaVarlik() async {
    final dosya = await _KadosyaOlustur;
    return dosya.existsSync();
  }

  //Veritabanı işlemleri yapılıyor
  Future<Database> veriTabaniOlustur() async {
    final databasesPath = await getDatabasesPath();
    final dbPath = join(await databasesPath, 'gorevler17.db');

    final database =
    await openDatabase(dbPath, version: 1, onCreate: _onCreate);
    return database;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE gorevler(no INTEGER PRIMARY KEY, ad TEXT, aciklama TEXT, tarih TEXT, tekrar TEXT,yapildi TEXT, basariDurumu TEXT, altin INTEGER,TP INTEGER, beceriTP INTEGER, beceri TEXT, onem INTEGER)');
  }

  Future<void> gorevEkle(Gorevler gorev) async {
    final db = await veriTabaniOlustur();
    // You might also specify the
    // `conflictAlgorithm` to use in case the same data is inserted twice.
    // In this case, replace any previous data.
    await db.insert(
      'gorevler',
      gorev.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List> gorevListeOlustur() async {
    final db = await veriTabaniOlustur();
    final List<Map<String, dynamic>> maps2 = await db.query('gorevler',
        columns: [
          'no',
          'ad',
          'aciklama',
          'tarih',
          'tekrar',
          'yapildi',
          'basariDurumu',
          'altin',
          'TP',
          'beceriTP',
          'beceri',
          'onem'
        ],
        where: 'yapildi=?' ,
        whereArgs: ['Hayır'],
        orderBy: 'onem,tarih desc'
    );
    // Convert the List<Map<String, dynamic> into a List<Gorevler>.
    return List.generate(maps2.length, (i) {
      return Gorevler(
          no: maps2[i]['no'],
          ad: maps2[i]['ad'],
          aciklama: maps2[i]['aciklama'],
          tarih: maps2[i]['tarih'],
          tekrar: maps2[i]['tekrar'],
          yapildi: maps2[i]['yapildi'],
          basariDurumu: maps2[i]['basariDurumu'],
          altin: maps2[i]['altin'],
          TP: maps2[i]['TP'],
          beceriTP: maps2[i]['beceriTP'],
          beceri: maps2[i]['beceri'],
          onem: maps2[i]['onem']);
    });
  }

  Future<List> gorevGecikmisGorevListeOlustur() async {
    final db = await veriTabaniOlustur();
    final List<Map<String, dynamic>> maps2 = await db.query('gorevler',
        columns: [
          'no',
          'ad',
          'aciklama',
          'tarih',
          'tekrar',
          'yapildi',
          'basariDurumu',
          'altin',
          'TP',
          'beceriTP',
          'beceri',
          'onem'
        ],
        where: 'yapildi=?' ,
        whereArgs: ['Hayır'],
        orderBy: 'onem,tarih'
    );

    // Convert the List<Map<String, dynamic> into a List<Gorevler>.
    var testList=List.generate(maps2.length, (i) {
      return Gorevler(
          no: maps2[i]['no'],
          ad: maps2[i]['ad'],
          aciklama: maps2[i]['aciklama'],
          tarih: maps2[i]['tarih'],
          tekrar: maps2[i]['tekrar'],
          yapildi: maps2[i]['yapildi'],
          basariDurumu: maps2[i]['basariDurumu'],
          altin: maps2[i]['altin'],
          TP: maps2[i]['TP'],
          beceriTP: maps2[i]['beceriTP'],
          beceri: maps2[i]['beceri'],
          onem: maps2[i]['onem']);
    });

    //tarihler kıyaslanıyor
    var gecikmisList=[];
    int gun=int.parse(tarih[8]+tarih[9]);
    int ay=int.parse(tarih[5]+tarih[6]);
    int yil=int.parse(tarih[0]+tarih[1]+tarih[2]+tarih[3]);
    late int gunD,ayD,yilD;
    for(int i=0;i<maps2.length;i++){
      gunD=int.parse(testList[i].tarih[8]+testList[i].tarih[9]);
      ayD=int.parse(testList[i].tarih[5]+testList[i].tarih[6]);
      yilD=int.parse(testList[i].tarih[0]+testList[i].tarih[1]+testList[i].tarih[2]+testList[i].tarih[3]);
      if(gunD<gun && ayD<=ay && yilD<=yil)
        gecikmisList.add(testList[i]);
    };
    return gecikmisList;
  }

  Future<List> gorevBugunTariheGoreListeOlustur() async {
    final db = await veriTabaniOlustur();
    final List<Map<String, dynamic>> maps2 = await db.query('gorevler',
        columns: [
          'no',
          'ad',
          'aciklama',
          'tarih',
          'tekrar',
          'yapildi',
          'basariDurumu',
          'altin',
          'TP',
          'beceriTP',
          'beceri',
          'onem'
        ],
        where: 'tarih=? and yapildi=?' ,
        whereArgs: [tarih,'Hayır'],
        orderBy: 'onem'
    );
    // Convert the List<Map<String, dynamic> into a List<Gorevler>.
    return List.generate(maps2.length, (i) {
      return Gorevler(
          no: maps2[i]['no'],
          ad: maps2[i]['ad'],
          aciklama: maps2[i]['aciklama'],
          tarih: maps2[i]['tarih'],
          tekrar: maps2[i]['tekrar'],
          yapildi: maps2[i]['yapildi'],
          basariDurumu: maps2[i]['basariDurumu'],
          altin: maps2[i]['altin'],
          TP: maps2[i]['TP'],
          beceriTP: maps2[i]['beceriTP'],
          beceri: maps2[i]['beceri'],
          onem: maps2[i]['onem']);
    });
  }

  Future<List> gorevYarininTarihineGoreListeOlustur() async {
    final db = await veriTabaniOlustur();
    final List<Map<String, dynamic>> maps3 = await db.query('gorevler',
        columns: [
          'no',
          'ad',
          'aciklama',
          'tarih',
          'tekrar',
          'yapildi',
          'basariDurumu',
          'altin',
          'TP',
          'beceriTP',
          'beceri',
          'onem'
        ],
        where: 'tarih=? and yapildi=?',
        whereArgs: [yarinTarih,'Hayır'],
        orderBy: 'onem'
    );
    // Convert the List<Map<String, dynamic> into a List<Gorevler>.
    return List.generate(maps3.length, (i) {
      return Gorevler(
          no: maps3[i]['no'],
          ad: maps3[i]['ad'],
          aciklama: maps3[i]['aciklama'],
          tarih: maps3[i]['tarih'],
          tekrar: maps3[i]['tekrar'],
          yapildi: maps3[i]['yapildi'],
          basariDurumu: maps3[i]['basariDurumu'],
          altin: maps3[i]['altin'],
          TP: maps3[i]['TP'],
          beceriTP: maps3[i]['beceriTP'],
          beceri: maps3[i]['beceri'],
          onem: maps3[i]['onem']);
    });
  }

  Future<List> gorevGecmisListeOlustur() async {
    final db = await veriTabaniOlustur();
    final List<Map<String, dynamic>> maps3 = await db.query('gorevler',
        columns: [
          'no',
          'ad',
          'aciklama',
          'tarih',
          'tekrar',
          'yapildi',
          'basariDurumu',
          'altin',
          'TP',
          'beceriTP',
          'beceri',
          'onem'
        ],
        where: 'yapildi=?',
        whereArgs: ['Evet'],
        //En üstte en son yapılan görevler olacak. Tarihler azalan tarihlere göre sıralanacak
        orderBy: 'tarih desc'
    );
    // Convert the List<Map<String, dynamic> into a List<Gorevler>.
    return List.generate(maps3.length, (i) {
      return Gorevler(
          no: maps3[i]['no'],
          ad: maps3[i]['ad'],
          aciklama: maps3[i]['aciklama'],
          tarih: maps3[i]['tarih'],
          tekrar: maps3[i]['tekrar'],
          yapildi: maps3[i]['yapildi'],
          basariDurumu: maps3[i]['basariDurumu'],
          altin: maps3[i]['altin'],
          TP: maps3[i]['TP'],
          beceriTP: maps3[i]['beceriTP'],
          beceri: maps3[i]['beceri'],
          onem: maps3[i]['onem']);
    });
  }

  Future<void> gorevGuncelle(Gorevler gorev) async {
    // Get a reference to the database.
    final db = await veriTabaniOlustur();

    await db.update(
        'gorevler',
        gorev.toMap(),
        where: 'no = ?',
        whereArgs: [gorev.no]
    );
  }

  Future<void> gorevSil(int no) async {
    // Get a reference to the database.
    final db = await veriTabaniOlustur();
    await db.delete(
      'gorevler',
      where: 'no = ?',
      whereArgs: [no],
    );
  }

  Future<List> gorevGrafikListeOlustur() async {
    final db = await veriTabaniOlustur();

    List<Map> a = await db.rawQuery('SELECT tarih,TP,altin,basariDurumu,SUM(TP) AS TPToplam,SUM(altin) AS altinToplam,COUNT(basariDurumu) AS basariDurumBasariliSayisi FROM gorevler WHERE basariDurumu="Başarılı" AND yapildi="Evet" GROUP BY tarih');
    return a;
  }

  Future<List> gorevGrafikListeOlustur2() async {
    final db = await veriTabaniOlustur();

    List<Map> a = await db.rawQuery('SELECT tarih,TP,altin,basariDurumu,SUM(TP) AS TPToplam,SUM(altin) AS altinToplam,COUNT(basariDurumu) AS basariDurumBasarisizSayisi FROM gorevler WHERE basariDurumu="Başarısız" AND yapildi="Evet" GROUP BY tarih');
    return a;
  }

  //Veritabanı işlemleri tamamlandı

//Beceriler için veritabanı işlemleri yapılıyor
  Future<Database> beVeriTabaniOlustur() async {
    final databasesPath = await getDatabasesPath();
    final dbPath = join(await databasesPath, 'beceriler9.db');

    final database =
    await openDatabase(dbPath, version: 1, onCreate: _beOnCreate);
    return database;
  }

  void _beOnCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE beceriler(ad TEXT,seviye INTEGER, beceriTP INTEGER)');
  }

  Future<void> beceriEkle(Beceri beceri) async {
    final db = await beVeriTabaniOlustur();
    // You might also specify the
    // `conflictAlgorithm` to use in case the same data is inserted twice.
    // In this case, replace any previous data.
    await db.insert(
      'beceriler',
      beceri.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List> beceriListeOlustur() async {
    final db = await beVeriTabaniOlustur();
    // Query the table for all The Gorevler.
    final List<Map<String, dynamic>> maps = await db.query('beceriler');
    // Convert the List<Map<String, dynamic> into a List<Gorev>.
    return List.generate(maps.length, (i) {
      return Beceri(
        ad: maps[i]['ad'],
        seviye: maps[i]['seviye'],
        beceriTP: maps[i]['beceriTP'],
      );
    });
  }

  Future<void> beceriGuncelle(Beceri beceri) async {
    // Get a reference to the database.
    final db = await beVeriTabaniOlustur();
    await db.update(
      'beceriler',
      beceri.toMap(),
      where: 'ad = ?',
      whereArgs: [beceri.ad],
    );
  }

  Future<void> beceriSil(String ad) async {
    // Get a reference to the database.
    final db = await beVeriTabaniOlustur();
    await db.delete(
      'beceriler',
      where: 'ad = ?',
      whereArgs: [ad],
    );
  }
//Beceriler için veritabanı işlemleri tanımlandı

//Başarılar için veritabanı işlemleri tanımlanıyor
  Future<Database> baVeriTabaniOlustur() async {
    final databasesPath = await getDatabasesPath();
    final dbPath = join(await databasesPath, 'basarilar12.db');

    final database =
    await openDatabase(dbPath, version: 1, onCreate: _baOnCreate);
    return database;
  }

  void _baOnCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS basarilar(no INTEGER PRIMARY KEY, basari TEXT,tarih TEXT, basarildimi INTEGER, TP INTEGER, altin INTEGER, gosterildimi INTEGER)');
  }

  Future<void> basariEkle(Basari basari) async {
    final db = await baVeriTabaniOlustur();
    // You might also specify the
    // `conflictAlgorithm` to use in case the same data is inserted twice.
    // In this case, replace any previous data.
    await db.insert(
      'basarilar',
      basari.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List> basariListeOlustur() async {
    final db = await baVeriTabaniOlustur();
    // Query the table for all The Gorevler.
    final List<Map<String, dynamic>> maps = await db.query('basarilar');
    // Convert the List<Map<String, dynamic> into a List<Gorev>.
    return List.generate(maps.length, (i) {
      return Basari(
          no: maps[i]['no'],
          basari: maps[i]['basari'],
          tarih: maps[i]['tarih'],
          basarildimi: maps[i]['basarildimi'],
          TP: maps[i]['TP'],
          altin: maps[i]['altin'],
          gosterildimi: maps[i]['gosterildimi']
      );
    });
  }

  Future<void> basariGuncelle(Basari basari) async {
    // Get a reference to the database.
    final db = await baVeriTabaniOlustur();
    await db.update(
      'basarilar',
      basari.toMap(),
      where: 'no = ?',
      whereArgs: [basari.no],
    );
  }

  Future<void> basariSil(int no) async {
    // Get a reference to the database.
    final db = await baVeriTabaniOlustur();
    await db.delete(
      'basarilar',
      where: 'no = ?',
      whereArgs: [no],
    );
  }
//Başarılar için veritabanı işlemleri tanımlandı

//Market için veritabanı işlemleri tanımlanıyor
  Future<Database> maVeriTabaniOlustur() async {
    final databasesPath = await getDatabasesPath();
    final dbPath = join(await databasesPath, 'market5.db');

    final database =
    await openDatabase(dbPath, version: 1, onCreate: _maOnCreate);
    return database;
  }

  void _maOnCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS urunler(no INTEGER PRIMARY KEY, ad TEXT,altin INTEGER, avatar INTEGER, avatarRenk INTEGER, satinAlimSayisi INTEGER, stok INTEGER, stogaGirisTarihi TEXT)');
  }

  Future<void> urunEkle(Urun urun) async {
    final db = await maVeriTabaniOlustur();
    // You might also specify the
    // `conflictAlgorithm` to use in case the same data is inserted twice.
    // In this case, replace any previous data.
    await db.insert(
      'urunler',
      urun.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List> urunListeOlustur() async {
    final db = await maVeriTabaniOlustur();
    // Query the table for all The Gorevler.
    final List<Map<String, dynamic>> maps = await db.query('urunler');
    // Convert the List<Map<String, dynamic> into a List<Gorev>.
    return List.generate(maps.length, (i) {
      return Urun(
          no: maps[i]['no'],
          ad: maps[i]['ad'],
          altin: maps[i]['altin'],
          avatar: maps[i]['avatar'],
          avatarRenk: maps[i]['avatarRenk'],
          satinAlimSayisi: maps[i]['satinAlimSayisi'],
          stok: maps[i]['stok'],
          stogaGirisTarihi: maps[i]['stogaGirisTarihi']
      );
    });
  }

  Future<void> urunGuncelle(Urun urun) async {
    // Get a reference to the database.
    final db = await maVeriTabaniOlustur();
    await db.update(
      'urunler',
      urun.toMap(),
      where: 'no = ?',
      whereArgs: [urun.no],
    );
  }

  Future<void> urunSil(int no) async {
    // Get a reference to the database.
    final db = await maVeriTabaniOlustur();
    await db.delete(
      'urunler',
      where: 'no = ?',
      whereArgs: [no],
    );
  }
//Market için veritabanı işlemleri tanımlandı

//Hedef için veritabanı işlemleri yapılıyor
//Veritabanı işlemleri yapılıyor
  Future<Database> heVeriTabaniOlustur() async {
    final databasesPath = await getDatabasesPath();
    final dbPath = join(await databasesPath, 'hedef8.db');

    final database =
    await openDatabase(dbPath, version: 1, onCreate: _heOnCreate);
    return database;
  }

  void _heOnCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE hedefler(no INTEGER PRIMARY KEY, hedef TEXT, yapilacakGun INTEGER, yapilanGun INTEGER, altin INTEGER,TP INTEGER, beceri TEXT, beceriTP INTEGER , basTarih TEXT, bitTarih TEXT, yapildi TEXT)');
  }

  Future<void> hedefEkle(Hedef hedef) async {
    final db = await heVeriTabaniOlustur();
    // You might also specify the
    // `conflictAlgorithm` to use in case the same data is inserted twice.
    // In this case, replace any previous data.
    await db.insert(
      'hedefler',
      hedef.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List> hedefListeOlustur() async {
    final db = await heVeriTabaniOlustur();
    final List<Map<String, dynamic>> maps = await db.query('hedefler',
        columns: [
          'no',
          'hedef',
          'yapilacakGun',
          'yapilanGun',
          'altin',
          'TP',
          'beceri',
          'beceriTP',
          'basTarih',
          'bitTarih',
          'yapildi'
        ],
        where: 'yapildi=?',
        whereArgs: ['Hayır'],
        //En üstte en son yapılan görevler olacak. Tarihler azalan tarihlere göre sıralanacak
        orderBy: 'no'
    );
    // Convert the List<Map<String, dynamic> into a List<Gorevler>.
    return List.generate(maps.length, (i) {
      return Hedef(
        no: maps[i]['no'],
        hedef: maps[i]['hedef'],
        yapilacakGun: maps[i]['yapilacakGun'],
        yapilanGun: maps[i]['yapilanGun'],
        altin: maps[i]['altin'],
        TP: maps[i]['TP'],
        beceri: maps[i]['beceri'],
        beceriTP: maps[i]['beceriTP'],
        basTarih: maps[i]['basTarih'],
        bitTarih: maps[i]['bitTarih'],
        yapildi: maps[i]['yapildi'],
      );
    });
  }

  Future<List> tumHedefListeOlustur() async {
    final db = await heVeriTabaniOlustur();
    final List<Map<String, dynamic>> maps = await db.query('hedefler',
        columns: [
          'no',
          'hedef',
          'yapilacakGun',
          'yapilanGun',
          'altin',
          'TP',
          'beceri',
          'beceriTP',
          'basTarih',
          'bitTarih',
          'yapildi'
        ],
        //En üstte en son yapılan görevler olacak. Tarihler azalan tarihlere göre sıralanacak
        orderBy: 'no'
    );
    // Convert the List<Map<String, dynamic> into a List<Gorevler>.
    return List.generate(maps.length, (i) {
      return Hedef(
        no: maps[i]['no'],
        hedef: maps[i]['hedef'],
        yapilacakGun: maps[i]['yapilacakGun'],
        yapilanGun: maps[i]['yapilanGun'],
        altin: maps[i]['altin'],
        TP: maps[i]['TP'],
        beceri: maps[i]['beceri'],
        beceriTP: maps[i]['beceriTP'],
        basTarih: maps[i]['basTarih'],
        bitTarih: maps[i]['bitTarih'],
        yapildi: maps[i]['yapildi'],
      );
    });
  }

  Future<void> hedefGuncelle(Hedef hedef) async {
    // Get a reference to the database.
    final db = await heVeriTabaniOlustur();
    await db.update(
        'hedefler',
        hedef.toMap(),
        where: 'no=?',
        whereArgs: [hedef.no]
    );
  }

  Future<void> hedefSil(int no) async {
    // Get a reference to the database.
    final db = await heVeriTabaniOlustur();
    await db.delete(
      'hedefler',
      where: 'no = ?',
      whereArgs: [no],
    );
  }
//Hedef için veritabanı işlemleri tamamlandı
}

class DoIt extends StatefulWidget {
  const DoIt({Key? key, required this.dosyaIslemleri}) : super(key: key);

  final DosyaIslemleri dosyaIslemleri;

  @override
  _DoItState createState() => _DoItState();
}

class _DoItState extends State<DoIt> {

  Controller _controller = Get.put(Controller());
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    KahramanTab(),
    //BecerilerTab(),
    gorevGunuSecimEkrani(),
    //BasarilarTab(),
    MarketTab(),
    Ayarlar()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) async {

      await dosya.KadosyaVarlik().then((bool kaVarlik) async {
        if (kaVarlik == false) {
          String yazdirilacak = "Murat\nAcemi\n0\n20\n0\n0\n0\n0\n";
          await dosya.KadosyayaYaz(yazdirilacak);
          setState(() {
            karakter.ad = "Murat";
            karakter.durum = "Acemi";
            karakter.seviye = 0;
            karakter.TP = 0;
            karakter.altin = 0;
            karakter.sonrakiSeviyeye = 20;
            karakter.avatar = 0;
            karakter.avatarRenk = 0;

            _controller._karakterAdi.value = "Murat";
            _controller._karakterDurum.value = "Acemi";
            _controller._karakterSeviye.value=0;
            _controller._karakterTP.value=0;
            _controller._karakterAltin.value=0;
            _controller._karakterSonrakiSeviyeye.value=20;
            _controller._avatar.value = 0;
            _controller._avatarRenk.value = 0;
          });
        } else {
          await dosya.KadosyaOku().then((String dosyaIcerik) async {
            //Veriler satır satır okunup bir diziye aktarılıyor
            var ayristirilanMetin = [];
            ayristirilanMetin = dosyaIcerik.split("\n");
            setState(() {
              karakter.ad = ayristirilanMetin[0];
              karakter.durum = ayristirilanMetin[1];
              karakter.seviye = int.parse(ayristirilanMetin[2]);
              karakter.sonrakiSeviyeye = int.parse(ayristirilanMetin[3]);
              karakter.TP = int.parse(ayristirilanMetin[4]);
              karakter.altin = int.parse(ayristirilanMetin[5]);
              karakter.avatar = int.parse(ayristirilanMetin[6]);
              karakter.avatarRenk = int.parse(ayristirilanMetin[7]);

              _controller._karakterAdi.value = karakter.ad;
              _controller._karakterDurum.value = karakter.durum;
              _controller._avatar.value = karakter.avatar;
              _controller._avatarRenk.value = karakter.avatarRenk;
              _controller._karakterSeviye.value=karakter.seviye;
              _controller._karakterTP.value=karakter.TP;
              _controller._karakterAltin.value=karakter.altin;
              _controller._karakterSonrakiSeviyeye.value=karakter.sonrakiSeviyeye;
            });
            _controller._karakterAdi.value==''
                ? Center(child: CircularProgressIndicator())
                : print('Veri yüklendi');
          });
        }
      });

      await dosya.gorevListeOlustur().then((List tumGorevler) async {
        if (tumGorevler.length == 0) {
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

          //Eğer veritabanında hiç veri yoksa 4 tane kayıt oluşturuluyor ve bu veriler ilk değerler olarak atanıyor
          widget.dosyaIslemleri.gorevEkle(gorev1);
          widget.dosyaIslemleri.gorevEkle(gorev2);
          widget.dosyaIslemleri.gorevEkle(gorev3);
          widget.dosyaIslemleri.gorevEkle(gorev4);
        }

        await dosya.gorevListeOlustur().then((List tumGorevler) async {
          setState(() {
            _controller._tumGorevler.value = tumGorevler;
            _controller._tumGorevSayisi.value = tumGorevler.length;
            karakter.tumGorevler = tumGorevler;
            karakter.tumGorevSayisi = tumGorevler.length;
          });
          _controller._tumGorevler.value ==''
              ? Center(child: CircularProgressIndicator())
              : print('Veri yüklendi');
        });

        await dosya
            .gorevBugunTariheGoreListeOlustur()
            .then((List bugunkuGorevler) async{
          setState(() {
            _controller._bugunkuGorevler.value = bugunkuGorevler;
            _controller._cBugunkuGorevSayisi.value = bugunkuGorevler.length;
            _controller._popupMenuGorevSayisi.value =
                _controller._cBugunkuGorevSayisi.value;
            _controller._secilenGorevler.value = bugunkuGorevler;
            _controller._secilenGorevSayisi.value = bugunkuGorevler.length;

            karakter.bugunkuGorevler = bugunkuGorevler;
            karakter.bugunkuGorevSayisi = bugunkuGorevler.length;

          });
          _controller._bugunkuGorevler.value ==''
              ? Center(child: CircularProgressIndicator())
              : print('Veri yüklendi');
        });

        await dosya
            .gorevYarininTarihineGoreListeOlustur()
            .then((List yarinkiGorevler) async {
          setState(() {
            _controller._yarinkiGorevler.value = yarinkiGorevler;
            _controller._yarinkiGorevSayisi.value = yarinkiGorevler.length;
            karakter.yarinkiGorevler = yarinkiGorevler;
            karakter.yarinkiGorevSayisi = yarinkiGorevler.length;
          });
          _controller._yarinkiGorevler.value ==''
              ? Center(child: CircularProgressIndicator())
              : print('Görev verisi yüklendi');
        });

        await dosya.gorevGecmisListeOlustur().then((List gecmisGorevler) async {
          setState(() {
            _controller._gecmisGorevler.value = gecmisGorevler;
            _controller._gecmisGorevSayisi.value = gecmisGorevler.length;
            karakter.gecmisGorevler = gecmisGorevler;
            karakter.gecmisGorevSayisi = gecmisGorevler.length;
          });
          _controller._gecmisGorevler.value ==''
              ? Center(child: CircularProgressIndicator())
              : print('Geçmiş görev verisi yüklendi');
        });

        await dosya.gorevGecikmisGorevListeOlustur().then((List gecikmisGorevler) async{
          if(gecikmisGorevler.length!=0) {
            setState(() {
              _controller._gecikmisGorevler.value = gecikmisGorevler;
              _controller._gecikmisGorevSayisi.value = gecikmisGorevler.length;
              karakter.gecikmisGorevler = gecikmisGorevler;
              karakter.gecikmisGorevSayisi = gecikmisGorevler.length;
            });
          }
        });

        await dosya.gorevGrafikListeOlustur().then((grafik) async {
          setState(() {
            _controller._grafikVeriSayisi.value=grafik.length;
            karakter.grafikVeriSayisi=grafik.length;

            _controller._grafik.value=grafik;
            karakter.grafik=grafik;
          });
        });

        await dosya.gorevGrafikListeOlustur2().then((grafik) async {
          setState(() {
            _controller._grafikVeriSayisi2.value=grafik.length;
            karakter.grafikVeriSayisi2=grafik.length;

            _controller._grafik2.value=grafik;
            karakter.grafik2=grafik;
          });
        });
      });

      //Beceriler için veritabanı aktarması yapılıyor
      await dosya.beceriListeOlustur().then((List tumBeceriler) async {
        if (tumBeceriler.length == 0) {
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

          //Eğer veritabanında hiç veri yoksa 17 tane kayıt oluşturuluyor ve bu veriler ilk değerler olarak atanıyor
          widget.dosyaIslemleri.beceriEkle(beceri1);
          widget.dosyaIslemleri.beceriEkle(beceri2);
          widget.dosyaIslemleri.beceriEkle(beceri3);
          widget.dosyaIslemleri.beceriEkle(beceri4);
          widget.dosyaIslemleri.beceriEkle(beceri5);
          widget.dosyaIslemleri.beceriEkle(beceri6);
          widget.dosyaIslemleri.beceriEkle(beceri7);
          widget.dosyaIslemleri.beceriEkle(beceri8);
          widget.dosyaIslemleri.beceriEkle(beceri9);
          widget.dosyaIslemleri.beceriEkle(beceri10);
          widget.dosyaIslemleri.beceriEkle(beceri11);
          widget.dosyaIslemleri.beceriEkle(beceri12);
          widget.dosyaIslemleri.beceriEkle(beceri13);
          widget.dosyaIslemleri.beceriEkle(beceri14);
          widget.dosyaIslemleri.beceriEkle(beceri15);
          widget.dosyaIslemleri.beceriEkle(beceri16);
          widget.dosyaIslemleri.beceriEkle(beceri17);
        }

        await dosya.beceriListeOlustur().then((List tumBeceriler) async {

          setState(() {
            karakter.beceriSayisi = tumBeceriler.length;
            _controller._beceriSayisi.value = tumBeceriler.length;
            _controller._beceriler.value = tumBeceriler;

            beceriler.beceriAdlari=[];
            beceriler.seviye=[];
            beceriler.beceriTP=[];

            for (int i = 0; i < tumBeceriler.length; i++) {
              beceriler.beceriAdlari.add(tumBeceriler[i].ad);
              beceriler.seviye.add(tumBeceriler[i].seviye);
              beceriler.beceriTP.add(tumBeceriler[i].beceriTP);
            }
          });
          _controller._beceriler.value ==''
              ? Center(child: CircularProgressIndicator())
              : print('Beceri verisi yüklendi');
        });
      });
      //Beceriler için veritabanı işlemleri tamamlandı

      //Başarılar için veritabanı işlemleri tanımlanıyor
      await dosya.basariListeOlustur().then((List tumBasarilar) async {
        if (tumBasarilar.length == 0) {
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

          try{
            //Eğer veritabanında hiç veri yoksa 1 tane kayıt oluşturuluyor ve bu veri ilk değer olarak atanıyor
            await dosya.basariEkle(basari1);
            await dosya.basariEkle(basari2);
            await dosya.basariEkle(basari3);
            await dosya.basariEkle(basari4);
            await dosya.basariEkle(basari5);
            await dosya.basariEkle(basari6);
          }catch(e){
            print("Başarı verileri yüklenemedi");
          };
        }

        await dosya.basariListeOlustur().then((List tumBasarilar) async {
          karakter.basariSayisi = tumBasarilar.length;
          _controller._basariSayisi.value = tumBasarilar.length;
          _controller._basarilar.value = tumBasarilar;
          karakter.basarilar=tumBasarilar;

          karakter.eldeEdilenBasariSayisi=0;
          for (int i=0;i<karakter.basariSayisi;i++) {
            //Her bir başarı ögesinin başarı durumuna göre false ya da true olduğu belirleniyor
            if (karakter.basarilar[i].basarildimi == 1) {
              basarildimiKontrol[i] = true;
              karakter.eldeEdilenBasariSayisi++;
            }
          }

          _controller._eldeEdilenBasariSayisi.value=karakter.eldeEdilenBasariSayisi;
        });
        _controller._basarilar.value ==''
            ? Center(child: CircularProgressIndicator())
            : print('Başarı verisi yüklendi');
      });
      //Başarılar için veritabanı işlemleri tamamlandı

      //Market için veritabanı işlemleri başlatılıyor
      await dosya.urunListeOlustur().then((List urunler) async {
        if (urunler.length == 0) {
          var urun1 = Urun(
              no: 1,
              ad: "1 fincan kahve içmek",
              altin: 5,
              avatar: 0,
              avatarRenk: 0,
              satinAlimSayisi: 0,
              stok: 100,
              stogaGirisTarihi: tarih
          );
          var urun2 = Urun(
              no: 2,
              ad: "1 bardak meyve suyu içmek",
              altin: 5,
              avatar: 1,
              avatarRenk: 0,
              satinAlimSayisi: 0,
              stok: 100,
              stogaGirisTarihi: tarih
          );
          var urun3 = Urun(
              no: 3,
              ad: "1 bardak çay içmek",
              altin: 2,
              avatar: 2,
              avatarRenk: 0,
              satinAlimSayisi: 0,
              stok: 100,
              stogaGirisTarihi: tarih
          );
          var urun4 = Urun(
              no: 4,
              ad: "1 bir içecek içmek",
              altin: 10,
              avatar: 3,
              avatarRenk: 0,
              satinAlimSayisi: 0,
              stok: 100,
              stogaGirisTarihi: tarih
          );
          var urun5 = Urun(
              no: 5,
              ad: "1 bardak kola içmek",
              altin: 5,
              avatar: 4,
              avatarRenk: 0,
              satinAlimSayisi: 0,
              stok: 100,
              stogaGirisTarihi: tarih
          );
          var urun6 = Urun(
              no: 6,
              ad: "1 dondurma yemek",
              altin: 5,
              avatar: 5,
              avatarRenk: 0,
              satinAlimSayisi: 0,
              stok: 100,
              stogaGirisTarihi: tarih
          );
          var urun7 = Urun(
              no: 7,
              ad: "1 pizza yemek",
              altin: 10,
              avatar: 6,
              avatarRenk: 0,
              satinAlimSayisi: 0,
              stok: 100,
              stogaGirisTarihi: tarih
          );
          var urun8 = Urun(
              no: 8,
              ad: "1 hamburger yemek",
              altin: 20,
              avatar: 7,
              avatarRenk: 0,
              satinAlimSayisi: 0,
              stok: 100,
              stogaGirisTarihi: tarih
          );
          var urun9 = Urun(
              no: 9,
              ad: "1 çikolata yemek",
              altin: 5,
              avatar: 8,
              avatarRenk: 0,
              satinAlimSayisi: 0,
              stok: 100,
              stogaGirisTarihi: tarih
          );
          var urun10 = Urun(
              no: 10,
              ad: "1 şiş kebap yemek",
              altin: 10,
              avatar: 9,
              avatarRenk: 0,
              satinAlimSayisi: 0,
              stok: 100,
              stogaGirisTarihi: tarih
          );
          var urun11 = Urun(
              no: 11,
              ad: "Gezmeye gitmek",
              altin: 10,
              avatar: 10,
              avatarRenk: 0,
              satinAlimSayisi: 0,
              stok: 100,
              stogaGirisTarihi: tarih
          );
          var urun12 = Urun(
              no: 12,
              ad: "30 dk müzik dinlemek",
              altin: 5,
              avatar: 11,
              avatarRenk: 0,
              satinAlimSayisi: 0,
              stok: 100,
              stogaGirisTarihi: tarih
          );
          var urun13 = Urun(
              no: 13,
              ad: "1 saat yüzmek",
              altin: 20,
              avatar: 12,
              avatarRenk: 0,
              satinAlimSayisi: 0,
              stok: 100,
              stogaGirisTarihi: tarih
          );

          try{
            //Eğer veritabanında hiç veri yoksa 13 tane kayıt oluşturuluyor ve bu veriler ilk değer olarak atanıyor
            await dosya.urunEkle(urun1);
            await dosya.urunEkle(urun2);
            await dosya.urunEkle(urun3);
            await dosya.urunEkle(urun4);
            await dosya.urunEkle(urun5);
            await dosya.urunEkle(urun6);
            await dosya.urunEkle(urun7);
            await dosya.urunEkle(urun8);
            await dosya.urunEkle(urun9);
            await dosya.urunEkle(urun10);
            await dosya.urunEkle(urun11);
            await dosya.urunEkle(urun12);
            await dosya.urunEkle(urun13);

          }catch(e){
            print("Ürün verileri yüklenemedi");
          };
        }

        await dosya.urunListeOlustur().then((List urunler) async {
          karakter.marketUrunSayisi = urunler.length;
          _controller._marketUrunSayisi.value = urunler.length;
          _controller.market.value = urunler;
          karakter.market=urunler;
        });
        _controller._marketUrunSayisi.value ==''
            ? Center(child: CircularProgressIndicator())
            : print('Ürün verileri yüklendi');
      });
      //Market için veritabanı işlemleri tamamlandı

      //Hedef için veritabanı işlemleri başlatılıyor
      await dosya.hedefListeOlustur().then((List hedefler) async {
        if (hedefler.length == 0) {
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

        }

        await dosya.hedefListeOlustur().then((List hedefler) async {
          setState(() {
            _controller._hedefler.value = hedefler;
            _controller._hedefSayisi.value = hedefler.length;
            karakter.hedefler = hedefler;
            karakter.hedefSayisi = hedefler.length;
          });
          _controller._hedefler.value ==''
              ? Center(child: CircularProgressIndicator())
              : print('Hedef verisi yüklendi');
        });
      });

      //Hedef için veritabanı işlemleri tamamlandı
    });
  }

  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(200, 240, 240, 1.0),
      body: _yuklenenTablar(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Obx(() =>
                Icon(avatar[_controller._avatar.value]),
            ),
            label: 'Karakter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_task),
            label: 'Görevler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Market',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Ayarlar',
            //backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _yuklenenTablar(){
    return _controller._karakterAdi.value==''
        ? Column(
        mainAxisAlignment : MainAxisAlignment.center,
        children:[
          Center(child:CircularProgressIndicator()),
          SizedBox(height: 10),
          Text("Veriler yükleniyor")])
        : Center(child: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}

class KahramanTab extends StatelessWidget {
  Controller _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return ListView(
      children: <Widget>[
        SizedBox(height: 20),
        Row(
          mainAxisAlignment : MainAxisAlignment.center,
          mainAxisSize : MainAxisSize.min,
          children:[
            Column(children:[
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  icon: Icon(RpgAwesome.archery_target,color: Colors.black, size:24),
                  iconSize: 24.0,
                  onPressed: () {
                    Get.to(() => Hedefler());
                  },
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  icon: Icon(FontAwesome5.chart_bar),
                  iconSize: 24.0,
                  onPressed: () {
                    // If you want to get particular type of data arguments, then can add it with MaterialPageRoute<Data_Type_Value_You_Want_In_Return>
                    Get.to(() => GrafikTab());
                  },
                ),
              ),
            ]),
            SizedBox(width: _w/20.55),
            Container(
              height: 120,
              width: 150,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Obx(() =>IconButton(
                icon: Icon(avatar[_controller._avatar.value]),
                iconSize: 90.0,
                color: iconColor[_controller._avatarRenk.value],
                onPressed: () {
                  // If you want to get particular type of data arguments, then can add it with MaterialPageRoute<Data_Type_Value_You_Want_In_Return>
                  //Get.to(karakterAvatarFace());
                  Get.to(() => karakterAvatarFace());
                },
              )),
            ),
            SizedBox(width: _w/20.55),
            Column(children:[
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  icon: Icon(Icons.psychology_outlined),
                  iconSize: 24.0,
                  onPressed: () {
                    // If you want to get particular type of data arguments, then can add it with MaterialPageRoute<Data_Type_Value_You_Want_In_Return>
                    Get.to(() =>BecerilerTab());
                  },
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  icon: Icon(Icons.emoji_events),
                  iconSize: 24.0,
                  onPressed: () {
                    // If you want to get particular type of data arguments, then can add it with MaterialPageRoute<Data_Type_Value_You_Want_In_Return>
                    Get.to(() => BasarilarTab());
                  },
                ),
              ),
            ]),
          ],
        ),
        SizedBox(height: 10),
        Card(
          margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: ListTile(
              title: Text("Karakter"),
              trailing: Obx(
                    () => TextButton(
                    child: Text(_controller._karakterAdi.value,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red)),
                    onPressed: () {
                      Alert(
                          context: context,
                          type: AlertType.none,
                          style: alertStyle,
                          title: "Karakter Adı Değişikliği",
                          content: TextField(
                            controller: yeniKullaniciAdiGirisi,
                            decoration: InputDecoration(
                              icon: Icon(Icons.account_circle),
                              labelText: 'Karakter Adı',
                            ),
                          ),
                          buttons: [
                            DialogButton(
                              child: Text(
                                "TAMAM",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              onPressed: () {
                                yazdirilacak='';
                                karakter.ad = yeniKullaniciAdiGirisi.text;
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
                                dosya.KadosyayaYaz(yazdirilacak);
                                _controller._karakterAdi.value=yeniKullaniciAdiGirisi.text;
                                yeniKullaniciAdiGirisi.text = "";
                                Get.back();
                              },
                              color: Color.fromRGBO(0, 179, 134, 1.0),
                            ),
                            DialogButton(
                              child: Text(
                                "İPTAL",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              onPressed: () {
                                yeniKullaniciAdiGirisi.text = "";
                                Get.back();
                              },
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(116, 116, 191, 1.0),
                                Color.fromRGBO(52, 138, 199, 1.0)
                              ]),
                            )
                          ]).show();
                    }),
              )),
        ),
        Card(
          margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: ListTile(
            title: Text("Durum"),
            trailing: Text(_controller._karakterDurum + '  ',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red)),
          ),
        ),
        Card(
          margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: ListTile(
            title: Text("Seviye"),
            trailing: CircleAvatar(
              child: Text(_controller._karakterSeviye.toString()),
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: ListTile(
            title: Text("TP"),
            trailing: CircleAvatar(
              child: Text(_controller._karakterTP.toString()),
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: ListTile(
            leading: Container(
                width:30.0,
                height:30.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/gold.png'),
                      fit: BoxFit.fill,
                    ))),
            trailing: CircleAvatar(
              child: Text(_controller._karakterAltin.toString()),
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: ListTile(
            title: Text("Sonraki Seviyeye Kalan"),
            trailing: CircleAvatar(
              child: Text(_controller._karakterSonrakiSeviyeye.toString()),
            ),
          ),
        ),
      ],
    );
  }
}

class BecerilerTab extends StatefulWidget {
  @override
  _BecerilerTabState createState() => _BecerilerTabState();
}

class _BecerilerTabState extends State<BecerilerTab> {
  Controller _controller = Get.find();

  var yeniBeceriAdiGirisi=TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    //floatingActionButton ın konumunu belirlemek için ilkönce Scaffold widget tanımlanır. Ardından body olarak ListView yazılır
    return Scaffold(
      backgroundColor: Color.fromRGBO(200, 240, 240, 1.0),
      appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text("Beceriler",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add_circle),
              //butona basıldığında ikonun rengi açık kırmızı renge döner
              splashColor: Colors.redAccent,
              onPressed: () {
                Alert(
                  context: context,
                  type: AlertType.none,
                  title: "Yeni Beceri Girişi",
                  content: TextField(
                    controller: yeniBeceriGirisi,
                    decoration: InputDecoration(
                      labelText: 'Beceri',
                    ),
                  ),
                  buttons: [
                    DialogButton(
                      child: Text(
                        "TAMAM",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      onPressed: () async {
                        if (yeniBeceriGirisi.text.length != 0) {
                          var beceri1 = Beceri(
                              ad: yeniBeceriGirisi.text,
                              seviye: 0,
                              beceriTP: 0
                          );

                          await dosya.beceriEkle(beceri1);

                          await dosya.beceriListeOlustur().then((List tumBeceriler) async{
                            setState(() {
                              karakter.beceriSayisi = tumBeceriler.length;
                              _controller._beceriSayisi.value=tumBeceriler.length;
                              _controller._beceriler.value=tumBeceriler;
                              beceriler.beceriAdlari=[];
                              beceriler.seviye=[];
                              beceriler.beceriTP=[];

                              for (int i = 0; i < tumBeceriler.length; i++) {
                                // _controller._beceriler.value.add(tumBeceriler[i].ad);
                                beceriler.beceriAdlari.add(tumBeceriler[i].ad);
                                beceriler.seviye.add(tumBeceriler[i].seviye);
                                beceriler.beceriTP.add(tumBeceriler[i].beceriTP);
                              }
                            });
                          });

                          yeniBeceriGirisi.text='';
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
                        yeniBeceriGirisi.text = '';
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
          ]),
      body: Obx(() =>AnimationLimiter(
        child: ListView.builder(
          padding: const EdgeInsets.all(5.0),
          physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemCount: _controller.beceriSayisi.value,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              delay: Duration(milliseconds: 100),
              child: SlideAnimation(
                duration: Duration(milliseconds: 2500),
                curve: Curves.fastLinearToSlowEaseIn,
                verticalOffset: -250,
                child: ScaleAnimation(
                  duration: Duration(milliseconds: 1500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: Card(
                    key: UniqueKey(),
                    margin: const EdgeInsets.all(5.0),
                    color: Colors.white,
                    // The elevation determines shade.
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: _w/40),
                        CircleAvatar(
                          radius: 15.0,
                          child: Text(
                            _controller._beceriler[index].seviye.toString(),
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                        SizedBox(width: _w/40),
                        SizedBox(
                          width: _w/1.787,
                          child: Column(
                            crossAxisAlignment : CrossAxisAlignment.start,
                            children: [
                              Text(_controller.beceriler[index].ad,
                                //zaten varsayılan değer 14
                              ),
                              Text("TP: "+ _controller._beceriler[index].beceriTP.toString(),
                                style: TextStyle(fontSize: 12.0,color: Colors.black.withOpacity(.6),),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: _w/10.275,
                          child: IconButton(
                            icon: Icon(Icons.mode_edit_outlined,color: Colors.black),
                            onPressed: () {
                              Alert(
                                  context: context,
                                  title: "Beceri adını düzenle",
                                  desc: "'"+_controller.beceriler[index].ad+"'",
                                  content: TextField(
                                    controller: yeniBeceriAdiGirisi,
                                    decoration: InputDecoration(
                                      labelText: 'Yeni ad...',
                                    ),
                                  ),
                                  buttons: [
                                    DialogButton(
                                      child: Text(
                                        "TAMAM",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                      onPressed: () async {
                                        if (yeniBeceriAdiGirisi.text.length != 0) {

                                          WidgetsBinding.instance!.addPostFrameCallback((_) async {
                                            await dosya.beceriSil(_controller.beceriler[index].ad);

                                            var beceri1 = Beceri(
                                                ad:  yeniBeceriAdiGirisi.text,
                                                seviye: _controller._beceriler[index].seviye,
                                                beceriTP: _controller._beceriler[index].beceriTP
                                            );
                                            await dosya.beceriEkle(beceri1);

                                            await dosya.beceriListeOlustur().then((List tumBeceriler) async {

                                              setState(() {
                                                karakter.beceriSayisi = tumBeceriler.length;
                                                _controller._beceriSayisi.value = tumBeceriler.length;
                                                _controller._beceriler.value = tumBeceriler;

                                                beceriler.beceriAdlari=[];
                                                beceriler.seviye=[];
                                                beceriler.beceriTP=[];

                                                for (int i = 0; i < tumBeceriler.length; i++) {
                                                  beceriler.beceriAdlari.add(tumBeceriler[i].ad);
                                                  beceriler.seviye.add(tumBeceriler[i].seviye);
                                                  beceriler.beceriTP.add(tumBeceriler[i].beceriTP);
                                                }
                                                print(_controller._beceriler.toString());

                                                yeniBeceriAdiGirisi.text = "";
                                              });
                                            });
                                          });
                                        }
                                        Get.back();
                                      },
                                      color: Color.fromRGBO(0, 179, 134, 1.0),
                                    ),
                                    DialogButton(
                                      child: Text(
                                        "İPTAL",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                      onPressed: () {
                                        yeniKullaniciAdiGirisi.text = "";
                                        Get.back();
                                      },
                                      gradient: LinearGradient(colors: [
                                        Color.fromRGBO(116, 116, 191, 1.0),
                                        Color.fromRGBO(52, 138, 199, 1.0)
                                      ]),
                                    )
                                  ]).show();
                            },
                          ),
                        ),
                        SizedBox(width: _w/10.275,
                          child: IconButton(
                            icon: Icon(Icons.delete_outlined,color: Colors.redAccent),
                            onPressed: () {
                              Alert(
                                context: context,
                                type: AlertType.warning,
                                title: "UYARI",
                                desc: "Bu beceriyi silmek istediğinizden emin misiniz?",
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "EVET",
                                      style: TextStyle(color: Colors.white, fontSize: 20),
                                    ),

                                    onPressed: () async {
                                      await dosya.beceriSil(_controller._beceriler[index].ad);
                                      await dosya.beceriListeOlustur().then((List tumBeceriler) async{
                                        karakter.beceriSayisi = tumBeceriler.length;
                                        _controller._beceriSayisi.value=tumBeceriler.length;
                                        _controller._beceriler.value=tumBeceriler;

                                        beceriler.beceriAdlari=[];
                                        beceriler.seviye=[];
                                        beceriler.beceriTP=[];

                                        for (int i = 0; i < tumBeceriler.length; i++) {
                                          // _controller._beceriler.value.add(tumBeceriler[i].ad);
                                          beceriler.beceriAdlari.add(tumBeceriler[i].ad);
                                          beceriler.seviye.add(tumBeceriler[i].seviye);
                                          beceriler.beceriTP.add(tumBeceriler[i].beceriTP);
                                        }
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
                        ),
                        SizedBox(width:_w/40),
                      ],
                    ),
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

class BasarilarTab extends StatelessWidget {
  Controller _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    //floatingActionButton ın konumunu belirlemek için ilkönce Scaffold widget tanımlanır. Ardından body olarak ListView yazılır
    return Scaffold(
      backgroundColor: Color.fromRGBO(200, 240, 240, 1.0),
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Column(crossAxisAlignment : CrossAxisAlignment.start,
            children:
            [
              Text("Kazanılan Başarılar",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              Obx(() => Text(
                  _controller._eldeEdilenBasariSayisi.value.toString() +
                      " adet başarınız var",
                  style: TextStyle(fontSize: 12))),
            ]),
      ),
      body: Obx(() => AnimationLimiter(
        child: ListView.builder(
          padding: const EdgeInsets.all(5.0),
          physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemCount: _controller._basariSayisi.value,
          itemBuilder: (context,index) {
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
                    color: Colors.white,
                    // The elevation determines shade.
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Container(
                      height: _w/5.87,
                      child: Row(
                        mainAxisSize : MainAxisSize.min,
                        children: [
                          SizedBox(width: _w/80),
                          SizedBox(
                            width: _w/10,
                            child: basarildimiKontrol[index] ? Icon(Icons.thumb_up,color: Colors.blue) : Icon(Icons.thumb_down,color: Colors.redAccent),
                          ),
                          SizedBox(width: _w/40),
                          SizedBox(
                            width: _w/1.644,
                            child: Column(
                              crossAxisAlignment : CrossAxisAlignment.start,
                              mainAxisAlignment : MainAxisAlignment.center,
                              children: [
                                Text(_controller.basarilar[index].basari, style: TextStyle(fontSize: 14.0)),
                                //Bu komut satırı 2 saatime mal oldu. String içerik boş olduğunda DateTime.parse hata veriyor
                                _controller.basarilar[index].tarih!='' ? Text(DateFormat('dd/MM/yyyy').format(DateTime.parse(_controller.basarilar[index].tarih)), style: TextStyle(fontSize: 12.0,color: Colors.black.withOpacity(.6),)) : Text(''),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment : CrossAxisAlignment.start,
                            mainAxisAlignment : MainAxisAlignment.center,
                            children: [
                              Text("+"+_controller.basarilar[index].TP.toString()+" TP",
                                  style: TextStyle(color: Colors.blue)
                              ),
                              Row(
                                children: [
                                  Text("+"+_controller.basarilar[index].altin.toString(),
                                      style: TextStyle(color: Colors.blue)
                                  ),
                                  SizedBox(width: _w/80),
                                  Container(
                                      width: _w/20.55,
                                      height: _w/20.55,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            //colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
                                            image: AssetImage('assets/images/gold.png'),
                                            fit: BoxFit.fill,
                                          ))),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(width: _w/80),
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
    );
  }
}

class gorevGunuSecimEkrani extends StatefulWidget{
  @override
  _gorevGunuSecimEkraniState createState() => _gorevGunuSecimEkraniState();
}

class _gorevGunuSecimEkraniState extends State<gorevGunuSecimEkrani> with SingleTickerProviderStateMixin {
  late AnimationController _aController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _aController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _aController, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _aController.forward();
  }

  @override
  void dispose() {
    _aController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    String bTarih=DateFormat('dd/MM/yyyy').format(DateTime.parse(tarih));
    String yTarih=DateFormat('dd/MM/yyyy').format(DateTime.parse(yarinTarih));
    return Scaffold(
      //backgroundColor: Color(0xffF5F5F5),
      backgroundColor: Color.fromRGBO(200, 240, 240, 1.0),
      body: Stack(
        children: [
          ListView(
            physics:
            BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              SizedBox(height: _w/20),
              searchBar(context),
              SizedBox(height: _w / 80),
              groupOfCards(
                context,
                'Bugün',
                bTarih,
                'assets/images/manzara_1.jpg',
                bugunGorevListesi(),
                'Yarın',
                yTarih,
                'assets/images/manzara_3.jpg',
                yarinGorevListesi(),),
              groupOfCards(
                context,
                'Gecikmiş',
                '',
                'assets/images/manzara_4.png',
                gecikmisGorevListesi(),
                'Tümü',
                '',
                'assets/images/manzara_2.jpg',
                tumGorevListesi(),),
              groupOfCards(
                context,
                'Yapılmış',
                '',
                'assets/images/manzara_5.jpg',
                yapilmisGorevListesi(),
                'Araçlar',
                '',
                'assets/images/tools.jpg',
                Araclar(),),
            ],
          ),
        ],
      ),
    );
  }

  Widget searchBar(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(_w / 20, _w / 25, _w / 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: _w / 8.5,
            width: _w / 1.36,
            padding: EdgeInsets.symmetric(horizontal: _w / 60),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(99),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 30,
                  offset: Offset(0, 15),
                ),
              ],
            ),
            child: Text("Bir kategori seçiniz",style: TextStyle(color: Colors.black.withOpacity(.8),fontWeight: FontWeight.w600,fontSize: _w / 22)),
          ),
          SizedBox(height: _w / 14),
        ],
      ),
    );
  }

  Widget groupOfCards(
      BuildContext context,
      String title1,
      String subtitle1,
      String image1,
      Widget route1,
      String title2,
      String subtitle2,
      String image2,
      Widget route2) {
    double _w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(_w / 20, 0, _w / 20, _w / 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          card(context,title1, subtitle1, image1, route1),
          card(context,title2, subtitle2, image2, route2),
        ],
      ),
    );
  }

  Widget card(BuildContext context,String title, String subtitle, String image, Widget route) {
    double _w = MediaQuery.of(context).size.width;
    return Opacity(
      opacity: _animation.value,
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          Navigator.of(context).push(MyFadeRoute(route: route, page: gorevGunuSecimEkrani()));
        },
        child: Container(
          width: _w / 2.36,
          height: _w / 1.8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 50),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: _w / 2.36,
                height: _w / 2.6,
                decoration: BoxDecoration(
                  color: Color(0xff5C71F3),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                alignment: Alignment.center,
                child:
                Image.asset(
                    image,
                    fit: BoxFit.fill,
                    width: _w / 2.36,
                    height: _w / 2.6),

              ),
              Container(
                height: _w / 6,
                width: _w / 2.36,
                padding: EdgeInsets.symmetric(horizontal: _w / 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      textScaleFactor: 1.4,
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black.withOpacity(.8),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      subtitle,
                      textScaleFactor: 1,
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(.7),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyFadeRoute extends PageRouteBuilder{
  final Widget page;
  final Widget route;

  MyFadeRoute({required this.page, required this.route})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        FadeTransition(
          opacity: animation,
          child: route,
        ),
  );
}



