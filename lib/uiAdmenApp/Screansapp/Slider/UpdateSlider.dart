import 'package:ffirebase/AppRoute.dart';
import 'package:ffirebase/data_repositories/provider/firestore_provider.dart';
import 'package:ffirebase/uiAdmenApp1/modelsAdmenApp/Slider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateSlider extends StatelessWidget {
  Sliders slider;
  UpdateSlider(this.slider);
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
                            backgroundImage: NetworkImage(slider.ImageUrl),
                          )
                        : CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                FileImage(provider.selectedImageSlider!),
                          )),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 60,
                ),
                ElevatedButton(
                    onPressed: () {
                      provider.UpdateSlider(slider);
                      AppRouter.popRoute();
                    },
                    child: Text("Edit Slider"))
              ],
            );
          },
        ));
  }
}
