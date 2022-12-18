import 'package:flutter/material.dart';
import 'package:fp30/index.dart';
import 'package:fp30/login.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        color: Colors.white,
        child: SizedBox(
          height: 150,
          width: 150,
          child: Image(image: AssetImage("myimage/louisvuitton.png")),
        ),
      ),
    );
  }

  get() async {
    await Future.delayed(Duration(seconds: 2)).then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return login();
      },));
    });
  }
}
