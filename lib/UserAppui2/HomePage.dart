import 'package:carousel_slider/carousel_slider.dart';
import 'package:ffirebase/data_repositories/provider/firestore_provider.dart';
import 'package:ffirebase/uiAdmenApp1/modelsAdmenApp/Slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, //????
        leading: IconButton(
          onPressed: () {},
          icon: Icon(FontAwesomeIcons.gripLines),
          color: Colors.grey,
          tooltip: "Minue",
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
              color: Colors.grey,
              tooltip: "Search"),
          IconButton(
            icon: Icon(
              FontAwesomeIcons.shoppingBasket,
              size: 20,
            ),
            onPressed: () {},
            color: Colors.grey,
            tooltip: "Cart",
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
//slider=====================
              Center(
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
//categries =====================
              _bulitCategories()
            ],
          ),
        ),
      ),
    );
  }

  Widget _bulitCategories() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Categories"),
                  Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color(0xff0E6EE),
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(10))),
                      child: Text("Explre All"))
                ]),
          )
        ],
      ),
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
        margin: EdgeInsets.all(5.0),
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
