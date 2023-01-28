import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 253, 253),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 50,
          ),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                shape: BoxShape.circle,
                color: Colors.white,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/profile.jpg"),
                ),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      color: Color.fromARGB(255, 255, 254, 254)),
                ]),
          ),
        ),
        SizedBox(height: 15),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Center(
              child: Text(
                "Millie Bobby ",
                style: GoogleFonts.jost(
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                    fontSize: 17,
                    color: Color.fromARGB(255, 92, 92, 92)),
              ),
            )),
        Material(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Name:",
                    style: GoogleFonts.comfortaa(),
                  ),
                ],
              )
            ],
          ),
        )
      ]),
    ));
  }
}
