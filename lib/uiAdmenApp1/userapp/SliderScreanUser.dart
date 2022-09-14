import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderScreanUser extends StatefulWidget {
  @override
  State<SliderScreanUser> createState() => _SliderScreanUserState();
}

class _SliderScreanUserState extends State<SliderScreanUser> {
  int currentindexslider = 0;

  //Sliders slider;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
              viewportFraction: 0.97, //تعرضش اشي م نالعرض ا الجوانب معاها
              autoPlayInterval: Duration(seconds: 5), //كل قديش يقلب
              autoPlayAnimationDuration:
                  Duration(microseconds: 300), //سرعة التقليبة
              onPageChanged: ((index, reason) {
                setState(() {
                  currentindexslider = index;
                  for (int i = 0; i < 5; i++) {
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 2, vertical: 10),
                            height: 8,
                            width: i == currentindexslider ? 6 : 3,
                            decoration: BoxDecoration(
                                color: i == currentindexslider
                                    ? Colors.blue
                                    : Colors.grey,
                                shape: BoxShape.circle)),
                      ],
                    );
                  }
                });
              }),
            )),
      ],
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
  });
}
