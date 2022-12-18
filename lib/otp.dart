import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:fp30/signin.dart';

class otp extends StatefulWidget {
  String email;
  EmailAuth emailAuth;

  otp(this.email, this.emailAuth);

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  double container_height = 250;
  String email = "";
  TextEditingController otp = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    email = widget.email;
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30, top: 30, bottom: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  """CREATE A NEW
ACCOUNT""",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, bottom: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "ACCOUNT ACTIVATION ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 30, right: 30),
                padding:
                    EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 30),
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
                    Text(
                        "Please enter the activation code you just received by email at ${email} to activate your account.",
                        style: TextStyle(fontSize: 16, letterSpacing: 1)),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                          text: TextSpan(text: "ACTIVATION CODE ", children: [
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
                      controller: otp,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: "ex: 123456",
                        focusedBorder: OutlineInputBorder(),
                        disabledBorder: OutlineInputBorder(),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 30),
              child: InkWell(
                onTap: () {
                  if(verify(otp.text)){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                      return signin();
                    },));
                  }
                },
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.black)),
                  child: Text(
                    "Submit",
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

  bool verify(String otp) {
    return widget.emailAuth.validateOtp(recipientMail: email, userOtp: otp);
  }
}
