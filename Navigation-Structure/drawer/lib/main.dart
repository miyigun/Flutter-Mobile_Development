import 'package:drawer/screens/screen_log_out.dart';
import 'package:drawer/screens/screen_main_screen.dart';
import 'package:drawer/screens/screen_pofile.dart';
import 'package:flutter/material.dart';
import 'const/const.dart';
import 'package:get/get.dart';
//import 'package:drawer/utils/utils.dart' ;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple).copyWith(secondary: Colors.deepPurple)
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drawer Example"),
      ),
      body: const Center(
        child: Text("Welcome!"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [

            DrawerHeader(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  gradient: LinearGradient(
                      colors: [Colors.blue,Colors.red]
                ),),
                child: Align(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        SizedBox(height: 10),
                        CircleAvatar(
                          radius: 40.0,
                          backgroundImage: AssetImage("images/avatar.jpg"),
                        ),
                        //Icon(Icons.person, size: 75),
                        Text("Murat İyigün", style: TextStyle(fontSize: 25.0)),
                        SizedBox(height: 10),
                        Text("miyigun@hotmail.com", style: TextStyle(fontSize: 15.0))
                      ],
                    )
            ),
            ),

            for (int index=0; index<menuItemList.length; index++)
              drawerMenu(index, menuItemList[index], iconList[index]),

          ],
        ),
        ),
    );
  }

  drawerMenu(index, title , icon) {
    return Padding(
      padding: EdgeInsets.zero,
      child: ListTile(
        title: Text(title),
        leading: Icon(icon),
        onTap: (){
          switch(index) {
            case 0:
              Get.to(const MainScreen());
              break;
            case 1:
              Get.to(const Profile());
              break;
            case 2:
              Get.to(const LogOut());
              break;
          }
        },
      ),
    );
  }

}



