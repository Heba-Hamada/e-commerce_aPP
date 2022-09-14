import 'package:ffirebase/data_repositories/provider/auth_provider.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

//هادي الصفحة بتحقق اذا المستخدم كان مسجل دخول ع التطبيق او لا اذا  اه ويديه ع الهوم اذا لا ع اللوقن
class Splash1 extends StatelessWidget {
  const Splash1({Key? key}) : super(key: key);
  navigatefun(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));
    Provider.of<Authprovider>(context, listen: false).CheckUser();
    //اذا طلع في غلط اععملي
    // AuthHelper.authHelper.CheckUser();
  }

  @override
  Widget build(BuildContext context) {
    navigatefun(context);
    return Scaffold(
      body: Center(
          child: Lottie.asset("assets/animation/30173-welcome-screen.json")),
    );
  }
}
