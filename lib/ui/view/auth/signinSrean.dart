import 'package:ffirebase/data_repositories/AuthHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingninScrean extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                AuthHelper.authHelper.SignUp("hena@gmail.com", "1234567890");
              },
              child: Text("t1"))),
    );
  }
}
