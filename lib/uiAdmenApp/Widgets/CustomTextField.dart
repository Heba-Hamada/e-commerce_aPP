import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  String title;
  TextEditingController controller;
  Function validator;
  TextInputType textInputType;
  Widget? suffex;

  CustomTextfield(
      this.title, this.validator, this.controller, this.textInputType,
      [this.suffex]);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextFormField(
            keyboardType: textInputType,
            controller: controller,
            validator: (x) => validator(x),
            decoration: InputDecoration(
                suffixIcon: suffex ?? SizedBox(),
                hintText: title,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
