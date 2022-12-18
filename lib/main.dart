import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fp30/category.dart';
import 'package:fp30/detail.dart';
import 'package:fp30/login.dart';
import 'package:fp30/newac.dart';
import 'package:fp30/otp.dart';
import 'package:fp30/product.dart';
import 'package:fp30/signin.dart';

import 'package:fp30/splash.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//       // options: DefaultFirebaseOptions.currentPlatform,
//       );
//   runApp(MaterialApp(
//     home: product(),
//   ));
// }

void main(){
  runApp(MaterialApp(
    home: category(),
  ));
}
