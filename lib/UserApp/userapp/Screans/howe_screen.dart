import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../AppRoute.dart';
import '../../../UserAppui2/HomePage.dart';
import '../../../data_repositories/darkMode.dart';
import '../../../data_repositories/provider/firestore_provider.dart';
import '../Model/categorymodel/CategoreyCarousel.dart';
import '../Widget/CategoriesListTile.dart';
import 'CategoryScreanus.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeser = Provider.of<Themeser>(context, listen: false);

    return ListView(
      padding: EdgeInsets.all(10),
      children: [
        Container(
            child: CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 1.5,
            viewportFraction: 0.9,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,

            //   enableInfiniteScroll: false,
            initialPage: 2,
            autoPlay: true,
          ),
          items: Provider.of<firestoreProvider>(context, listen: false)
              .slideries
              .map((e) => HereSlider(sliders: e))
              .toList(),
        )),
        SizedBox(
          height: 7,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: themeser.darkTheme
                      ? Color.fromRGBO(71, 155, 141, 1)
                      : Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )),
              child: Text(
                "Categories",
                style: TextStyle(
                  fontSize: 18,
                  color: themeser.darkTheme ? Colors.white : Colors.black,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                AppRouter.NavigatortoWidget(CategoryScreanus(
                  category:
                      Provider.of<firestoreProvider>(context, listen: false)
                          .categories,
                ));
              },
              child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(71, 155, 141, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )),
                  child: const Text(
                    "Explore All",
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ]),
        ),
        SizedBox(
          height: 5,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  AppRouter.NavigatortoWidget(CategoryScreanus(
                    category:
                        Provider.of<firestoreProvider>(context, listen: false)
                            .categories,
                  ));
                },
                child: CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.white70,
                  child: Stack(children: const [
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.white70,
                        child: Icon(
                          Icons.category,
                          size: 55,
                          color: Color.fromRGBO(71, 155, 141, 1),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              _bulitCategoriesList(),
            ],
          ),
        ),
        Divider(
          color: Colors.grey,
        ),
        Padding(
          padding: const EdgeInsets.all(3),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: themeser.darkTheme
                                ? Color.fromRGBO(71, 155, 141, 1)
                                : Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            )),
                        child: Text(
                          "Top Categories ",
                          style: TextStyle(
                            fontSize: 18,
                            color: themeser.darkTheme
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          AppRouter.NavigatortoWidget(CategoryScreanus(
                            category: Provider.of<firestoreProvider>(context,
                                    listen: false)
                                .categories,
                          ));
                        },
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(71, 155, 141, 1),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                )),
                            child: const Text(
                              "Explore All",
                              style: TextStyle(color: Colors.white),
                            )),
                      )
                    ]),
              ),
            ],
          ),
        )
        //   _bulitToProduct(),
        //  _bulitProductList(),\
        ,
        CategoreyCarousel(
          categorys:
              Provider.of<firestoreProvider>(context, listen: false).categories,
        )
      ],
    );
  }

  Widget _bulitCategoriesList() {
    return Container(
      child: CategoriesListTile(
          category: Provider.of<firestoreProvider>(context, listen: false)
              .categories),
    );
  }
}
