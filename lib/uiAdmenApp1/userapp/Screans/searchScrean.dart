import 'package:ffirebase/AppRoute.dart';
import 'package:ffirebase/data_repositories/provider/firestore_provider.dart';
import 'package:ffirebase/uiAdmenApp1/modelsAdmenApp/category.dart';
import 'package:ffirebase/uiAdmenApp1/userapp/Screans/CategoryPage.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class searchScrean extends StatefulWidget {
  @override
  State<searchScrean> createState() => _searchScreanState();
}

class _searchScreanState extends State<searchScrean> {
  TextEditingController controller = TextEditingController();
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    void searchCat(String query) {
      final suggestions = Provider.of<firestoreProvider>(context, listen: false)
          .categories
          .where((element) {
        final title = element.name.toLowerCase();
        final input = query.toLowerCase();
        return Provider.of<firestoreProvider>(context,
                listen: false) //booxtile.c
            .categories
            .contains(input);
      }).toList();
      setState(() => Provider.of<firestoreProvider>(context) //booxtile.c
          .categories = suggestions);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    AppRouter.popRoute();
                  },
                  icon: Icon(Icons.arrow_back)),
              Spacer(),
              IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: Mysearch());
                  },
                  icon: Icon(Icons.search)),
            ],
          )
        ],
      ),
      body: Consumer<firestoreProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(1),
                      prefixIcon: IconButton(
                          onPressed: () {
                            showSearch(context: context, delegate: Mysearch());
                          },
                          icon: Icon(Icons.search)),
                      suffix: IconButton(
                          onPressed: () {
                            AppRouter.popRoute();
                          },
                          icon: Icon(Icons.arrow_back)),
                      hintText: "Search",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.red))),
                  onChanged: searchCat,
                ),
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: provider.categories.length,
                itemBuilder: (context, index) {
                  final ser = provider.categories[index];

                  return ListTile(
                    leading: Image.network(
                      ser.ImageUrl,
                      width: 50,
                      height: 50,
                    ),
                    title: Text(ser.name),
                    onTap: () => AppRouter.NavigatortoWidget(CategoryPage(
                      category: ser,
                    )),
                  );
                },
              )),
            ],
          );
        },
      ),
    );
  }
}

class Mysearch extends SearchDelegate {
  List<Category> sugre = [];

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
