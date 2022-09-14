import 'package:ffirebase/AppRoute.dart';
import 'package:ffirebase/data_repositories/provider/firestore_provider.dart';
import 'package:ffirebase/uiAdmenApp1/Screansapp/productsScrean/updateProduct.dart';
import 'package:ffirebase/uiAdmenApp1/modelsAdmenApp/Prodect.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsWidget extends StatelessWidget {
  Prodect p;
  String CatId;

  ProductsWidget(this.p, this.CatId);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 179, 190, 252),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              p.image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  p.name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 1,
                child: RaisedButton(
                  color: Color.fromARGB(255, 237, 192, 245),
                  onPressed: () {
                    Provider.of<firestoreProvider>(context, listen: false)
                        .categoryNamecontroller
                        .text = p.name;
                    AppRouter.NavigatortoWidget(updateProduct(p, CatId));
                  },
                  child: Text(
                    "Edit",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                width: 2,
              ),
              Expanded(
                flex: 1,
                child: RaisedButton(
                  color: Color.fromARGB(255, 237, 192, 245),
                  onPressed: () {
                    Provider.of<firestoreProvider>(context, listen: false)
                        .deleteProdect(p, CatId);
                  },
                  child: Text(
                    "delete ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
