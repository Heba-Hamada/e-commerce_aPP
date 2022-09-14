import 'package:ffirebase/AppRoute.dart';
import 'package:ffirebase/data_repositories/provider/auth_provider.dart';
import 'package:ffirebase/uiAdmenApp1/Screansapp/Category/CategoryScrean.dart';
import 'package:ffirebase/uiAdmenApp1/Screansapp/Slider/SliderScrean.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "E-commerse App ",
            style: TextStyle(fontSize: 30),
          ),
          actions: [
            IconButton(
              onPressed: (() {
                Provider.of<Authprovider>(context, listen: false)
                    .SignOut(); //الان اول اشي بتيجي صفحة السبلاش بتحقق اذا ففي مستخدم او لا اذا فش مشتخدم رح تظهر هادي الصفحة الي هيا الهوم لو ضغط ع اديالايقونة رح يرجعو لصفحة اللوقن
              }),
              icon: Icon(Icons.logout),
            )
          ]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              AppRouter.NavigatortoWidget(CategoryScrean());
            },
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "Categories ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: GradientColors.sky,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 300,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          InkWell(
            onTap: () {
              AppRouter.NavigatortoWidget(SliderScrean());
            },
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "Sliders ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: GradientColors.mango,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 300,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ],
      ),
    );
  }
}

class GradientColors {
  final List<Color> colors;
  GradientColors(this.colors);

  static List<Color> sky = [Color(0xFF6448FE), Color(0xFF5FC6FF)];
  static List<Color> sunset = [Color(0xFFFE6197), Color(0xFFFFB463)];
  static List<Color> sea = [Color(0xFF61A3FE), Color(0xFF63FFD5)];
  static List<Color> mango = [Color(0xFFFFA738), Color(0xFFFFE130)];
  static List<Color> fire = [Color(0xFFFF5DCD), Color(0xFFFF8484)];
}
