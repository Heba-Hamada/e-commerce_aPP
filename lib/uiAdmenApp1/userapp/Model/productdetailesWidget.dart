import 'package:ffirebase/uiAdmenApp1/modelsAdmenApp/Prodect.dart';
import 'package:flutter/material.dart';

class DetailsProductWidget extends StatelessWidget {
  Prodect product;

  DetailsProductWidget(this.product);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
            child: Container(
          width: 450,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: Color.fromARGB(255, 213, 236, 255),
            image: DecorationImage(
              image: NetworkImage(
                product.image,
              ),
              fit: BoxFit.cover,
            ),
          ),
// Image.network(product.image,width: 500,height: 350,)
        )),
        // Container(
        //   decoration: const BoxDecoration(
        //     color: Colors.grey,
        //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
        //   ),
        //   child: ClipRRect(
        //     borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        //     child: AspectRatio(
//       aspectRatio: 16 / 12,
        //       child: Image(image: NetworkImage(product.image!))
        //     ),
        //   ),
// ),
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Product Name :  ${product.name}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                color: Colors.grey,
              ),
              Text(
                ' Product price = ${product.price} \$',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.grey,
              ),
              Text(
                'Product quantity  = ${product.quantity} ',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.grey,
              ),
              Text(
                "Product description : \n ${product.description}",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
