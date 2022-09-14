import 'package:ffirebase/uiAdmenApp1/Screansapp/Slider/UpdateSlider.dart';
import 'package:ffirebase/uiAdmenApp1/modelsAdmenApp/Slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../AppRoute.dart';
import '../../data_repositories/provider/firestore_provider.dart';

class SliderWidget extends StatelessWidget {
  Sliders slider;
  SliderWidget(this.slider);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 179, 190, 252),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                slider.ImageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            RaisedButton(
              color: Color.fromARGB(255, 237, 192, 245),
              onPressed: () {
                Provider.of<firestoreProvider>(context, listen: false);

                AppRouter.NavigatortoWidget(UpdateSlider(slider));
              },
              child: Text(
                "Edit",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            RaisedButton(
              color: Color.fromARGB(255, 237, 192, 245),
              onPressed: () {
                Provider.of<firestoreProvider>(context, listen: false)
                    .deleteslider(slider);
              },
              child: Text(
                "delete ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ));
  }
}
