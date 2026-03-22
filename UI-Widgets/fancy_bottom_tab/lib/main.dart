import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:fancy_bottom_tab/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  State<StatefulWidget> createState() => MyApp2();
}

class MyApp2 extends State<MyApp> {
  int currentPage = 0;

  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightGreenAccent,
            title: Text(
              "Fancy Bottom Application",
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: _getPage(currentPage),
            ),
          ),
          bottomNavigationBar: FancyBottomNavigation(
            circleColor: Colors.white,
            activeIconColor: Colors.black,
            inactiveIconColor: Colors.white,
            barBackgroundColor: Colors.lightGreenAccent,
            textColor: Colors.black,
            tabs: [
              TabData(
                  iconData: Icons.people,
                  title: "Directory",
                  onclick: () {
                  }),
              TabData(
                iconData: Icons.task_alt_sharp,
                title: "To Do List",
              ),
              TabData(
                  iconData: Icons.message,
                  title: "Messages"
              )
            ],
            initialSelection: 0,
            key: bottomNavigationKey,
            onTabChangedListener: (position) {
              setState(() {
                currentPage = position;
              });
            },
          ),


        ));
  }

  _getPage(int page) {

    var _nameList=["Murat","Gülden","Gözde","Nermin","Mehmet","Melda","Ufuk"];
    var _avatarList=["images/murat.jpg","images/gulden.jpg","images/gozde.jpg","images/nermin.jpg","images/mehmet.jpg","images/melda.jpg","images/ufuk.jpg"];
    var _phoneNumber=["(0500) ...","(0500) ...","(0500) ...","(0500) ...","(0500) ...","(0500) ...","(0500) ..."];

    final GeneralController controller = Get.put(GeneralController());
    //int? val = 1;
    //bool checkedValue=Get.find();
    switch (page) {
      case 0:
        return ListView.builder(
          itemCount: _nameList.length,
            itemBuilder: (context,index){
              return Column(
                children: [
                  ListTile(
                    // leading: Icon(Icons.person),
                    leading: Container(
                      height: 80,
                      width: 80,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(_avatarList[index]),
                      ),
                    ),
                    title: Text(_nameList[index], style: TextStyle(fontSize: 20)),
                    subtitle: Text(_phoneNumber[index]),
                    trailing: Icon(Icons.phone),
                    selectedTileColor: Colors.red,
                    //selected: true,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  ),
                  SizedBox(height: 10,)
                ],
              );
            }
        );

      case 1:
        return Obx(()=>
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:10, top: 10),
                  child: Text("To Do List",
                    style: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),),
                ),
                SizedBox(height:10),
                CheckboxListTile(
                  title: Text("Study English"),
                  subtitle: Text("30 minutes"),
                  value: controller.checkedValue.value,
                  onChanged: (newValue) {
                    controller.checkedValue.value=!controller.checkedValue.value;
                  },
                  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                ),

                SizedBox(height:10),
                CheckboxListTile(
                  title: Text("Running"),
                  subtitle: Text("10.000 steps"),
                  value: controller.checkedValue2.value,
                  onChanged: (newValue) {
                    controller.checkedValue2.value=!controller.checkedValue2.value;
                  },
                  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                ),

                SizedBox(height:10),
                CheckboxListTile(
                  title: Text("Cooking"),
                  subtitle: Text("Chicken Kebab"),
                  value: controller.checkedValue3.value,
                  onChanged: (newValue) {
                    controller.checkedValue3.value=!controller.checkedValue3.value;
                  },
                  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                ),

              ],
            ),
        );

      default:
        return Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.blue[100],
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 80,
                        width: 80,
                        child: CircleAvatar(
                          backgroundImage: AssetImage("images/gulden.jpg"),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            Text(
                              "Gülden",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text("Let's meet at 20:00!",
                              ),
                            )

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.blue[100],
                  child: Row(

                    children: <Widget>[

                      Container(
                        height: 80,
                        width: 80,
                        child: CircleAvatar(
                          backgroundImage: AssetImage("images/murat.jpg"),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Murat",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text("Let's meet at the cinema at 18:00!",
                              ),
                            )

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )

            ],
          );
    }
  }
}

