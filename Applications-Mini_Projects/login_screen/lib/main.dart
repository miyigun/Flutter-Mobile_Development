import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_screen/controller/controller.dart';
import 'package:login_screen/screen/screen_main_screen.dart';
//import 'package:login_screen/controller/controller.dart';
//import 'package:get/get.dart';
//import 'const/const.dart';

const String userName="Murat";
const String password="12345";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Screen',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red).copyWith(secondary: Colors.deepOrangeAccent[600])),
      home: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Login Screen",
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),),
          body: LoginScreen()),

    );
  }
}

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final controller = Get.put(GeneralController());

 @override
  Widget build(BuildContext context) {
    controller.onInit();

    final userNameField = TextField(
      obscureText: false,
      controller: controller.userNameController,
      //maxLength: 20,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          prefixIcon: const Icon(Icons.person),
          hintText: "User name",
          border:  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
      ),
    );

    final passwordField = TextField(
      obscureText: true,
      obscuringCharacter : '*',
      controller: controller.passwordController,
      //maxLength: 20,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          prefixIcon: const Icon(Icons.lock),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
      ),
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.black,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          if (controller.userNameController.text==userName && controller.passwordController.text==password) {
            showDialog(
                context: context,
                builder: (context){
                  return AlertDialog(
                    title: const Text("Login"),
                    content: const Text("Login is successful!\nYou are being redirected to the home page!"),
                    actions: [
                      TextButton(
                          onPressed: (){
                            //"Navigator.pushAndRemoveUntil" yerine kullanılıyor
                            Get.offAll(()=>MainScreen());
                          },
                          child: const Text("Ok")
                      ),
                    ],
                  );
                }
            );
          }
          else {
            Get.snackbar(
              "Login",
              "Login is failure!",
                colorText: Colors.black,
              icon: const Icon(Icons.info,size: 40,),
              snackPosition: SnackPosition.BOTTOM,
              duration : const Duration(seconds: 3),
            );

            //Alt satırda controller.userNameController.text='' ve controller.passwordController.text=''
            // işlemlerini gerçekleştirecek kodlar yazılacak

          }
        },

        child: const Text("Login",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.normal),),
      ),
    );

    final registerButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.red,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {

        },

        child: const Text("Register",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.normal),),
      ),
    );

    return Center(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("images/password.jpg"),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              /* CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage("images/password.jpg"),
            ),*/

              const SizedBox(height: 10.0),
              userNameField,

              const SizedBox(height: 5.0),
              passwordField,

              const SizedBox(height: 5.0),
              loginButton,

              const SizedBox(height: 5.0),
              registerButton


            ],
          ),
        ),
      ),
    );
  }

  // void _printLatestValue() {
  //   controller.userNameController.text="";
  // }
}

