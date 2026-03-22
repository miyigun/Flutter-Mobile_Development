import 'package:cloud_firestore/cloud_firestore.dart';

class ImageUpload {
  String id;
  String email;
  String image;

  ImageUpload({required this.id ,required this.email, required this.image});

  factory ImageUpload.fromSnapshot(DocumentSnapshot snapshot) {
    return ImageUpload(
      id: snapshot.id,
      email: snapshot["email"],
      image: snapshot["image"],
    );
  }
}
