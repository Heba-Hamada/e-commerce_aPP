import 'package:ffirebase/AppRoute.dart';
import 'package:ffirebase/data_repositories/provider/firestore_provider.dart';
import 'package:ffirebase/uiAdmenApp1/Screansapp/Slider/AddSlider.dart';
import 'package:ffirebase/uiAdmenApp1/Widgets/SliderWidget.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliderScrean extends StatelessWidget {
  const SliderScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sliders Screan"),
        backgroundColor: Color.fromARGB(255, 179, 190, 252),
      ),
      body: Consumer<firestoreProvider>(
        builder: ((context, provider, child) {
          return provider.slideries.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: provider.slideries.length,
                  itemBuilder: ((context, index) {
                    return SliderWidget(provider.slideries[index]);
                  }));
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppRouter.NavigatortoWidget(AddSlider());
        },
        child: Icon(Icons.add),
        focusColor: Color.fromARGB(255, 179, 190, 252),
      ),
    );
  }
}
