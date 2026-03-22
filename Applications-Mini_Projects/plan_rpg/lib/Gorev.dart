class Gorev {
  late int _no;
  late String _ad;
  late String _tarih;
  late String _tekrar;
  late String _yapildi;
  late String _basariDurumu;
  late int _altin;
  late int _TP;
  late int _beceriTP;
  late String _beceri;

  Gorev(
      this._no,
      this._ad,
      this._tarih,
      this._tekrar,
      this._yapildi,
      this._basariDurumu,
      this._altin,
      this._TP,
      this._beceriTP,
      this._beceri,
      );

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'no': _no,
      'ad': _ad,
      'tarih': _tarih,
      'tekrar': _tekrar,
      'yapildi': _yapildi,
      'basariDurumu': _basariDurumu,
      'altin': _altin,
      'TP': _TP,
      'beceriTP': _beceriTP,
      'beceri': _beceri,

    };
  }

  Gorev.fromObject(dynamic o){
    this._no = o["no"].toInt();
    this._ad = o["ad"];
    this._tarih = o["tarih"];
    this._tekrar = o["tekrar"];
    this._yapildi = o["yapildi"];
    this._basariDurumu=o["basariDurumu"];
    this._altin = o["altin"].toInt();
    this._TP = o["TP"].toInt();
    this._beceriTP=o["beceriTP"].toInt();
    this._beceri = o["beceri"];
  }

  int get no => _no;

  set no(int value) {
    _no = value;
  }

  String get ad => _ad;

  set ad(String value) {
    _ad = value;
  }

  String get tarih => _tarih;

  set tarih(String value) {
    _tarih = value;
  }

  String get tekrar => _tekrar;

  set tekrar(String value) {
    _tekrar = value;
  }

  String get yapildi => _yapildi;

  set yapildi(String value) {
    _yapildi = value;
  }

  int get altin => _altin;

  set altin(int value) {
    _altin = value;
  }

  int get TP => _TP;

  set TP(int value) {
    _TP = value;
  }

  String get beceri => _beceri;

  set beceri(String value) {
    _beceri = value;
  }

  int get beceriTP => _beceriTP;

  set beceriTP(int value) {
    _beceriTP = value;
  }

  String get basariDurumu => _basariDurumu;

  set basariDurumu(String value) {
    _basariDurumu = value;
  }
}