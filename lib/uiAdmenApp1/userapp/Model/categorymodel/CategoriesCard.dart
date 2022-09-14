import 'package:ffirebase/data_repositories/provider/firestore_provider.dart';
import 'package:ffirebase/uiAdmenApp1/modelsAdmenApp/category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesCard extends StatelessWidget {
  Category category;
  CategoriesCard({required this.category});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            padding: EdgeInsets.all(4),
            margin: EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            width: MediaQuery.of(context).size.width / 2.5,
            height: 200,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: (Image.network(
                  category.ImageUrl,
                  fit: BoxFit.cover,
                ))))

        /*   Positioned(
          top: 235,
          child: Container(
            width: MediaQuery.of(context).size.width / 2.5,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.red,
              //   color: Colors.black.withAlpha(50),
            ),
          ),
        ),*/
        ,
        Positioned(
          top: 150,
          left: 10,
          child: Container(
            width: MediaQuery.of(context).size.width / 2.5 - 10,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.name,
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Color.fromRGBO(71, 155, 141, 1),
                        ),
                  )
                  //, IconButton(onPressed: (){}, icon: Icon(Icons.add_circle))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
