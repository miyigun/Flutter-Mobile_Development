import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_stor/services/image_upload_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "File upload operations",
          style: TextStyle(
            color: Colors.green[300],
          ),
        ),
      ),
      body: _buildBody(),
    );
  }
}

class _buildBody extends StatefulWidget {

  @override
  State<_buildBody> createState() => _buildBodyState();
}

class _buildBodyState extends State<_buildBody> {

  File? image;
  final ImageUploadService _imageUploadService = ImageUploadService();

  Future uploadedFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final _selectedImage = File(image.path);

      setState(() => this.image = _selectedImage);
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }


    _imageUploadService
        .addImage("miyigun@hotmail.com", image!)
        .then((value) {
      Get.back();
    }).catchError((error) {
      debugPrint("Error");
    }).whenComplete(() {
      debugPrint("Ok");
    });
  }

  Future uploadedFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final _photo = File(image.path);

      setState(() => this.image = _photo);
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }

    _imageUploadService
        .addImage("miyigun@hotmail.com", image!)
        .then((value) {
      Get.back();
    }).catchError((error) {
      debugPrint("Error");
    }).whenComplete(() {
      debugPrint("Ok");
    });

  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          //Flutter does not recommend RaisedButton. It recommends ElevatedButton instead
          ElevatedButton(
            //Style adjustments on ElevatedButton were difficult
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>((
                    Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.green;
                  }
                  return Colors.orange;
                })),
            onPressed: uploadedFromGallery,
            child: const Text("Uploading Images from Gallery",
                style: TextStyle(
                  color: Colors.white,
                )),
          ),

          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>((
                    Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)){
                    return Colors.green;}
                  return Colors.orange;
                })),
            onPressed: uploadedFromCamera,
            child: const Text(
                "Uploading Pictures from Camera",
                style: TextStyle(
                  color: Colors.white,
                )),
          ),

          Expanded(
              child: image == null
                  ? const Text("There is not a picture")
                  : Image.file(image!)
          ),
        ],
      ),
    );
  }
}
