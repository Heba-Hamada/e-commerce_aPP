import 'package:ffirebase/AppRoute.dart';
import 'package:ffirebase/data_repositories/provider/firestore_provider.dart';
import 'package:ffirebase/uiAdmenApp1/Screansapp/productsScrean/addProduct.dart';
import 'package:ffirebase/uiAdmenApp1/Widgets/ProductsWidget.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScrean extends StatelessWidget {
  String CatId;
  ProductScrean(this.CatId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Screan"),
        backgroundColor: Color.fromARGB(255, 179, 190, 252),
      ),
      body: Consumer<firestoreProvider>(
        builder: ((context, provider, child) {
          return provider.products.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: provider.products.length,
                  itemBuilder: ((context, index) {
                    return InkWell(
                        onTap: () {},
                        child: ProductsWidget(provider.products[index], CatId));
                  }));
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppRouter.NavigatortoWidget(AddProduct(CatId));
        },
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 136, 94, 143),
        // color of icon
        foregroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          // rounded
          borderRadius: BorderRadius.all(Radius.circular(15)),
          // border side
          side: BorderSide(color: Colors.black54, width: 2),
        ),
      ),
      /*RoundedRectangleBorder(
              side: BorderSide(color: Colors.black, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(20)))*/
    );
  }
}
