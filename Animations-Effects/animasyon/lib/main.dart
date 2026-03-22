import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
      home: SimpleAnimation())
  );
}

class SimpleAnimation extends StatefulWidget {
  const SimpleAnimation({Key? key}) : super(key: key);

  @override
  State<SimpleAnimation> createState() => _SimpleAnimationState();
}

class _SimpleAnimationState extends State<SimpleAnimation> {

  @override
  Widget build(BuildContext context) {

    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
            children: [
              Container(
                  height: height,
                  width: width,
                  margin: EdgeInsets.only(bottom: height/1.5 ),
                  child: const RiveAnimation.asset("assets/2063-4080-flutter-puzzle-hack-project.riv",
                    animations: ["slowDance"],)
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      width: width/5,
                      height: height/5,
                      margin: EdgeInsets.only(left:10, top: height/3.5),
                      child: const RiveAnimation.asset("assets/snowday.riv",
                        animations: ["Animation 1"],)
                  ),
                  const SizedBox(width: 15,),
                  Container(
                    width: width/1.5,
                    height: height/5,
                    margin: EdgeInsets.only(top: height/3, right: 10),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        hintText: "Kullanıcı adını giriniz",
                      ),

                      onSubmitted: (String anlikVeri){

                      },
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      width: width/7,
                      height: height/7,
                      margin: EdgeInsets.only(left: 30 , top: height/2.35 ),
                      child: const RiveAnimation.asset("assets/2091-4137-lock-stmin-greaterout-and-ontap.riv",
                        animations: ["rotation"],)
                  ),
                  Container(
                    width: width/1.5,
                    height: height/5,
                    margin: EdgeInsets.only(left:20, top: height/2.2, right: 10),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        hintText: "Şifrenizi giriniz",
                      ),

                      onSubmitted: (String anlikVeri){
                        debugPrint("On Submit : $anlikVeri");

                      },
                    ),
                  ),

                ],
              ),
              Container(
                  height: height/15,
                  margin: EdgeInsets.only(left: width/2.5, top: height/1.8),
                  child: ElevatedButton(
                    child: const Text("Onayla"),
                    onPressed: (){

                    },
                  )
              )
            ],
          ),
    );
  }
}