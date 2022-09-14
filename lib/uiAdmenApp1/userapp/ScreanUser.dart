import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ffirebase/data_repositories/provider/firestore_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class screanUser extends StatefulWidget {
  const screanUser({super.key});

  @override
  State<screanUser> createState() => _screanUserState();
}

class _screanUserState extends State<screanUser> {
  int currentindexslider = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<firestoreProvider>(builder: (context, provider, child) {
      return Container(
          child: Column(children: [
        Container(
          height: 180,
          color: Colors.green,
        ),
        SizedBox(
          height: 18,
        ),
        Container(
            color: Colors.white,
            height: 200,
            child: CarouselSlider.builder(
                itemCount:
                    Provider.of<firestoreProvider>(context, listen: false)
                        .slideries
                        .length,
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 5,
                  enlargeCenterPage: true,
                ),
                itemBuilder: (context, index, realIdx) {
                  return Container(
                      child: Center(
                    child: Image.network(
                      Provider.of<firestoreProvider>(context)
                          .slideries[index]
                          .ImageUrl,
                      fit: BoxFit.cover,
                      width: 1000,
                      height: 180,
                    ),
                  ));
                }))
      ]));
    });
  }
}
        
   
 
 

      
      /*istView(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            color: const Color(0xFFFCE620),
            height: 110,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "المدينة و الدولة ",
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 3,
                ),
                Container(
                  height: 40,
                  child: const TextField(
                    decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Colors.black,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Colors.black,
                            )),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        suffixIcon:
                            Icon(Icons.filter_list, color: Colors.black),
                        hintText: ("ابحث هنا "),
                        contentPadding: EdgeInsets.all(0),
                        border: const OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Colors.black,
                            ))),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                CarouselSlider(
                    items: [
                      /* siderss(
                slider.ImageUrl,
              ),*/
                      siderss(
                        "https://images.unsplash.com/photo-1660569883128-765b7c16f731?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
                      ),
                      siderss(
                        "https://images.unsplash.com/photo-1599420186946-7b6fb4e297f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwyNXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
                      ),
                      siderss(
                        "https://images.unsplash.com/photo-1660570328508-34840e2a80d9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxN3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
                      ),

                      //   Image.network(slider.ImageUrl),
                    ],
                    options: CarouselOptions(
                      height: 180,
                      autoPlay: true, //تتحرك لحالها
                      viewportFraction:
                          0.97, //تعرضش اشي م نالعرض ا الجوانب معاها
                      autoPlayInterval: Duration(seconds: 5), //كل قديش يقلب
                      autoPlayAnimationDuration:
                          Duration(microseconds: 300), //سرعة التقليبة
                      onPageChanged: ((index, reason) {
                        setState(() {
                          currentindexslider = index;
                        });
                      }),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i <= 4; i++)
                      Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                          height: 8,
                          width: i == currentindexslider ? 8 : 4,
                          decoration: BoxDecoration(
                              color: i == currentindexslider
                                  ? Color(0xFFFCE620)
                                  : Colors.grey,
                              shape: BoxShape.circle)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),

      /*   Consumer<firestoreProvider>(builder: (context, provider, x) {
        return Column(
          children: [
       
            Container(
              height:150,
              color: Color.fromARGB(255, 250, 228, 36),
            ),
            SizedBox(
              height: 10,
            ),
            SliderScreanUser(),
          ],
        );
      }),*/
      /*
      Consumer<firestoreProvider>(
        builder: (context, provider, x) {
          return Column(
            children: [
           

Container(
  height: 200,
  color: Colors.blue,
),






              SizedBox(
                height: 30,
              ),
              Text(
                "Category",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
                   ListView.builder(
                  itemCount: provider.categories.length,
                  itemBuilder: (context, index) {
                    return CategoryWidgetUser(provider.categories[index]);
                  })
            ],
          );
        },
      ),*/
    );
  }
}

Widget siderss(String imageurl) {
  return Builder(builder: (BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          imageurl,
          fit: BoxFit.fill,
        ),
      ),
    );
  });}*/
