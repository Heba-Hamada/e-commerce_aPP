import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ffirebase/AppRoute.dart';
import 'package:ffirebase/data_repositories/darkMode.dart';
import 'package:ffirebase/data_repositories/provider/firestore_provider.dart';
import 'package:ffirebase/uiAdmenApp1/modelsAdmenApp/Slider.dart';
import 'package:ffirebase/uiAdmenApp1/modelsAdmenApp/category.dart';
import 'package:ffirebase/uiAdmenApp1/userapp/Model/categorymodel/CategoreyCarousel.dart';
import 'package:ffirebase/uiAdmenApp1/userapp/Screans/CategoryScreanus.dart';
import 'package:ffirebase/uiAdmenApp1/userapp/Screans/FaverateScrean.dart';
import 'package:ffirebase/uiAdmenApp1/userapp/Screans/howe_screen.dart';
import 'package:ffirebase/uiAdmenApp1/userapp/Screans/personalpage.dart';
import 'package:ffirebase/uiAdmenApp1/userapp/Screans/searchScrean.dart';
import 'package:ffirebase/uiAdmenApp1/userapp/Widget/CategoriesListTile.dart';
import 'package:ffirebase/uiAdmenApp1/userapp/Widget/TopProduct.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  var _currentIndex = 0;
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('search');

  @override
  Widget build(BuildContext context) {
    final themeser = Provider.of<Themeser>(context, listen: false);

    List<Widget> screans = [
      HomeScreen(),
      FavierateScr(),
      CategoryScreanus(
          category: Provider.of<firestoreProvider>(context).categories),
      AboutUs()
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            themeser.darkTheme ? Color.fromRGBO(71, 155, 141, 1) : Colors.white,
        elevation: 0, //????
        leading: IconButton(
          onPressed: () {},
          icon: Icon(FontAwesomeIcons.gripLines),
          color: themeser.darkTheme ? Colors.white : Colors.grey,
          tooltip: "Minue",
        ),
        actions: [
          IconButton(
              icon: Icon(themeser.darkTheme ? Icons.sunny : Icons.dark_mode),
              onPressed: () {
                themeser.darkTheme = !themeser.darkTheme;
              },
              color: themeser.darkTheme ? Colors.white : Colors.grey,
              tooltip: "Mode"),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // method to show the search bar
                showSearch(
                    context: context,
                    // delegate to customize the search bar
                    delegate: Mysearch());
              },
              color: themeser.darkTheme ? Colors.white : Colors.grey,
              tooltip: "Search"),
          IconButton(
            icon: Icon(
              FontAwesomeIcons.shoppingBasket,
              size: 20,
            ),
            onPressed: () {},
            color: themeser.darkTheme ? Colors.white : Colors.grey,
            tooltip: "Cart", //?
          ),
        ],
      ),
      body: screans[_currentIndex],

//bottomNavigationBar =========================================================

      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() {
          _currentIndex = i;
        }),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.purple,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text("Favorites"),
            selectedColor: Colors.pink,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(Icons.search),
            title: Text("Categories"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("profileprofile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }

  Widget _builtBottonNavegationBar(BuildContext context) {
    List<String> bottonNavegationBaroPtions = [
      "Home",
      "Favorites",
      "Categories",
      "profile"
    ];
    List<IconData> IconbottonNavegationBar = [
      Icons.home,
      Icons.favorite,
      Icons.navigation,
      Icons.person
    ];
    List<Widget> screans = [
      HomeSlider(),
      FavierateScr(),
      CategoryScreanus(
          category: Provider.of<firestoreProvider>(context).categories),
      AboutUs()
    ];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 80,
      decoration: BoxDecoration(
          color: Color.fromRGBO(71, 155, 141, 1),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Row(
        children: List.generate(bottonNavegationBaroPtions.length, (index) {
          if (index == _currentIndex) {
            return Expanded(
                flex: 2,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _currentIndex = index;
                      AppRouter.NavigatortoWidget(screans.elementAt(index));
                    });
                  },
                  child: Center(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            IconbottonNavegationBar[index],
                            color: Color.fromRGBO(71, 155, 141, 1),
                          ),
                          Text(
                            bottonNavegationBaroPtions[index],
                            style: TextStyle(
                                color: Provider.of<Themeser>(context).darkTheme
                                    ? Color.fromRGBO(71, 155, 141, 1)
                                    : Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                ));
          } else {
            return Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                child: Icon(
                  IconbottonNavegationBar[index],
                  color: Colors.white,
                ),
              ),
            );
          }
        }),
      ),
    );
  }

  Widget _bulitProductList() {
    return Container(
        child: TopProduct(
      category:
          Provider.of<firestoreProvider>(context, listen: false).categories,
    ));
  }

  Widget _bulitToProduct() {
    return Container(
        child: Column(
      children: [],
    ));
  }

  Widget _bulitCategories() {
    return Column(
      children: [],
    );
  }
}

class HereSlider extends StatelessWidget {
  Sliders sliders;
  HereSlider({required this.sliders});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Container(
        margin: EdgeInsets.all(5),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.network(sliders.ImageUrl,
                    scale: 2, fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class Mysearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              } else {
                query = " ";
              }
            },
            icon: Icon(Icons.clear))
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null), icon: Icon(Icons.arrow_back));

  @override
  Widget buildResults(BuildContext context) => Container(
        child: Text(
          query,
          style: TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Category> suL =
        Provider.of<firestoreProvider>(context, listen: false).categories;
    // List<String> suL = //suL.where((element) => final result =suL)
    // ["USA", "Kanada"];
    suL.where((element) {
      final result = element.name.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return ListView.builder(
      itemCount: suL.length,
      //  Provider.of<firestoreProvider>(context).categories.length,
      itemBuilder: (context, index) {
        //  final sug = suL[index];
        final sug = Provider.of<firestoreProvider>(context, listen: false)
            .categories[index];
        return ListTile(
          title: Text(sug.name),
          //   title: Text(sugge.name),

          onTap: () {
            query = sug.name;
            showResults(context);
          },
        );
      },
    );
  }
}
