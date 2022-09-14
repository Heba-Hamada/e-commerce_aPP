import 'dart:developer';
import 'dart:io';

import 'package:ffirebase/AppRoute.dart';
import 'package:ffirebase/data_repositories/provider/firestore_provider.dart';
import 'package:ffirebase/data_repositories/storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddSlider extends StatelessWidget {
  const AddSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Consumer<firestoreProvider>(
          builder: (context, provider, child) {
            return Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                      onTap: () {
                        provider.selectImagesli();
                      },
                      child: CircleAvatar(
                        radius: 100,
                        backgroundColor: Color.fromARGB(255, 211, 137, 162),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        provider.addNewSliders();
                        AppRouter.popRoute();
                      },
                      child: Text("add Sliders"))
                ],
              ),
            );
          },
        ));
  }
}
