class Beceriler{
  late var _beceri=[];
  late var _beceriAdlari=[];
  late var _seviye=[];
  late var _beceriTP=[];

  get seviye => _seviye;

  set seviye(value) {
    _seviye = value;
  }

  Beceriler(
      this._beceri,
      this._beceriAdlari,
      this._seviye,
      this._beceriTP
      );

  get beceri => _beceri;

  set beceri(value) {
    _beceri = value;
  }



  get beceriAdlari => _beceriAdlari;

  set beceriAdlari(value) {
    _beceriAdlari = value;
  }

  get beceriTP => _beceriTP;

  set beceriTP(value) {
    _beceriTP = value;
  }

}