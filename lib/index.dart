import 'package:flutter/material.dart';
import 'package:fp30/login.dart';

class index extends StatefulWidget {
  const index({Key? key}) : super(key: key);

  @override
  State<index> createState() => _indexState();
}

class _indexState extends State<index> {
  String selected = "";
  List<bool> isopen = List.filled(6, false);
  List<String> continents = [
    "AMERICAS",
    "EUROPE",
    "ASIA",
    "OCEANIA",
    "MIDDLE EAST",
    "OTHER COUNTRIES"
  ];
  List<List<String>> country = [
    ["USA", "Brazil", "Canada", "Mexico"],
    [
      "Belgium",
      "Denmark",
      "Deutschland",
      "France",
      "Ireland",
      "Italia",
      "Luxembourg",
      "Monaco",
      "Nederland",
      "Austria",
      "Suomi",
      "Sweden",
      "United Kingdom"
    ],
    [
      "India",
      "Malaysia",
      "China",
      "Japan",
      "Korea",
      "Pakistan",
      "Bangladesh",
      "Thailand"
    ],
    ["Australia", "New Zealand"],
    ["UAE", "Taliban", "Oman"],
    ["International"]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return login();
                    },
                  ));
                },
                icon: Icon(
                  Icons.done,
                  color: Colors.black,
                ))
          ],
          title: Text(
            "Choose your country/region",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
            color: Colors.white,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 13.0, right: 13.0, bottom: 25.0),
              shrinkWrap: true,
              itemCount: continents.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.only(top: 20),
                  child: ExpansionTile(
                    onExpansionChanged: (value) {
                      setState(() {
                        isopen[index] = value;
                      });
                    },
                    trailing: Icon(
                      (isopen[index]) ? Icons.remove : Icons.add,
                      color: Colors.black,
                    ),
                    // key: Key(index.toString()),
                    title: Text('${continents[index]}',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold)),
                    children: [
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: country[index].length,
                        itemBuilder: (context, index1) {
                          return ListTile(
                            onTap: () {
                              selected = country[index][index1];

                              print(selected);
                            },
                            subtitle: Divider(
                              color: Colors.transparent,
                            ),
                            title: Row(
                              children: [
                                Expanded(
                                    child: Align(
                                        alignment: Alignment.center,
                                        child:
                                            Icon(Icons.shopping_bag_outlined))),
                                Expanded(
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child:
                                            Text("${country[index][index1]}"))),
                              ],
                            ),
                          );
                        },
                      )
                    ],
                  ),
                );
              },
            )));
  }
}
