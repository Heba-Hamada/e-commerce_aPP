import 'package:ffirebase/uiAdmenApp1/modelsAdmenApp/category.dart';
import 'package:flutter/material.dart';

class TopProduct extends StatelessWidget {
  List<Category> category;
  //final Color color;
  //final String assetpass;
  TopProduct({required this.category});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
          height: 200,
          child: ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: category.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.all(15),
              height: 200,
              width: 150,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 235, 228, 164),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )),
              child: Stack(children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 20,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          category[index].ImageUrl,
                          height: 80,
                          width: 80,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          category[index].name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "2.5 & ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        )
                      ]),
                ),
                Positioned(
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20))),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Icon(Icons.add)),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Icon(Icons.remove)),
                        ],
                      ),
                    )),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      child: Icon(Icons.favorite_border),
                    ))
              ]),
            ),
          )),
    );
  }
}
