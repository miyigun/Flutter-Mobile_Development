import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_stor/services/storage_service.dart';
import 'model/image_upload_model.dart';

class ImageUploadService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final StorageService _storageService = StorageService();
  String _mediaUrl = '';

  Future<ImageUpload> addImage(String email, File pickedFile) async {
    var ref = _firestore.collection("Profile");

    _mediaUrl = await _storageService.uploadMedia(File(pickedFile.path));

    var documentRef = await ref.add({'email': email, 'image': _mediaUrl});

    return ImageUpload(id: documentRef.id, email: email, image: _mediaUrl);
  }

  Stream<QuerySnapshot> getImage() {
    var ref = _firestore.collection("Profile").snapshots();

    return ref;
  }

  Future<void> removeImage(String docId) {
    var ref = _firestore.collection("Profile").doc(docId).delete();

    return ref;
  }
}
