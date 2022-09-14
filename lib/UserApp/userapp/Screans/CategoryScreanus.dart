import 'package:ffirebase/AppRoute.dart';
import 'package:ffirebase/data_repositories/provider/firestore_provider.dart';
import 'package:ffirebase/uiAdmenApp1/modelsAdmenApp/category.dart';
import 'package:ffirebase/uiAdmenApp1/userapp/Model/productModel/ProductCarousel.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CategoryScreanus extends StatefulWidget {
  List<Category> category;
  CategoryScreanus({required this.category});

  @override
  State<CategoryScreanus> createState() =>
      _CategoryScreanusState(this.category);
}

class _CategoryScreanusState extends State<CategoryScreanus> {
  var _currentIndex = 0;
  List<Category> category;
  _CategoryScreanusState(this.category);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categores"),
        backgroundColor: Color.fromRGBO(71, 155, 141, 1),
      ),
      body: Consumer<firestoreProvider>(builder: (context, provider, child) {
        return ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: provider.categories.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                provider.getAllProducts(provider.categories[index].catId);
                AppRouter.NavigatortoWidget(
                    ProductScreanus(provider.categories[index].catId));
              },
              child: Container(
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(children: [
                    SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: (Image.network(
                          category[index].ImageUrl,
                          fit: BoxFit.cover,
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          category[index].name,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ]),
                  ])),
            );
          },
        );
      }),
    );
  }
}
