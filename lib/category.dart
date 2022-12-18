import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fp30/Products.dart';
import 'package:fp30/product.dart';
import 'package:http/http.dart' as http;

class category extends StatefulWidget {
  const category({Key? key}) : super(key: key);

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {
  List<String> img = [
    "myimage/electronic.png",
    "myimage/jewelery.png",
    "myimage/man.png",
    "myimage/woman.png"
  ];

  List cat = [];

  List<Products> women = [];
  List<Products> men = [];
  List<Products> electronic = [];
  List<Products> jewelery = [];

  List<Color> col = [
    Colors.orangeAccent,
    Colors.lime,
    Colors.greenAccent,
    Colors.amberAccent
  ];

  Future get() async {
    var url = Uri.parse('https://fakestoreapi.com/products/categories');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    all_product();
    // print(jsonDecode(response.body));
    return jsonDecode(response.body);
  }

  List<Products> p=[];

  all_product() async {
    var url1 = Uri.parse('https://fakestoreapi.com/products');
    var response = await http.get(url1);
    print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    List temp = jsonDecode(response.body);
    temp.forEach((element) {
      p.add(Products.fromJson(element));
    });
    print(p);
    p.forEach((element) {
      if (element.category == "jewelery") {
        jewelery.add(element);
      } else if (element.category == "men's clothing") {
        men.add(element);
      } else if (element.category == "electronics") {
        electronic.add(element);
      } else if (element.category == "women's clothing") {
        women.add(element);
      }
    });
  }

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
      body: FutureBuilder(
        future: get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              cat = snapshot.data as List;
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 30, top: 30, bottom: 30),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        """Categories""",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: ListView.builder(
                        itemCount: cat.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  if (index == 0) {
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(
                                      builder: (context) {
                                        print(electronic);
                                        return product(electronic);
                                      },
                                    ));
                                  } else if (index == 1) {
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(
                                      builder: (context) {
                                        print(jewelery);
                                        return product(jewelery);
                                      },
                                    ));
                                  } else if (index == 2) {
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(
                                      builder: (context) {
                                        print(men);
                                        return product(men);
                                      },
                                    ));
                                  } else {
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(
                                      builder: (context) {
                                        print(women);
                                        return product(women);
                                      },
                                    ));
                                  }
                                },
                                child: Container(
                                  height: 200,
                                  width: 400,
                                  padding: EdgeInsets.only(left: 20),
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    color: col[index],
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.elliptical(150, 150),
                                        bottomLeft: Radius.elliptical(150, 150),
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                  ),
                                  child: Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      image: AssetImage(img[index]),
                                      alignment: Alignment.centerLeft,
                                    )),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text("${cat[index]}")),
                                  ),
                                ),
                              ),
                              Divider(
                                height: 50,
                                color: Colors.transparent,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: Text("No Data Yet"),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
