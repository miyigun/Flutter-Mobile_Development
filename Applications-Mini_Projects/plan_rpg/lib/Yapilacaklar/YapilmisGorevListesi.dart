import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../main.dart';
import 'YeniGorevEkle.dart';

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

var _checkedBugun = List.generate(1000, (index) => false);
//10000 görev için tanımladım. Daha fazla görev olursa arttırmalıyım!
List<bool> basarildimiKontrolGecmisGorevler=List.generate(10000, (index) => false);

class yapilmisGorevListesi extends StatefulWidget {
  const yapilmisGorevListesi({Key? key}) : super(key: key);


  @override
  _yapilmisGorevListesiState createState() => _yapilmisGorevListesiState();
}

class _yapilmisGorevListesiState extends State<yapilmisGorevListesi>{
  Controller _controller = Get.find();

  void initState(){
    super.initState;

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      if (_controller.gecmisGorevSayisi.value==0)
        Fluttertoast.showToast(
            msg: 'Yapılmış göreviniz bulunmamaktadır...',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 12.0);

      setState(() {
        for (int i=0;i<karakter.gecmisGorevSayisi;i++)
          if (_controller.gecmisGorevler[i].basariDurumu=="Başarılı") basarildimiKontrolGecmisGorevler[i]=true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(200, 240, 240, 1.0),
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Column(
          crossAxisAlignment : CrossAxisAlignment.start,
          children: [
            Text('Geçmiş görevler',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            Obx(() =>Text(_controller.gecmisGorevSayisi.value.toString()+' görev var',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ))),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_task),
            //butona basıldığında ikonun rengi açık kırmızı renge döner
            splashColor: Colors.redAccent,
            onPressed: () {
              Get.to(() => YeniGorevEkle());
            },
          ),
        ],
      ),
      body: Obx(() => AnimationLimiter(
        child: ListView.builder(
          padding: const EdgeInsets.all(5.0),
          physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemCount: _controller.gecmisGorevSayisi.value,
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
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Obx(() =>ListTile(
                      leading: _controller.gecmisGorevler[index].basariDurumu=='Başarılı' ? Icon(Icons.thumb_up,color: Colors.blue) : Icon(Icons.thumb_down,color: Colors.redAccent),
                      //basarildimiKontrolGecmisGorevler[index]==true ? Icon(Icons.thumb_up,color: Colors.blue) : Icon(Icons.thumb_down,color: Colors.redAccent),
                      title: Text(_controller.gecmisGorevler[index].ad),
                      subtitle: Text(DateFormat('dd/MM/yyyy').format(DateTime.parse(_controller.gecmisGorevler[index].tarih)),style: TextStyle(color: Colors.black.withOpacity(.4), fontSize:12)),
                    )),
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

