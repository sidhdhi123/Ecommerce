import 'dart:math';

import 'package:country_picker/country_picker.dart';
import 'package:email_auth/email_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fp30/category.dart';
import 'package:fp30/otp.dart';
import 'package:fp30/product.dart';
import 'package:fp30/signin.dart';
import 'package:google_sign_in/google_sign_in.dart';

class newac extends StatefulWidget {
  const newac({Key? key}) : super(key: key);

  @override
  State<newac> createState() => _newacState();
}

class _newacState extends State<newac> {
  double container_height = 750;
  bool isvisible = false;

  bool con1 = false;
  bool con2 = false;
  bool con3 = false;
  bool con4 = false;
  bool con5 = false;

  bool isvalid_email = false;
  bool isvalid_password = false;
  bool isFname = false;
  bool isLname = false;
  TextEditingController email = TextEditingController();
  TextEditingController confirmemail = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();

  String title = 'Select Title';
  String country = "Select Country";

  List<String> title_option = [
    'Mr',
    'Mrs',
    'Ms',
    'Mx',
    'Prefer not to say',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    password.addListener(() {
      if (password.text.length >= 8) {
        con1 = true;
      } else {
        con1 = false;
      }
      if (password.text.contains(RegExp(r'[0-9]'))) {
        con2 = true;
      } else {
        con2 = false;
      }
      if (password.text.contains(RegExp(r'[A-Z]'))) {
        con3 = true;
      } else {
        con3 = false;
      }
      if (password.text.contains(RegExp(r'[a-z]'))) {
        con4 = true;
      } else {
        con4 = false;
      }
      if (password.text.contains(RegExp(r'[!#$&()*+,.:;<>=?@^_{|}~]'))) {
        con5 = true;
      } else {
        con5 = false;
      }
      setState(() {});
    });
    firstname.addListener(
      () {
        if (firstname.text.isNotEmpty) {
          isFname = true;
        } else {
          isFname = false;
        }
        setState(() {});
      },
    );
    lastname.addListener(() {
      if (lastname.text.isNotEmpty) {
        isLname = true;
      } else {
        isLname = false;
      }
      setState(() {});
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
                  "LOGIN INFORMATION ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
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
                    Container(
                      padding: EdgeInsets.only(top: 30),
                      alignment: Alignment.centerLeft,
                      child: RichText(
                          text: TextSpan(
                              text: "EMAIL ",
                              style: TextStyle(color: Colors.black),
                              children: [
                            WidgetSpan(
                              child: Transform.translate(
                                  offset: Offset(0.0, -3.0),
                                  child: RichText(
                                    text: TextSpan(
                                      text: "*",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  )),
                            ),
                          ])),
                    ),
                    TextField(
                      controller: email,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: "name@example.com",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                          text: TextSpan(
                              text: "EMAIL CONFIRMATION",
                              style: TextStyle(color: Colors.black),
                              children: [
                            WidgetSpan(
                              child: Transform.translate(
                                  offset: Offset(0.0, -3.0),
                                  child: RichText(
                                    // use RichText instead ot Text if you need recognizer on a superscripted text
                                    text: TextSpan(
                                      text: "*",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  )),
                            ),
                          ])),
                    ),
                    TextField(
                      controller: confirmemail,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: "name@example.com",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                          text: TextSpan(
                              text: "PASSWORD ",
                              style: TextStyle(color: Colors.black),
                              children: [
                            WidgetSpan(
                              child: Transform.translate(
                                  offset: Offset(0.0, -3.0),
                                  child: RichText(
                                    // use RichText instead ot Text if you need recognizer on a superscripted text
                                    text: TextSpan(
                                      text: "*",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  )),
                            ),
                          ])),
                    ),
                    SizedBox(
                      height: 50,
                      child: TextField(
                        controller: password,
                        obscureText: !isvisible,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0)),
                            suffix: Icon(
                              (isvalid_password) ? Icons.check : null,
                              color: Colors.green,
                            ),
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
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: [
                          Text(
                            "Your password must be different from your email and contain:",
                            style: TextStyle(fontSize: 17),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.check,
                              color: (con1) ? Colors.green : null,
                            ),
                            title: Text(
                              "At least 8 characters",
                              style: TextStyle(
                                  color: (con1) ? Colors.green : null),
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.check,
                              color: (con2) ? Colors.green : null,
                            ),
                            title: Text(
                              "At least 1 number",
                              style: TextStyle(
                                  color: (con2) ? Colors.green : null),
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.check,
                              color: (con3) ? Colors.green : null,
                            ),
                            title: Text(
                              "At least 1 capital letter",
                              style: TextStyle(
                                  color: (con3) ? Colors.green : null),
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.check,
                              color: (con4) ? Colors.green : null,
                            ),
                            title: Text(
                              "At least 1 lowercase letter",
                              style: TextStyle(
                                  color: (con4) ? Colors.green : null),
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.check,
                              color: (con5) ? Colors.green : null,
                            ),
                            title: Text(
                              "At least one following special character: ! # \$ & () * + , . : ; < = > ? @  ^ _ { | } ~",
                              style: TextStyle(
                                  color: (con5) ? Colors.green : null),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, left: 30, bottom: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "PERSONAL INFORMATION ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 30, right: 30),
                padding: EdgeInsets.only(left: 30, right: 30),
                height: 500,
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
                          text: TextSpan(
                              text: "TITLE ",
                              style: TextStyle(color: Colors.black),
                              children: [
                            WidgetSpan(
                              child: Transform.translate(
                                  offset: Offset(0.0, -3.0),
                                  child: RichText(
                                    text: TextSpan(
                                      text: "*",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  )),
                            ),
                          ])),
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: Container(
                                height: 400,
                                width: 300,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 60,
                                      child: Center(
                                          child: Text(
                                        "Select Your title",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      )),
                                    ),
                                    StatefulBuilder(
                                      builder: (context, setState1) {
                                        return ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: title_option.length,
                                          itemBuilder: (context, index) {
                                            return ListTile(
                                              onTap: () {},
                                              title: Text(title_option[index]),
                                              trailing: Radio(
                                                activeColor: Colors.black,
                                                value: title_option[index],
                                                groupValue: title,
                                                onChanged: (value) {
                                                  title = value.toString();
                                                  print(title);
                                                  setState1(() {});
                                                  setState(() {});
                                                },
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        height: 50,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${title}"),
                            Icon(Icons.keyboard_arrow_down_outlined)
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                          text: TextSpan(
                              text: "FIRST NAME",
                              style: TextStyle(color: Colors.black),
                              children: [
                            WidgetSpan(
                              child: Transform.translate(
                                  offset: Offset(0.0, -3.0),
                                  child: RichText(
                                    // use RichText instead ot Text if you need recognizer on a superscripted text
                                    text: TextSpan(
                                      text: "*",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  )),
                            ),
                          ])),
                    ),
                    TextField(
                      controller: firstname,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0)),
                          suffixIcon: Icon(
                            (isFname) ? Icons.check : null,
                            color: Colors.black,
                          )),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                          text: TextSpan(
                              text: "LAST NAME ",
                              style: TextStyle(color: Colors.black),
                              children: [
                            WidgetSpan(
                              child: Transform.translate(
                                  offset: Offset(0.0, -3.0),
                                  child: RichText(
                                    // use RichText instead ot Text if you need recognizer on a superscripted text
                                    text: TextSpan(
                                      text: "*",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  )),
                            ),
                          ])),
                    ),
                    TextField(
                      controller: lastname,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0)),
                          suffixIcon: Icon(
                            (isLname) ? Icons.check : null,
                            color: Colors.black,
                          )),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                          text: TextSpan(
                              text: "COUNTRY/REGION ",
                              style: TextStyle(color: Colors.black),
                              children: [
                            WidgetSpan(
                              child: Transform.translate(
                                  offset: Offset(0.0, -3.0),
                                  child: RichText(
                                    // use RichText instead ot Text if you need recognizer on a superscripted text
                                    text: TextSpan(
                                      text: "*",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  )),
                            ),
                          ])),
                    ),
                    InkWell(
                      onTap: () {
                        showCountryPicker(
                          countryListTheme: CountryListThemeData(
                              inputDecoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.black,
                                  ),
                                  focusedBorder: OutlineInputBorder(),
                                  border: OutlineInputBorder())),
                          context: context,
                          onSelect: (Country country1) {
                            setState(() {
                              country = country1.name;
                            });
                            print('Select country: ${country1.name}');
                          },
                        );
                      },
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.only(bottom: 30),
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${country}"),
                            Icon(Icons.keyboard_arrow_down_outlined)
                          ],
                        ),
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
                  if (con1 && con2 && con3 && con4 && con5) {
                    isvalid_password = true;
                  } else {
                    isvalid_password = false;
                  }
                  if (email.text.isNotEmpty && confirmemail.text.isNotEmpty) {
                    if (email.text == confirmemail.text &&
                        EmailValidator.validate(email.text)) {
                      isvalid_email = true;
                    } else {
                      isvalid_email = false;
                    }
                  } else {
                    isvalid_email = false;
                  }
                  if (isvalid_email &&
                      isvalid_password &&
                      isFname &&
                      isLname &&
                      title != "Select Title" &&
                      country != "Select Country") {
                    // sendOtp();
                    signInWithGoogle().then((value) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return category();
                            },
                          ));
                    });
                  } else {
                    print("Something is Missing");
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

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

// void sendOtp() async {
//   EmailAuth  emailAuth = EmailAuth(sessionName: "Sample session");
//
//   bool result =
//       await emailAuth.sendOtp(recipientMail: email.text, otpLength: 5);
//   if (result) {
//     Navigator.pushReplacement(context, MaterialPageRoute(
//       builder: (context) {
//         return otp(email.text, emailAuth);
//       },
//     ));
//   }
// }
}
