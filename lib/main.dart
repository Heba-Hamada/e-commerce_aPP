import 'dart:developer';
import 'dart:io';

import 'package:ffirebase/AppRoute.dart';
import 'package:ffirebase/UserAppui2/HomePage.dart';
import 'package:ffirebase/data_repositories/darkMode.dart';
import 'package:ffirebase/data_repositories/provider/auth_provider.dart';
import 'package:ffirebase/data_repositories/provider/firestore_provider.dart';
import 'package:ffirebase/data_repositories/storage_helper.dart';
import 'package:ffirebase/firebase_options.dart';
import 'package:ffirebase/ui/view/auth/Screans/SplachScrean.dart';
import 'package:ffirebase/ui/view/auth/signinSrean.dart';
import 'package:ffirebase/uiAdmenApp1/Screansapp/Slider/SliderScrean.dart';
import 'package:ffirebase/uiAdmenApp1/userapp/Home.dart';

import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<Authprovider>(
          create: (context) => Authprovider(),
        ),
        ChangeNotifierProvider<firestoreProvider>(
          create: (context) => firestoreProvider(),
        ),
        ChangeNotifierProvider<Themeser>(
          create: (_) => Themeser(),
        ),
      ],
      child: Builder(builder: (BuildContext context) {
        final themeser = Provider.of<Themeser>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                brightness:
                    themeser.darkTheme ? Brightness.dark : Brightness.light,
                seedColor: Colors.indigo),
            //   primarySwatch: Colors.blue,
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          navigatorKey: AppRouter.navkey,
          home: HomeSlider(),
        );
      })));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MyHomePage(title: 'Flutter Demo Home Page');
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
        child: Text("on press"),
        onPressed: () {
          Provider.of<firestoreProvider>(context, listen: false).getAllSlider();
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return SliderScrean();
          }));
        },
      ),
    ));
  }
}

/*
class getproduct extends StatelessWidget {
  const getproduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
          onPressed: () {
            Provider.of<firestoreProvider>(context,listen: false).getAllProductsall();
          },
          child: Text("getAllProducts")),
    );
  }
}*/
