import 'package:ffirebase/data_repositories/provider/firestore_provider.dart';
import 'package:ffirebase/uiAdmenApp1/userapp/Model/productdetailesWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../modelsAdmenApp/Prodect.dart';

class DetailsProductScreen extends StatelessWidget {
  const DetailsProductScreen({Key? key, required this.product})
      : super(key: key);
  final Prodect product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("product Detailes"),
          elevation: 0,
          backgroundColor: Color.fromRGBO(71, 155, 141, 1),
        ),
        body: Consumer<firestoreProvider>(builder: (context, provider, child) {
          return DetailsProductWidget(product);
        }));
  }
}
