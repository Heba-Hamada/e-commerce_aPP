import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ffirebase/uiAdmenApp1/modelsAdmenApp/User/appUserScrean.dart';

import 'package:firebase_core/firebase_core.dart';

class FirstoreHelper {
  static FirstoreHelper firstoreHelper = FirstoreHelper();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  CollectionReference<Map<String, dynamic>> collectionfirebaseFirestore =
      FirebaseFirestore.instance.collection("users");
  addUserToFirestore(AppUser appUser) async {
    firebaseFirestore.collection("users").doc(appUser.id).set(appUser.toMap());
  }
}
