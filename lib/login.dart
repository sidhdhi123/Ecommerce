import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fp30/newac.dart';
import 'package:fp30/signin.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  double container_height = 400;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade200,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "MY",
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
                height: 25,
                width: 25,
                child: Image(image: AssetImage("myimage/lv_logo.png"))),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 30, right: 30),
              padding: EdgeInsets.only(left: 30, right: 30),
              height: container_height,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(5, 5), blurRadius: 10, spreadRadius: 0.2)
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("WELCOME TO MY LV",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                  Text("""Please log in to your MY LV or 
   create a MY LV account"""),
                  SizedBox(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(
                              builder: (context) {
                                return signin();
                              },
                            ));
                          },
                          child: Container(
                            height: 50,
                            alignment: Alignment.center,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border.all(color: Colors.black)),
                            child: Text(
                              "Sign in",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.transparent,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return newac();
                              },
                            ));
                          },
                          child: Container(
                            height: 50,
                            alignment: Alignment.center,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: Text("Create an account"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20))),
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 400,
                            child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20))),
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "MY LV BENEFITS",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: Icon(Icons.close))
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 320,
                                  color: Colors.blueGrey,
                                  padding: EdgeInsets.only(
                                      left: 10, top: 10, right: 10, bottom: 10),
                                  child: GridView(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 10,
                                              mainAxisSpacing: 10),
                                      children: [
                                        Container(
                                          color: Colors.white,
                                          alignment: Alignment.center,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.person_outline_outlined,
                                                size: 50,
                                              ),
                                              Text("Manage your personal"),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: Colors.white,
                                          alignment: Alignment.center,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.mail_outline_outlined,
                                                size: 50,
                                              ),
                                              Text(
                                                  "Receive Louis Vuitton Digital"),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: Colors.white,
                                          alignment: Alignment.center,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.favorite_outline_outlined,
                                                size: 50,
                                              ),
                                              Text("Create your wishlist"),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: Colors.white,
                                          alignment: Alignment.center,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.access_time,
                                                size: 50,
                                              ),
                                              Text(
                                                  "Access your purchase history"),
                                            ],
                                          ),
                                        ),
                                      ]),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Text(
                      "Discover Account Benefits",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
