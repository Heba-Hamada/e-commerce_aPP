import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorgeHelper {
  static StorgeHelper storgeHelper = StorgeHelper();
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  UploadedImage(File file) async {
    String fillName = file.path.split("/").last;
    Reference reference = firebaseStorage.ref(fillName);
    TaskSnapshot taskSnapshot = await reference.putFile(file); //ارفع الملف
    String imageUrl = await reference.getDownloadURL();
    return imageUrl;
  }
}
