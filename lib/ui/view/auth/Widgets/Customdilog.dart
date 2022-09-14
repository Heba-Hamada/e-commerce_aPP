import 'package:flutter/material.dart';

import '../../../../AppRoute.dart';

class CustomDilog {
  static showDilogFunction(String text) {
    showDialog(
        context: AppRouter.navkey.currentContext!,
        builder: (context) {
          return AlertDialog(
            content: Text(text),
            actions: [
              TextButton(
                  onPressed: () {
                    AppRouter.popRoute();
                  },
                  child: Text("ok!"))
            ],
          );
        });
  }
}
