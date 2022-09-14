import 'dart:developer';
import 'dart:io';

import 'package:ffirebase/data_repositories/helpers/firestore_helper.dart';
import 'package:ffirebase/data_repositories/helpers/storage_helper.dart';
import 'package:ffirebase/uiAdmenApp1/modelsAdmenApp/CustomDilog.dart';
import 'package:ffirebase/uiAdmenApp1/modelsAdmenApp/Prodect.dart';
import 'package:ffirebase/uiAdmenApp1/modelsAdmenApp/Slider.dart';
import 'package:ffirebase/uiAdmenApp1/modelsAdmenApp/category.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class firestoreProvider extends ChangeNotifier {
  TextEditingController categoryNamecontroller = TextEditingController();
  TextEditingController ProductNamecontroller = TextEditingController();
  TextEditingController Productdescriptioncontroller = TextEditingController();
  TextEditingController Productpricecontroller = TextEditingController();
  TextEditingController Productquntitycontroller = TextEditingController();

  firestoreProvider() {
    getAllCategory();
    getAllSlider();
  }
  File? selectedImage;

  File? selectedImageSlider;
  List<Category> categories = [];

  List<Sliders> slideries = [];
  List<Prodect> products = [];

  selectImage() async {
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    selectedImage = File(xfile!.path);
    notifyListeners();
  }

  addNewCategory() async {
    if (selectedImage != null) {
      String ImageUrl =
          await StorgeHelper.storgeHelper.UploadedImage(selectedImage!);
      Category category =
          Category(name: categoryNamecontroller.text, ImageUrl: ImageUrl);
      Category newcategory =
          await FirestoreHelper.firestoreHelper.addNewCategory(category);
      selectedImage = null;
      // categories.add(newcategory);
      await getAllCategory();
      notifyListeners();
      return true;
    } else {
      CustomDilog.showDilogFunction("image is null");
      return false;
    }
  }

  getAllCategory() async {
    categories = await FirestoreHelper.firestoreHelper.getAllCategories();
    notifyListeners();
  }

  UpdateCategories(Category category) async {
    String? ImageUrl;
    if (selectedImage != null) {
      ImageUrl = StorgeHelper.storgeHelper.UploadedImage(selectedImage!);
    }

    Category newcategory = Category(
        name: categoryNamecontroller.text,
        ImageUrl: ImageUrl ?? category.ImageUrl);
    newcategory.catId = category.catId;
    await FirestoreHelper.firestoreHelper.UpDateCategory(newcategory);
    getAllCategory();
    notifyListeners();
  }

  deleteCategor(Category category) async {
    await FirestoreHelper.firestoreHelper.deleteCategory(category);
    categories.removeWhere((element) =>
        element.catId == category.catId); //or     getAllCategory();
    notifyListeners();
  }

//================================================================================
  addNewSliders() async {
    if (selectedImageSlider != null) {
      String ImageUrl =
          await StorgeHelper.storgeHelper.UploadedImage(selectedImageSlider!);
      Sliders slider = Sliders(ImageUrl: ImageUrl);
      Sliders newslider =
          await FirestoreHelper.firestoreHelper.addNewSlider(slider);
      selectedImageSlider = null;

      slideries.add(newslider);
      await getAllSlider();
      notifyListeners();
    }
  }

  getAllSlider() async {
    slideries = await FirestoreHelper.firestoreHelper.getAllSlider();

    notifyListeners();
  }

  UpdateSlider(Sliders slider) async {
    String? ImageUrl;
    if (selectedImageSlider != null) {
      ImageUrl =
          await StorgeHelper.storgeHelper.UploadedImage(selectedImageSlider!);
      notifyListeners();
    }

    Sliders newslider = Sliders(ImageUrl: ImageUrl ?? slider.ImageUrl);
    newslider.catId = slider.catId;
    await FirestoreHelper.firestoreHelper.UpDateSlider(newslider);
    await getAllSlider();
    notifyListeners();
  }

  deleteslider(Sliders slider) async {
    await FirestoreHelper.firestoreHelper.deleteSlider(slider);
    categories.removeWhere(
        (element) => element.catId == slider.catId); //or     getAllCategory();
    notifyListeners();
  }

  selectImagesli() async {
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    selectedImageSlider = File(xfile!.path);
    notifyListeners();
  }

  //=====================================================

  getAllProducts(String CatId) async {
    products = await FirestoreHelper.firestoreHelper.getAllProduct(CatId);
    notifyListeners();
  }

  addNewProducts(String CatId) async {
    if (selectedImage != null) {
      String ImageUrl =
          await StorgeHelper.storgeHelper.UploadedImage(selectedImage!);
      Prodect prodect = Prodect(
          name: ProductNamecontroller.text,
          description: Productdescriptioncontroller.text,
          price: num.parse(Productpricecontroller.text),
          quantity: int.parse(Productquntitycontroller.text),
          image: ImageUrl);
      Prodect newProdect =
          await FirestoreHelper.firestoreHelper.addnewProduct(prodect, CatId);
      selectedImage = null;

      ProductNamecontroller.text = "";
      Productdescriptioncontroller.text = "";
      Productpricecontroller.text = "";
      Productquntitycontroller.text = " ";
      products.add(newProdect);
      await getAllProducts(CatId);
      notifyListeners();
    }
  }

  UpdateProdect(Prodect prodect, String catId) async {
    String? ImageUrl;
    if (selectedImage != null) {
      ImageUrl = StorgeHelper.storgeHelper.UploadedImage(selectedImage!);
    }

    Prodect newProdect = Prodect(
        name: ProductNamecontroller.text,
        description: Productdescriptioncontroller.text,
        image: ImageUrl ?? prodect.image,
        price: num.parse(Productpricecontroller.text),
        quantity: int.parse(Productquntitycontroller.text));

    newProdect.id = prodect.id;
    await FirestoreHelper.firestoreHelper.UpdateProduct(newProdect, catId);
    await getAllProducts(catId);
  }

  deleteProdect(Prodect prodect, String CatId) async {
    await FirestoreHelper.firestoreHelper.deleteProduct(prodect, CatId);
    products.removeWhere((element) => element.id == prodect.id);
//getAllProducts(CatId);
    notifyListeners();
  }

  /* getAllProductsall() async {
    products = await FirestoreHelper.firestoreHelper.getAllProducts();
    log(products.length.toString());
    notifyListeners();
  }*/
}
