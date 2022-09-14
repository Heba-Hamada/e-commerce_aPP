import 'dart:developer';
import 'dart:io';

import 'package:ffirebase/AppRoute.dart';
import 'package:ffirebase/data_repositories/provider/firestore_provider.dart';
import 'package:ffirebase/data_repositories/helpers/storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatelessWidget {
  String catId;
  AddProduct(this.catId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Consumer<firestoreProvider>(
          builder: (context, provider, child) {
            return Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                provider.selectedImage == null
                    ? InkWell(
                        onTap: () {
                          provider.selectImage();
                        },
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.green,
                        ))
                    : CircleAvatar(
                        radius: 50,
                        backgroundImage: FileImage(provider.selectedImage!),
                      ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: provider.ProductNamecontroller,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: provider.Productdescriptioncontroller,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: provider.Productpricecontroller,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: provider.Productquntitycontroller,
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      provider.addNewProducts(catId);
                      AppRouter.popRoute();
                    },
                    child: Text("add Product"))
              ],
            );
          },
        ));
  }
}
