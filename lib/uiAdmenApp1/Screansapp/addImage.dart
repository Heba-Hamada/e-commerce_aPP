import 'dart:developer';
import 'dart:io';

import 'package:ffirebase/AppRoute.dart';
import 'package:ffirebase/data_repositories/provider/firestore_provider.dart';
import 'package:ffirebase/data_repositories/storage_helper.dart';
import 'package:ffirebase/ui/view/auth/Widgets/Customdilog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddCategory extends StatelessWidget {
  const AddCategory({Key? key}) : super(key: key);

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
                  controller: provider.categoryNamecontroller,
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () async {
                      //      bool isup =
                      await provider.addNewCategory();
                      /* if (isup == true) {
                        AppRouter.popRoute();
                      } else {
                        CustomDilog.showDilogFunction("image un aploded");
                      }*/
                      AppRouter.popRoute();
                    },
                    child: Text("add category"))
              ],
            );
          },
        ));
  }
}
