import 'package:ffirebase/AppRoute.dart';
import 'package:ffirebase/data_repositories/provider/firestore_provider.dart';
import 'package:ffirebase/uiAdmenApp1/modelsAdmenApp/Prodect.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class ProductScreanuser extends StatefulWidget {
  List<Prodect> products;
  ProductScreanuser({required this.products});

  @override
  State<ProductScreanuser> createState() =>
      _ProductScreanuserState(this.products);
}

class _ProductScreanuserState extends State<ProductScreanuser> {
  var _currentIndex = 0;
  List<Prodect> products;
  _ProductScreanuserState(this.products);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("products"),
        backgroundColor: Color.fromARGB(255, 153, 153, 153),
      ),
      body: Consumer<firestoreProvider>(builder: (context, provider, child) {
        return provider.products == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: provider.products.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      //        provider.getAllProducts(provider.categories[index].catId);
                      //   AppRouter.NavigatortoWidget(
                      //    ProductScreanudelatailes(provider.categories[index].catId));
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
                                products[index].image,
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
                                products[index].name,
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
