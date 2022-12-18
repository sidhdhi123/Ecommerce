import 'dart:ui';

import 'package:flutter/material.dart';

class signin extends StatefulWidget {
  const signin({Key? key}) : super(key: key);

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  double container_height = 400;
  bool isvisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30, top: 30, bottom: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  """LOGIN TO MY LV
ACCOUNT""",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                ),
              ),
            ),
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
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(5, 5),
                          blurRadius: 10,
                          spreadRadius: 0.2)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Divider(
                      color: Colors.transparent,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                          text: TextSpan(text: "EMAIL ", children: [
                        WidgetSpan(
                          child: Transform.translate(
                              offset: Offset(0.0, -3.0),
                              child: RichText(
                                // use RichText instead ot Text if you need recognizer on a superscripted text
                                text: TextSpan(
                                  text: "*",
                                ),
                              )),
                        ),
                      ])),
                    ),
                    TextField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: "name@example.com",
                        focusedBorder: OutlineInputBorder(),
                        disabledBorder: OutlineInputBorder(),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                          text: TextSpan(text: "PASSWORD ", children: [
                        WidgetSpan(
                          child: Transform.translate(
                              offset: Offset(0.0, -3.0),
                              child: RichText(
                                // use RichText instead ot Text if you need recognizer on a superscripted text
                                text: TextSpan(
                                  text: "*",
                                ),
                              )),
                        ),
                      ])),
                    ),
                    TextField(
                      obscureText: !isvisible,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(),
                          disabledBorder: OutlineInputBorder(),
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isvisible = !isvisible;
                              });
                            },
                            icon: Icon(
                              (isvisible)
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: Colors.black,
                            ),
                          )),
                    ),
                    Divider(
                      color: Colors.transparent,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Forgot your password?",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.transparent,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 30),
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.black)),
                  child: Text(
                    "SIGN IN",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
