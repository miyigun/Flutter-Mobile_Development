import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../main.dart';

var choice = 0;

class karakterAvatarFace extends StatefulWidget {
  const karakterAvatarFace({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => karakterAvatarFaceState();
}

class karakterAvatarFaceState extends State<karakterAvatarFace> {
  Controller _controller = Get.find();
  late String yazdirilacak;
  var ilkAvatar=karakter.avatar;
  var ilkAvatarRenk=karakter.avatarRenk;

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
          title: Text('Avatar ve Renk Seçimi', style: TextStyle(fontSize: 18)),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.check,
                    color: Colors.white, size: 25.0),
                onPressed: () async {
                  setState(() {
                    _controller.avatar.value= karakter.avatar;
                    _controller.avatarRenk.value= karakter.avatarRenk;
                  });

                  yazdirilacak = karakter.ad+"\n"+karakter.durum+"\n"+karakter.seviye.toString()+"\n"+
                      karakter.sonrakiSeviyeye.toString()+"\n"+karakter.TP.toString()+"\n"+
                      karakter.altin.toString()+"\n"+karakter.avatar.toString()+"\n"+
                      karakter.avatarRenk.toString()+"\n";
                  await dosya.KadosyayaYaz(yazdirilacak).then((_) async {});

                  Get.back();
                },
              ),
              IconButton(
                icon: Icon(Icons.cancel,
                    color: Colors.white, size: 25.0),
                onPressed: () {
                  setState(() {
                    karakter.avatar=ilkAvatar;
                    karakter.avatarRenk=ilkAvatarRenk;
                  });

                  Get.back();
                },
              ),
            ]
        ),
        body: ListView(
          padding: EdgeInsets.all(_w/82.2),
          children: <Widget>[
            SizedBox(height: 10),
            Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Row(
                  mainAxisAlignment : MainAxisAlignment.center,
                  children:[
                SizedBox(width:_w/80),
                Text("Seçilen: ", textAlign: TextAlign.center, style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                SizedBox(width:20),
                Icon(avatar[karakter.avatar],
                    color: iconColor[karakter.avatarRenk],size: 40),
              ]),
            ),
            SizedBox(height: _w/40),
            const Text(' Renk',
                //textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    //color: Colors.red,
                    fontWeight: FontWeight.bold
                )),
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
                   //childAspectRatio: (12/2),
                  ),
                  itemBuilder: (context,index,) {
                    return Container(
                        child:  IconButton(
                          icon: const Icon(Icons.fiber_manual_record),
                          color: iconColor[index],
                          iconSize: 40.0,
                          onPressed: () {
                            choice = index;
                            setState(() {
                              karakter.avatarRenk=choice;
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
            //textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18,
                //color: Colors.red,
                fontWeight: FontWeight.bold
            )),
            SizedBox(height: _w/80),
            Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Container(
                height: _w,
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: GridView.builder(
                  itemCount:  avatar.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).orientation ==
                        Orientation.landscape ? 3: 6,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    //childAspectRatio: (12/2),
                  ),
                  itemBuilder: (context,index,) {
                    return Container(
                        child:
                        IconButton(
                          icon: Icon(avatar[index]),
                          iconSize: 40.0,
                          color: iconColor[choice],
                          onPressed: () {
                            setState(() {
                              karakter.avatar = index;
                              karakter.avatarRenk = choice;
                            });
                          },
                        )
                    );

                  },

                ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
