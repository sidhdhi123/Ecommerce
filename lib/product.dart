import 'package:flutter/material.dart';
import 'package:fp30/Products.dart';
import 'package:fp30/detail.dart';

class product extends StatefulWidget {
  List<Products> items;
  product(this.items);


  @override
  State<product> createState() => _productState();
}

class _productState extends State<product> {
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
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30, top: 30, bottom: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Product",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return detail(index,widget.items);
                    },));
                  },
                  child: Container(
                    height: 200,
                    width: 200,
                    margin: EdgeInsets.only(bottom: 30, left: 40, right: 40),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                              onPressed: () {}, icon: Icon(Icons.bookmark)),
                        ),
                        Image(
                            height: 120,
                            width: 120,
                            image: NetworkImage(widget.items[index].image.toString())),
                        Text("${widget.items[index].title}",maxLines: 1,),
                        Text("${widget.items[index].price}"),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
