import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:plan_rpg/main.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';

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

class GrafikTab extends StatefulWidget {
  const GrafikTab({Key? key}) : super(key: key);

  @override
  GrafikTabState createState() => GrafikTabState();
}

class GrafikTabState extends State<GrafikTab> {
  Controller _controller = Get.find();

  late int touchedIndex;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      if (karakter.grafikVeriSayisi==0)
        Fluttertoast.showToast(
            msg: 'Henüz veri bulunmamaktadır. En az bir görevi tamamlayınız!',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 12.0);
    });
  }

  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;

    List<_gunKazancTP> data= [
      //Verilerin 7 den küçük olması ve büyük olmasına göre farklı grafikler oluşacak
      if(_controller.grafikVeriSayisi.value<7)
        for(int i=0;i<_controller.grafikVeriSayisi.value;i++ )
          _gunKazancTP(DateFormat('dd/MM').format(DateTime.parse(_controller.grafik[i]['tarih'].toString())),double.parse(_controller.grafik[i]['TPToplam'].toString())),
      if(_controller.grafikVeriSayisi.value>=7)
        for(int i=_controller.grafikVeriSayisi.value-7;i<_controller.grafikVeriSayisi.value;i++ )
          _gunKazancTP(DateFormat('dd/MM').format(DateTime.parse(_controller.grafik[i]['tarih'].toString())),double.parse(_controller.grafik[i]['TPToplam'].toString())),
    ];

    List<_gunKazancAltin> data2 = [
      if(_controller.grafikVeriSayisi.value<7)
        for(int i=0;i<_controller.grafikVeriSayisi.value;i++ )
          _gunKazancAltin(DateFormat('dd/MM').format(DateTime.parse(_controller.grafik[i]['tarih'].toString())),double.parse(_controller.grafik[i]['altinToplam'].toString())),
      if(_controller.grafikVeriSayisi.value>=7)
        for(int i=_controller.grafikVeriSayisi.value-7;i<_controller.grafikVeriSayisi.value;i++ )
          _gunKazancAltin(DateFormat('dd/MM').format(DateTime.parse(_controller.grafik[i]['tarih'].toString())),double.parse(_controller.grafik[i]['altinToplam'].toString())),
    ];

    List<_gunBasarili> data3 = [
      if(_controller.grafikVeriSayisi.value<7)
        for(int i=0;i<_controller.grafikVeriSayisi.value;i++ )
          _gunBasarili(DateFormat('dd/MM').format(DateTime.parse(_controller.grafik[i]['tarih'].toString())),double.parse(_controller.grafik[i]['basariDurumBasariliSayisi'].toString())),
      if(_controller.grafikVeriSayisi.value>=7)
        for(int i=_controller.grafikVeriSayisi.value-7;i<_controller.grafikVeriSayisi.value;i++ )
          _gunBasarili(DateFormat('dd/MM').format(DateTime.parse(_controller.grafik[i]['tarih'].toString())),double.parse(_controller.grafik[i]['basariDurumBasariliSayisi'].toString())),
    ];

    List<_gunBasarisiz> data4 = [
      if(_controller.grafikVeriSayisi2.value<7)
        for(int i=0;i<_controller.grafikVeriSayisi2.value;i++ )
          _gunBasarisiz(DateFormat('dd/MM').format(DateTime.parse(_controller.grafik2[i]['tarih'].toString())),double.parse(_controller.grafik2[i]['basariDurumBasarisizSayisi'].toString())),
      if(_controller.grafikVeriSayisi2.value>=7)
        for(int i=_controller.grafikVeriSayisi2.value-7;i<_controller.grafikVeriSayisi2.value;i++ )
          _gunBasarisiz(DateFormat('dd/MM').format(DateTime.parse(_controller.grafik2[i]['tarih'].toString())),double.parse(_controller.grafik2[i]['basariDurumBasarisizSayisi'].toString())),
    ];

    return Scaffold(
      backgroundColor: Color.fromRGBO(200, 240, 240, 1.0),
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('İstatistik'),
      ),
      body:
      ListView(
          scrollDirection : Axis.vertical,
          padding: EdgeInsets.all(10.0),
          children: [
            //Initialize the chart widget
            Container(
                height: _w/1.5,
                child:  Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  //color: Colors.red,
                  child: SfCartesianChart(
                    //margin: EdgeInsets.all(_w/4),
                      primaryXAxis: CategoryAxis(),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      legend: Legend(
                        position: LegendPosition.bottom,
                        isVisible: true,
                        title: LegendTitle(
                          textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                        textStyle: TextStyle(fontSize: 10),
                      ),
                      series: <ChartSeries<_gunBasarili, String>>[
                        ColumnSeries<_gunBasarili, String>(
                          dataSource: data3,
                          xValueMapper: (_gunBasarili grafik, _) => grafik.gun,
                          yValueMapper: (_gunBasarili grafik, _) => grafik.basariDurumBasariliSayisi,
                          name: 'Başarılı Görev Sayısı',
                          // Enable data label
                          //dataLabelSettings: DataLabelSettings(isVisible: true),
                          xAxisName: 'tarih',
                          yAxisName: 'Başarılı Görev Sayısı',
                          //isTrackVisible: true,
                        ),
                      ]),
                ),
            ),
            Container(
                height: _w/1.5,
                child: Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      legend: Legend(
                        position: LegendPosition.bottom,
                        isVisible: true,
                        title: LegendTitle(
                          textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                        textStyle: TextStyle(fontSize: 10),
                      ),
                      series: <ChartSeries<_gunBasarisiz, String>>[
                        ColumnSeries<_gunBasarisiz, String>(
                          dataSource: data4,
                          xValueMapper: (_gunBasarisiz grafik, _) => grafik.gun,
                          yValueMapper: (_gunBasarisiz grafik, _) => grafik.basariDurumBasarisizSayisi,
                          //yValueMapper: (_gunBasariliBasarisiz grafik, _) => grafik.basariDurumBasarisizSayisi,
                          name: 'Başarısız Görev Sayısı',
                          // Enable data label
                          //dataLabelSettings: DataLabelSettings(isVisible: true),
                          xAxisName:  'tarih',
                          yAxisName:  'Başarısız Görev Sayısı',
                          //isTrackVisible: true,
                        ),
                      ]),
                ),
            ),
            Container(
                height: _w/1.5,
                child:  Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      legend: Legend(
                        position: LegendPosition.bottom,
                        isVisible: true,
                        title: LegendTitle(
                          textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                        textStyle: TextStyle(fontSize: 10),
                      ),
                      series: <ChartSeries<_gunKazancTP, String>>[
                        ColumnSeries<_gunKazancTP, String>(
                          dataSource: data,
                          xValueMapper: (_gunKazancTP grafik, _) => grafik.gun,
                          yValueMapper: (_gunKazancTP grafik, _) => grafik.kazancTP,
                          name: 'Kazanılan TP',
                          // Enable data label
                          //dataLabelSettings: DataLabelSettings(isVisible: true),
                          xAxisName:  'Günler',
                          yAxisName:  'TP',
                          //isTrackVisible: true,
                        ),
                      ]),
                ),
            ),
            Container(
                height: _w/1.5,
                child:  Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      legend: Legend(
                        position: LegendPosition.bottom,
                        isVisible: true,
                        title: LegendTitle(
                          textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                        textStyle: TextStyle(fontSize: 10),
                      ),
                      series: <ChartSeries<_gunKazancAltin, String>>[
                        ColumnSeries<_gunKazancAltin, String>(
                          dataSource: data2,
                          xValueMapper: (_gunKazancAltin grafik, _) => grafik.gun,
                          yValueMapper: (_gunKazancAltin grafik, _) => grafik.kazancAltin,
                          name: 'Kazanılan Altın',
                          // Enable data label
                          //dataLabelSettings: DataLabelSettings(isVisible: true),
                          xAxisName:  'Günler',
                          yAxisName:  'Altın',
                          //isTrackVisible: true,
                        ),
                      ]),
                ),
            ),
            SizedBox(height: _w/80),
            Center(
              child: Text('Beceriler(Seviye cinsinden)'
                  '',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            ),
            Container(
              height: _w,
              child: Card(
                margin: EdgeInsets.all(10.0),
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: RadarChart(
                  features: List.generate(_controller.beceriSayisi.value,(index) => _controller.beceriler[index].ad),
                  featuresTextStyle: TextStyle(color: Colors.black , fontSize: 8, fontWeight: FontWeight.bold),
                  ticks: <int>[2,4,6,8,10,12],
                  data: <List<int>>[
                    [for(int i=0;i<_controller.beceriSayisi.value;i++ )
                      _controller.beceriler[i].seviye,]
                  ],
                ),


              ),
            ),
          ],
        ),
    );
  }

}

class _gunKazancTP {
  _gunKazancTP(this.gun, this.kazancTP);

  final String gun;
  final double kazancTP;
}

class _gunKazancAltin {
  _gunKazancAltin(this.gun, this.kazancAltin);

  final String gun;
  final double kazancAltin;
}

class _gunBasarili{
  _gunBasarili(this.gun,this.basariDurumBasariliSayisi);

  final String gun;
  final double basariDurumBasariliSayisi;

}

class _gunBasarisiz{
  _gunBasarisiz(this.gun,this.basariDurumBasarisizSayisi);

  final String gun;
  final double basariDurumBasarisizSayisi;

}


