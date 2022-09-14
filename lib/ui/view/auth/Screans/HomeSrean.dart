import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data_repositories/provider/auth_provider.dart';

class HomeSrean extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          onPressed: (() {
            Provider.of<Authprovider>(context, listen: false)
                .SignOut(); //الان اول اشي بتيجي صفحة السبلاش بتحقق اذا ففي مستخدم او لا اذا فش مشتخدم رح تظهر هادي الصفحة الي هيا الهوم لو ضغط ع اديالايقونة رح يرجعو لصفحة اللوقن
          }),
          icon: Icon(Icons.logout),
        )
      ]),
      body: Center(child: Text("Home Page")),
    );
  }
  /*AuthBase authBase = AuthBase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text('Sign out'),
          onPressed: () async {
            await authBase.logout();
            Navigator.of(context).pushReplacementNamed('login');
          },
        ),
      ),
    );
  }*/
}
