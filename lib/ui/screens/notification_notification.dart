import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          Center(
            child: Text(
              "Notifications",
              style: GoogleFonts.jost(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                  fontSize: 30,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(3, 2),
                      blurRadius: 9,
                      color: Color.fromARGB(136, 0, 0, 0),
                    ),
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 20),
            child: Container(
              height: 60,
              width: 385,
              child: Material(
                color: Color.fromARGB(255, 229, 230, 227),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 252, 250, 250), width: .5)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Icon(Icons.message),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text("Offers Avilable"),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              height: 60,
              width: 385,
              child: Material(
                color: Color.fromARGB(255, 229, 230, 227),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 252, 250, 250), width: .5)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Icon(Icons.message),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text("Offers Avilable"),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 60,
            width: 385,
            child: Material(
              color: Color.fromARGB(255, 229, 230, 227),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                      color: Color.fromARGB(255, 252, 250, 250), width: .5)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(Icons.message),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text("Offers Avilable"),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
