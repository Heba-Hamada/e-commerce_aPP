import 'package:ffirebase/AppRoute.dart';
import 'package:ffirebase/data_repositories/provider/firestore_provider.dart';
import 'package:ffirebase/uiAdmenApp1/modelsAdmenApp/category.dart';
import 'package:ffirebase/uiAdmenApp1/userapp/Model/productModel/ProductCarousel.dart';
import 'package:ffirebase/uiAdmenApp1/userapp/Screans/ProductScreanus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesListTile extends StatelessWidget {
  List<Category> category;
  //final Color color;
  //final String assetpass;
  CategoriesListTile({required this.category});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Provider.of<firestoreProvider>(context, listen: false).products ==
              null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: category.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Provider.of<firestoreProvider>(context, listen: false)
                        .getAllProducts(Provider.of<firestoreProvider>(context,
                                listen: false)
                            .categories[index]
                            .catId);
                    AppRouter.NavigatortoWidget(ProductScreanus(
                        Provider.of<firestoreProvider>(context, listen: false)
                            .categories[index]
                            .catId));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,

                    children: [
                      /*  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [*/
                      /* Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 213, 227),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            )),
                        child: */
                      SizedBox(
                        width: 15,
                      ),
                      CircleAvatar(
                        radius: 45,
                        backgroundColor: Color.fromRGBO(71, 155, 141, 1),
                        backgroundImage: NetworkImage(
                          category[index].ImageUrl,
                          scale: 0.3,
                        ),
                      ),
                      //   ),
                      /*      Container(
                          height: 80,
                          width: 140,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 213, 227),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              )),
                          child: 
                      Text(
                        maxLines: 1,
                        category[index].name,
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      )
                      //    )*/
                    ],
                    //  ),
                    // ],
                  ),
                );
              },
            ),
    );
  }
}
