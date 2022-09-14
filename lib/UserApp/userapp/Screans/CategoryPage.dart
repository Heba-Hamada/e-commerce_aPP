import 'package:ffirebase/uiAdmenApp1/modelsAdmenApp/category.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  Category category;
  CategoryPage({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: Image.network(
        category.ImageUrl,
        width: double.infinity,
        height: 300,
      ),
    );
  }
}
