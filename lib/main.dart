import 'package:flutter/material.dart';
import 'package:prodel_user/ui/screens/Home_Screen.dart';
import 'package:prodel_user/ui/screens/OTP_screen.dart';
import 'package:prodel_user/ui/screens/home_screen_sections/profile_section.dart';
import 'package:prodel_user/ui/screens/myorder_screen.dart';
import 'package:prodel_user/ui/screens/paymentmethod_screen.dart';
import 'package:prodel_user/ui/screens/notification_notification.dart';
import 'package:prodel_user/ui/screens/register_screen.dart';
import 'package:prodel_user/ui/screens/register_screen2.dart';
import 'package:prodel_user/ui/screens/shop1_section.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Shop1_Section(),
    );
  }
}

// git add -A
// git commit -m "Message"
// git push

// connection
// onPressed: () {
  //                Navigator.push(
    //                  context,
      //                MaterialPageRoute(
        //                  builder: (context) => const MyOrderScreen()));