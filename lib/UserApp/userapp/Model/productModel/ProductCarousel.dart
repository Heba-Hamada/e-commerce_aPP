import 'package:ffirebase/AppRoute.dart';
import 'package:ffirebase/data_repositories/provider/firestore_provider.dart';
import 'package:ffirebase/uiAdmenApp1/userapp/Model/productModel/productCard.dart';
import 'package:ffirebase/uiAdmenApp1/userapp/Screans/productdetailesScrean.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreanus extends StatelessWidget {
  String CatId;
  ProductScreanus(this.CatId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Screan"),
        backgroundColor: Color.fromRGBO(71, 155, 141, 1),
        leading:
            IconButton(onPressed: () {}, icon: Icon(Icons.favorite_rounded)),
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
                        onTap: () {
                          AppRouter.NavigatortoWidget(DetailsProductScreen(
                              product: provider.products[index]));
                        },
                        child:
                            ProductsWidgetus(provider.products[index], CatId));
                  }));
        }),
      ),
    );
  }
}
