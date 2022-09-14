import 'package:ffirebase/AppRoute.dart';
import 'package:ffirebase/data_repositories/provider/firestore_provider.dart';
import 'package:ffirebase/uiAdmenApp1/Screansapp/addImage.dart';
import 'package:ffirebase/uiAdmenApp1/Screansapp/productsScrean/productscrean.dart';
import 'package:ffirebase/uiAdmenApp1/Widgets/CategoriesWidget.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScrean extends StatelessWidget {
  const CategoryScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories Screan"),
        backgroundColor: Color.fromARGB(255, 179, 190, 252),
      ),
      body: Consumer<firestoreProvider>(
        builder: ((context, provider, child) {
          return provider.categories == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: provider.categories.length,
                  itemBuilder: ((context, index) {
                    return InkWell(
                        onTap: () {
                          provider
                              .getAllProducts(provider.categories[index].catId);
                          AppRouter.NavigatortoWidget(
                              ProductScrean(provider.categories[index].catId));
                        },
                        child: CategoriesWidget(provider.categories[index]));
                  }));
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppRouter.NavigatortoWidget(AddCategory());
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
