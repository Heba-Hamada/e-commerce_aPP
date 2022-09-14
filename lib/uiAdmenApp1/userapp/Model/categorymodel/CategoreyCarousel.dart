import 'package:ffirebase/AppRoute.dart';
import 'package:ffirebase/data_repositories/provider/firestore_provider.dart';
import 'package:ffirebase/uiAdmenApp1/modelsAdmenApp/category.dart';
import 'package:ffirebase/uiAdmenApp1/userapp/Model/categorymodel/CategoriesCard.dart';
import 'package:ffirebase/uiAdmenApp1/userapp/Model/productModel/ProductCarousel.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../../Screans/ProductScreanus.dart';

class CategoreyCarousel extends StatelessWidget {
  List<Category> categorys;
  CategoreyCarousel({required this.categorys});
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
      height: 300,
      child: /* GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shrinkWrap: true,
                itemCount: categorys.length,
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: InkWell(
                          onTap: () {
                            Provider.of<firestoreProvider>(context,
                                    listen: false)
                                .getAllProducts(Provider.of<firestoreProvider>(
                                        context,
                                        listen: false)
                                    .categories[index]
                                    .catId);
                            AppRouter.NavigatortoWidget(ProductScreanuser(
                                products: Provider.of<firestoreProvider>(
                                        context,
                                        listen: false)
                                    .products));
                          },
                          child: CategoriesCard(category: categorys[index])));
                })*/

          ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shrinkWrap: true,
        itemCount: categorys.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 5),
            child: InkWell(
                onTap: () {
                  Provider.of<firestoreProvider>(context, listen: false)
                      .getAllProducts(
                          Provider.of<firestoreProvider>(context, listen: false)
                              .categories[index]
                              .catId);
                  AppRouter.NavigatortoWidget(ProductScreanus(
                      Provider.of<firestoreProvider>(context, listen: false)
                          .categories[index]
                          .catId));
                },
                /*  onTap: () {



                  Provider.of<firestoreProvider>(context, listen: false)
                      .getAllProducts(
                          Provider.of<firestoreProvider>(context, listen: false)
                              .categories[index]
                              .catId);
                  AppRouter.NavigatortoWidget(ProductScreanuser(
                      products:
                          Provider.of<firestoreProvider>(context, listen: false)
                              .products));
                },*/
                child: CategoriesCard(category: categorys[index])),
          );
        },
      ),
    ));
  }
}
