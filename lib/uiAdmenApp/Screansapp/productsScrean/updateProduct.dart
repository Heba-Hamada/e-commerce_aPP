import 'package:ffirebase/AppRoute.dart';
import 'package:ffirebase/data_repositories/provider/firestore_provider.dart';
import 'package:ffirebase/uiAdmenApp1/modelsAdmenApp/Prodect.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class updateProduct extends StatelessWidget {
  Prodect prodect;
  String catId;
  updateProduct(this.prodect, this.catId);
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
                InkWell(
                    onTap: () {
                      provider.selectImage();
                    },
                    child: provider.selectedImage == null
                        ? CircleAvatar(
                            radius: 100,
                            backgroundColor: Colors.green,
                            backgroundImage: NetworkImage(prodect.image),
                          )
                        : CircleAvatar(
                            radius: 50,
                            backgroundImage: FileImage(provider.selectedImage!),
                          )),
                SizedBox(
                  height: 40,
                ),
                TextField(
                  controller: provider.ProductNamecontroller,
                ),
                SizedBox(
                  height: 60,
                ),
                ElevatedButton(
                    onPressed: () {
                      provider.UpdateProdect(prodect, catId);
                      AppRouter.popRoute();
                    },
                    child: Text("Edit Product"))
              ],
            );
          },
        ));
  }
}
