import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class AboutUs extends StatefulWidget {
  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  int selectedIndex = 1;
  sendmassegebywhatsapp(String phone, String message) {
    String Url = "whatsapp://send?phone=$phone&text=${Uri.encodeFull(message)}";
    launchUrl(Uri.parse(Url));
  }

  String WahtsApp =
      "whatsapp://send?phone=972597205071&text=${Uri.encodeFull('message')}";

  String num = "123456";

  Future<void> _launchIntel() async {
    launchUrl(
      Uri.parse("tel:0597205071"),
      mode: LaunchMode.externalApplication,
    );
  }

  Future<void> _launchInsms() async {
    launchUrl(
      Uri.parse("sms:0597205071"),
      mode: LaunchMode.externalApplication,
    );
  }

  Shareapp() {
    Share.share("www.myapp.com");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 236, 236, 236),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80,
                ),
                Row(
                  children: [
                    Text("Contact with us by :  ",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0))),
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.contact_page,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                InkWell(
                  onTap: () {
                    _launchIntel();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone,
                        size: 30,
                        color: Color.fromARGB(255, 27, 29, 48),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(" telopone  ",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 20,
                              // fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                InkWell(
                  onTap: () {
                    _launchInsms();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.message,
                        size: 30,
                        color: Color.fromARGB(255, 255, 251, 29),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(" message sms  ",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 20,
                              //  fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                InkWell(
                  onTap: () {
                    sendmassegebywhatsapp(
                        "972597205071", "hello , how can i help you ");
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.whatsapp,
                        size: 30,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("wattsap ",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 20,
                              // fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                InkWell(
                  onTap: () {
                    Shareapp();
                  },
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Shareapp();
                        },
                        child: Icon(
                          Icons.share,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      InkWell(
                        onTap: () {
                          Shareapp();
                        },
                        child: Text("share this ap  ",
                            style: TextStyle(
                                fontSize: 20,
                                //fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 24, 23, 24))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
