class Karakter {
  late String _ad;
  late String _durum;
  late int _seviye;
  late int _sonrakiSeviyeye;
  late int _TP;
  late int _altin;
  late int _avatar;
  late int _avatarRenk;
  late int _beceriSayisi;
  late int _basariSayisi;
  late int _tumGorevSayisi;
  late int _bugunkuGorevSayisi;
  late int _yarinkiGorevSayisi;
  late int _atananGorevSayisi;
  late var _tumGorevler=[];
  late var _bugunkuGorevler=[];
  late var _yarinkiGorevler=[];
  late var _atananGorevler=[];
  late var _beceriTP=[];
  late var _basarilar=[];
  late var _eldeEdilenBasariSayisi;
  late var _gecmisGorevler=[];
  late int _gecmisGorevSayisi;
  late var _market=[];
  late int _marketUrunSayisi;
  late int _hedefSayisi;
  late var _hedefler=[];
  late var _grafik=[];
  late var _grafikVeriSayisi;
  late var _grafik2=[];
  late var _grafikVeriSayisi2;
  late var _gecikmisGorevler=[];
  late int _gecikmisGorevSayisi;

  Karakter(
      this._ad,
      this._durum,
      this._seviye,
      this._sonrakiSeviyeye,
      this._TP,
      this._altin,
      this._avatar,
      this._avatarRenk,
      this._beceriSayisi,
      this._basariSayisi,
      this._tumGorevSayisi,
      this._bugunkuGorevSayisi,
      this._yarinkiGorevSayisi,
      this._atananGorevSayisi,
      this._tumGorevler,
      this._bugunkuGorevler,
      this._yarinkiGorevler,
      this._atananGorevler,
      this._beceriTP,
      this._basarilar,
      this._eldeEdilenBasariSayisi,
      this._gecmisGorevler,
      this._gecmisGorevSayisi,
      this._market,
      this._marketUrunSayisi,
      this._hedefSayisi,
      this._hedefler,
      this._grafik,
      this._grafikVeriSayisi,
      this._grafik2,
      this._grafikVeriSayisi2,
      this._gecikmisGorevler,
      this._gecikmisGorevSayisi,
      );

  get hedefler => _hedefler;

  set hedefler(value) {
    _hedefler = value;
  }

  int get hedefSayisi => _hedefSayisi;

  set hedefSayisi(int value) {
    _hedefSayisi = value;
  }

  String get ad => _ad;

  set ad(String value) {
    _ad = value;
  }

  String get durum => _durum;

  set durum(String value) {
    _durum = value;
  }

  int get seviye => _seviye;

  set seviye(int value) {
    _seviye = value;
  }

  int get sonrakiSeviyeye => _sonrakiSeviyeye;

  set sonrakiSeviyeye(int value) {
    _sonrakiSeviyeye = value;
  }

  int get TP => _TP;

  set TP(int value) {
    _TP = value;
  }

  int get altin => _altin;

  set altin(int value) {
    _altin = value;
  }

  int get avatar => _avatar;

  set avatar(int value) {
    _avatar = value;
  }

  int get avatarRenk => _avatarRenk;

  set avatarRenk(int value) {
    _avatarRenk = value;
  }

  int get beceriSayisi => _beceriSayisi;

  set beceriSayisi(int value) {
    _beceriSayisi = value;
  }


  int get basariSayisi => _basariSayisi;

  set basariSayisi(int value) {
    _basariSayisi = value;
  }


  int get bugunkuGorevSayisi => _bugunkuGorevSayisi;

  set bugunkuGorevSayisi(int value) {
    _bugunkuGorevSayisi = value;
  }



  int get yarinkiGorevSayisi => _yarinkiGorevSayisi;

  set yarinkiGorevSayisi(int value) {
    _yarinkiGorevSayisi = value;
  }

  int get atananGorevSayisi => _atananGorevSayisi;

  set atananGorevSayisi(int value) {
    _atananGorevSayisi = value;
  }

  get bugunkuGorevler => _bugunkuGorevler;

  set bugunkuGorevler(value) {
    _bugunkuGorevler = value;
  }

  get yarinkiGorevler => _yarinkiGorevler;

  set yarinkiGorevler(value) {
    _yarinkiGorevler = value;
  }

  get atananGorevler => _atananGorevler;

  set atananGorevler(value) {
    _atananGorevler = value;
  }

  get tumGorevler => _tumGorevler;

  set tumGorevler(value) {
    _tumGorevler = value;
  }

  int get tumGorevSayisi => _tumGorevSayisi;

  set tumGorevSayisi(int value) {
    _tumGorevSayisi = value;
  }

  get beceriTP => _beceriTP;

  set beceriTP(value) {
    _beceriTP = value;
  }

  get basarilar => _basarilar;

  set basarilar(value) {
    _basarilar = value;
  }

  get eldeEdilenBasariSayisi => _eldeEdilenBasariSayisi;

  set eldeEdilenBasariSayisi(value) {
    _eldeEdilenBasariSayisi = value;
  }

  get gecmisGorevler => _gecmisGorevler;

  set gecmisGorevler(value) {
    _gecmisGorevler = value;
  }

  int get gecmisGorevSayisi => _gecmisGorevSayisi;

  set gecmisGorevSayisi(int value) {
    _gecmisGorevSayisi = value;
  }

  int get marketUrunSayisi => _marketUrunSayisi;

  set marketUrunSayisi(int value) {
    _marketUrunSayisi = value;
  }

  get market => _market;

  set market(value) {
    _market = value;
  }

  get grafik => _grafik;

  set grafik(value) {
    _grafik = value;
  }

  get grafikVeriSayisi => _grafikVeriSayisi;

  set grafikVeriSayisi(value) {
    _grafikVeriSayisi = value;
  }

  get grafikVeriSayisi2 => _grafikVeriSayisi2;

  set grafikVeriSayisi2(value) {
    _grafikVeriSayisi2 = value;
  }

  get grafik2 => _grafik2;

  set grafik2(value) {
    _grafik2 = value;
  }

  int get gecikmisGorevSayisi => _gecikmisGorevSayisi;

  set gecikmisGorevSayisi(int value) {
    _gecikmisGorevSayisi = value;
  }

  get gecikmisGorevler => _gecikmisGorevler;

  set gecikmisGorevler(value) {
    _gecikmisGorevler = value;
  }

}
