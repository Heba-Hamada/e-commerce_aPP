import 'dart:developer';
import 'dart:io';

import 'package:ffirebase/AppRoute.dart';
import 'package:ffirebase/data_repositories/provider/auth_provider.dart';
import 'package:ffirebase/data_repositories/provider/firestore_provider.dart';
import 'package:ffirebase/data_repositories/storage_helper.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class HomePage1 extends StatelessWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              "E-commerse App ",
              style: TextStyle(fontSize: 30),
            ),
            actions: [
              IconButton(
                onPressed: (() {
                  Provider.of<Authprovider>(context, listen: false)
                      .SignOut(); //الان اول اشي بتيجي صفحة السبلاش بتحقق اذا ففي مستخدم او لا اذا فش مشتخدم رح تظهر هادي الصفحة الي هيا الهوم لو ضغط ع اديالايقونة رح يرجعو لصفحة اللوقن
                }),
                icon: Icon(Icons.logout),
              )
            ]),
        body: Consumer<firestoreProvider>(
          builder: ((context, provider, child) {
            return InkWell(
              onTap: () {
                provider.selectImage();
              },
              child: Column(
                children: [
                  provider.selectedImage == null
                      ? InkWell(
                          onTap: (() {
                            provider.selectImage();
                          }),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey,
                          ))
                      : CircleAvatar(
                          backgroundImage: FileImage(provider.selectedImage!),
                        ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: provider.categoryNamecontroller,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        provider.addNewCategory();
                      },
                      child: Text("New Category"))
                ],
              ),
            );
          }),
        ));
  }
}
