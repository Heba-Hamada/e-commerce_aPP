import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ffirebase/uiAdmenApp1/modelsAdmenApp/Prodect.dart';
import 'package:ffirebase/uiAdmenApp1/modelsAdmenApp/Slider.dart';
import 'package:ffirebase/uiAdmenApp1/modelsAdmenApp/User/appUserScrean.dart';
import 'package:ffirebase/uiAdmenApp1/modelsAdmenApp/category.dart';

import 'package:firebase_core/firebase_core.dart';

class FirestoreHelper {
  FirestoreHelper._();
  static FirestoreHelper firestoreHelper = FirestoreHelper._();
  FirebaseFirestore firebaseinstance = FirebaseFirestore.instance;
  String categoriesname = "categories";
  String sildername = "slideries";

  insertDataInfireStore() async {
    firebaseinstance
        .collection(categoriesname)
        .add({"name": "food", "ImageUrl": ""});
  }

  addUserToFireStore(AppUser appUser) async {
    await firebaseinstance
        .collection("users")
        .doc(appUser.id)
        .set(appUser.toMap());
  }

  getUserFromFirestore(String id) async {
    DocumentSnapshot<Map<String, dynamic>> docsnsh =
        await firebaseinstance.collection("users").doc(id).get();

    return AppUser.fromMaP(docsnsh.data()!);
  }

  Future<Category> addNewCategory(Category category) async {
    DocumentReference<Map<String, dynamic>> decr =
        await firebaseinstance.collection(categoriesname).add(category.toMap());
    category.catId = decr.id;
    return category;
  }

  Future<List<Category>> getAllCategories() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firebaseinstance.collection(categoriesname).get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> decuments =
        querySnapshot.docs;

    List<Category> categories = decuments.map((e) {
      Category category = Category.fromMap(e.data());

      category.catId = e.id;
      return category;
    }).toList();

    return categories;
  }

  deleteCategory(Category category) async {
    await firebaseinstance
        .collection(categoriesname)
        .doc(category.catId)
        .delete();
  }

  UpDateCategory(Category category) async {
    await firebaseinstance
        .collection(categoriesname)
        .doc(category.catId)
        .update(category.toMap());
  }

//==================================================

  Future<Sliders> addNewSlider(Sliders silder) async {
    DocumentReference<Map<String, dynamic>> decr =
        await firebaseinstance.collection(sildername).add(silder.toMap());
    silder.catId = decr.id;
    return silder;
  }

  Future<List<Sliders>> getAllSlider() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firebaseinstance.collection(sildername).get();

    List<QueryDocumentSnapshot<Map<String, dynamic>>> decuments =
        querySnapshot.docs;

    List<Sliders> sliders = decuments.map((e) {
      Sliders sliders = Sliders.fromMap(e.data());

      sliders.catId = e.id;
      return sliders;
    }).toList();

    return sliders;
  }

  deleteSlider(Sliders slider) async {
    await firebaseinstance.collection(sildername).doc(slider.catId).delete();
  }

  UpDateSlider(Sliders slider) async {
    await firebaseinstance
        .collection(sildername)
        .doc(slider.catId)
        .update(slider.toMap());
  }

  //======================================
  Future<Prodect> addnewProduct(Prodect prodect, String CatId) async {
    DocumentReference<Map<String, dynamic>> decr = await firebaseinstance
        .collection(categoriesname)
        .doc(CatId)
        .collection("products")
        .add(prodect.toMap());
    prodect.id = decr.id;
    return prodect;
  }

  Future<List<Prodect>> getAllProduct(String CatId) async {
    QuerySnapshot<Map<String, dynamic>> qsn = await firebaseinstance
        .collection(categoriesname)
        .doc(CatId)
        .collection("products")
        .get();
    List<Prodect> p = qsn.docs.map((e) {
      Map<String, dynamic> data = e.data();
      data["id"] = e.id;
      Prodect prodect = Prodect.fromMap(data);
      return prodect;
    }).toList();

    return p;
  }

  UpdateProduct(Prodect prodect, String CatId) async {
    await firebaseinstance
        .collection(categoriesname)
        .doc(CatId)
        .collection("products")
        .doc(prodect.id)
        .update(prodect.toMap());
  }

  deleteProduct(Prodect prodect, String CatId) async {
    await firebaseinstance
        .collection(categoriesname)
        .doc(CatId)
        .collection("products")
        .doc(prodect.id)
        .delete();
  }

//===================================================================================================
  /* Future<List<Prodect>> getAllProducts() async {
    QuerySnapshot<Map<String, dynamic>> qsn =
        await firebaseinstance.collection("products").get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> decuments = qsn.docs;

    List<Prodect> Prodects = decuments.map((e) {
      Prodect prodect = Prodect.fromMap(e.data());

      prodect.id = e.id;
      return prodect;
    }).toList();

    return Prodects;
  }*/
}
