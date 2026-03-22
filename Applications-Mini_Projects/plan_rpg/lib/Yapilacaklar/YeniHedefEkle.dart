import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '../main.dart';
import 'package:fluttertoast/fluttertoast.dart';

var gosterilecekTarih = tarih;
String _popupselection = '';
String _popupselection2 = '';
String _popupselection5='';
String _beceriIlk = beceriler.beceriAdlari[0];
List<String> iliskiliBeceriler = List<String>.generate(beceriler.beceriAdlari.length, (i) => beceriler.beceriAdlari[i]);

class YeniHedefEkle extends StatefulWidget {
  const YeniHedefEkle({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => YeniHedefEkleState();
}

class YeniHedefEkleState extends State<YeniHedefEkle> {
  Controller _controller = Get.find();

  var val;
  int TP = 0;
  int BeceriTP = 0;
  int altin = 0;
  int yapilacakGunSayisi=0;

  //TextField'ın içeriğini bu şekilde kontrol ediyoruz
  final hedefAdiControl = TextEditingController();
  final bitTarihControl = TextEditingController();
  final control = TextEditingController();
  final control2 = TextEditingController();
  final control3 = TextEditingController();
  final yapilacakControl = TextEditingController();
  final iliskilibecericontrol = TextEditingController();
  final hedefYapilacakControl = TextEditingController();

  //control a ilk değerini verebilmek için "YeniGorevEkleState" e constructor tanımlamalıyız.
  void initState() {
    super.initState();

    setState(() {
      _controller.yeniHedefIliskiliBeceri.value = _controller.beceriler[0].ad;
      hedefAdiControl.text = _controller.yeniHedefAdi.value;
      control.text = _controller.yeniHedefTP.value.toString();
      control2.text = _controller.yeniHedefAltin.value.toString();
      _controller.yeniHedefBasTarih.value = tarih;
      _controller.yeniHedefBitTarih.value = yarinTarih;
      iliskilibecericontrol.text = _controller.yeniHedefIliskiliBeceri.value;
      hedefYapilacakControl.text = _controller.yeniHedefYapilacakGunSayisi.toString();
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
          title: Text(
            'Yeni Hedef Ekle',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.check, color: Colors.white, size: 25.0),
              onPressed: () async {
                WidgetsBinding.instance!.addPostFrameCallback((_) async {
                  //Yeni hedefkaydı
                  if (_controller.yeniHedefAdi.value.length < 3) {
                    Fluttertoast.showToast(
                        msg: 'Hedef en az 3 harften oluşmalı!',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 12.0);
                  } else {
                    //Veri tabanındaki görev numaraları belirleniyor
                    var hedefNumaralari = [];
                    int enBuyukKayitNo = karakter.hedefSayisi;
                    await dosya.tumHedefListeOlustur().then((List hedefler) async {
                      setState(() {
                        karakter.hedefSayisi = hedefler.length;
                      });
                      //Veritabanında yapılan kayıtların numaraları yazılma-silinmeden dolayı değişiyor.İlkönce onları tespit ediyoruz.
                      for (int i = 0; i < karakter.hedefSayisi; i++) {
                        hedefNumaralari.add(hedefler[i].no);
                      }
                      //En büyük kayıt numarası tespit ediliyor

                      for (int i = 0; i < karakter.hedefSayisi; i++)
                        if (enBuyukKayitNo < hedefNumaralari[i])
                          enBuyukKayitNo = hedefNumaralari[i];

                      hedefNumaralari ==[]
                          ? Center(child: CircularProgressIndicator())
                          : print('Veri yüklendi');
                    });

                    var hedef = Hedef(
                        no: enBuyukKayitNo+1,
                        hedef: _controller.yeniHedefAdi.value,
                        yapilacakGun: _controller.yeniHedefYapilacakGunSayisi.value,
                        yapilanGun: 0,
                        altin: _controller.yeniHedefAltin.value,
                        TP: _controller.yeniHedefTP.value,
                        beceri: _controller.yeniHedefIliskiliBeceri.value,
                        beceriTP: _controller.yeniHedefBeceriTP.value,
                        basTarih: _controller.yeniHedefBasTarih.value,
                        bitTarih: _controller.yeniHedefBitTarih.value,
                        yapildi: 'Hayır'
                    );

                    await dosya.hedefEkle(hedef);

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
                      _controller.yeniHedefIliskiliBeceri.value =_controller.beceriler[0].ad;
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

                    Get.back();
                  }
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.cancel, color: Colors.white, size: 25.0),
              onPressed: () {
                //Yeni Görev ekle iptal edildiği için değiştirilen değerler sıfırlanıyor
                setState(() {
                  _controller.yeniHedefAdi.value = '';
                  _controller.yeniHedefBitTarih.value = '';
                  _controller.yeniHedefBasTarih.value = '';
                  _controller.yeniHedefBeceriTP.value = 0;
                  _controller.yeniHedefIliskiliBeceri.value =_controller.beceriler[0].ad;
                  _controller.yeniHedefAltin.value = 0;
                  _controller.yeniHedefYapilacakGunSayisi.value =0;
                  _controller.yeniHedefTP.value = 0;
                });
                Get.back();
              },
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.only(left: 10.0, top: 5),
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
              child: TextField(
                keyboardType: TextInputType.text,
                controller: hedefAdiControl,
                maxLength: 100,
                showCursor: false,
                style: TextStyle(fontSize: 12),
                decoration: InputDecoration(
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
            ),
            const Divider(),
            Row(
              children: [
                const Text('Tarih Aralığı:',
                    style:
                    TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                SizedBox(width: _w/5),
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
                SizedBox(
                  width: _w/3.425,
                  child: Obx(() =>
                      //Bu satırı yazmak yarım günüme mal oldu :(
                      Text(
                          DateFormat('dd/MM/yyyy').format(DateTime.parse((_controller.yeniHedefBasTarih).toString())),
                          style:
                              TextStyle(color: Colors.redAccent, fontSize: 14),
                          textAlign: TextAlign.center)),
                ),
              ],
            ),
            SizedBox(height: _w/41),
            Row(
              children: [
                const Text('Bitiş Tarihi:   ',
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                SizedBox(width: _w/13),
                SizedBox(
                  width: _w/3.425,
                  child: Obx(() =>
                      //Bu satırı yazmak yarım günüme mal oldu :(
                      Text(
                          DateFormat('dd/MM/yyyy').format(DateTime.parse((_controller.yeniHedefBitTarih).toString())),
                          style:
                              TextStyle(color: Colors.redAccent, fontSize: 14),
                          textAlign: TextAlign.center)),
                ),
              ],
            ),
            const Divider(),
            const Text('Ödül',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            Row(
              children: [
                const Text("TP:   ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                ButtonBar(
                  children: <Widget>[
                    SizedBox(
                      width: _w/8.22,
                      child: Obx(() => Text(
                          "  " + (_controller.yeniHedefTP).toString(),
                          style:
                              TextStyle(color: Colors.redAccent, fontSize: 14),
                          textAlign: TextAlign.center)),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () => {
                        if (TP < 100)
                          {
                            TP++,
                            _controller.yeniHedefTP.value = TP,
                            control.text = "$TP",
                          }
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () => {
                        if (TP > 0)
                          {
                            TP--,
                            _controller.yeniHedefTP.value = TP,
                            control.text = "$TP",
                          }
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
                    SizedBox(
                      width: _w/8.22,
                      child: Obx(() => Text(
                          (_controller.yeniHedefAltin).toString(),
                          style:
                              TextStyle(color: Colors.redAccent, fontSize: 14),
                          textAlign: TextAlign.center)),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () => {
                        if (altin < 100)
                          {
                            altin++,
                            _controller.yeniHedefAltin.value = altin,
                            control2.text = "$altin",
                          }
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () => {
                        if (altin > 0)
                          {
                            altin--,
                            _controller.yeniHedefAltin.value = altin,
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
                children: [
                  Text('İlişkili Beceri:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                  SizedBox(width: _w/10.275),
                  ButtonBar(
                    children: <Widget>[
                      PopupMenuButton<String>(
                        onSelected: (String value) {
                          setState(() {
                            _popupselection5 = value;
                            _controller.yeniHedefIliskiliBeceri.value = value;
                          });
                        },
                        child:
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: _w/4.11,
                              child: Obx(() =>
                                  Text(_controller.yeniHedefIliskiliBeceri.value,
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
              children: [
                const Text("Beceri TP:   ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                ButtonBar(
                  children: <Widget>[
                    SizedBox(
                      width: _w/8.22,
                      child: Obx(() => Text(
                          "  " + (_controller.yeniHedefBeceriTP).toString(),
                          style:
                              TextStyle(color: Colors.redAccent, fontSize: 14),
                          textAlign: TextAlign.center)),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () => {
                        if (BeceriTP < 100)
                          {
                            BeceriTP++,
                            _controller.yeniHedefBeceriTP.value = BeceriTP,
                            control.text = "$BeceriTP",
                          }
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () => {
                        if (BeceriTP > 0)
                          {
                            BeceriTP--,
                            _controller.yeniHedefBeceriTP.value = BeceriTP,
                            control.text = "$BeceriTP",
                          }
                      },
                    ),
                  ],
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                const Text("Yapılacak Gün Sayısı: ",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                ButtonBar(
                  children: <Widget>[
                    SizedBox(
                      width: _w/8,
                      child: Obx(() => Text(
                          "  " + (_controller.yeniHedefYapilacakGunSayisi).toString(),
                          style:
                          TextStyle(color: Colors.redAccent, fontSize: 14),
                          textAlign: TextAlign.center)),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () => {
                        if (yapilacakGunSayisi < 100)
                          {
                            yapilacakGunSayisi++,
                            _controller.yeniHedefYapilacakGunSayisi.value = yapilacakGunSayisi,
                            control3.text = "$yapilacakGunSayisi",
                          }
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () => {
                        if (yapilacakGunSayisi > 0)
                          {
                            yapilacakGunSayisi--,
                            _controller.yeniHedefYapilacakGunSayisi.value = yapilacakGunSayisi,
                            control3.text = "$yapilacakGunSayisi",
                          }
                      },
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

class hedefTarihBelirle extends StatefulWidget {
  @override
  _hedefTarihBelirleState createState() => _hedefTarihBelirleState();
}

class _hedefTarihBelirleState extends State<hedefTarihBelirle> {
  Controller _controller = Get.find();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  var tarihRadioVal;

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    String basTarih = _controller.yeniHedefBasTarih.value;
    String bitTarih = _controller.yeniHedefBitTarih.value;
    String yeniHedefBasTarihBaslangicDeger=_controller.yeniHedefBasTarih.value;
    String yeniHedefBitTarihBaslangicDeger=_controller.yeniHedefBitTarih.value;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Bir Tarih Seçin",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check,
                color: Colors.white, size: 25.0),
            onPressed: () async {
              Get.back();
            },
          ),
          IconButton(
            icon: Icon(Icons.cancel,
                color: Colors.white, size: 25.0),
            onPressed: () {
              //Yeni Görev ekle iptal edildiği için değiştirilen değerler sıfırlanıyor
              setState(() {
                _controller.yeniHedefBasTarih.value=yeniHedefBasTarihBaslangicDeger;
                _controller.yeniHedefBitTarih.value=yeniHedefBitTarihBaslangicDeger;
              });
              Get.back();
            },
          ),
        ],
      ),
      body: ListView(children: [
        TableCalendar(
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.now(),
          startingDayOfWeek: StartingDayOfWeek.monday,
          calendarFormat: _calendarFormat,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(_selectedDay, selectedDay)) {
              // Call `setState()` when updating the selected day
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;

                if (tarihRadioVal == 1) {
                  basTarih = DateFormat('yyyy-MM-dd').format(_selectedDay!);
                  String baslangicTarih=DateFormat('yyyy-MM-dd').format(_selectedDay!);
                  _controller.yeniHedefBasTarih.value=baslangicTarih;
                }
                else if (tarihRadioVal == 2) {
                  bitTarih = DateFormat('yyyy-MM-dd').format(_selectedDay!);
                  String bitisTarih=DateFormat('yyyy-MM-dd').format(_selectedDay!);
                  _controller.yeniHedefBitTarih.value=bitisTarih;
                }

                //yeniHedefBasTarih=DateFormat('yyyy-MM-dd').format(_selectedDay!);
                //_controller.yeniHedefBasTarih.value=DateFormat('yyyy-MM-dd').format(_selectedDay!);
              });

              //Get.back();
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
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              title: Row(children: [
                Text("Başlangıç Tarihi:",
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                SizedBox(width: _w/40),
                Text(DateFormat('dd/MM/yyyy').format(DateTime.parse(basTarih)),
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent)),
              ]),
              leading: Radio(
                value: 1,
                groupValue: tarihRadioVal,
                onChanged: (value) {
                  setState(() {
                    tarihRadioVal = value;
                  });
                },
                activeColor: Colors.green,
              ),
            ),
            ListTile(
              title: Row(children: [
                Text("Bitiş Tarihi: ",
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                SizedBox(width: _w/10),
                Text(DateFormat('dd/MM/yyyy').format(DateTime.parse(bitTarih)),
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent)),
              ]),
              leading: Radio(
                value: 2,
                groupValue: tarihRadioVal,
                onChanged: (value) {
                  setState(() {
                    tarihRadioVal = value;
                  });
                },
                activeColor: Colors.green,
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
