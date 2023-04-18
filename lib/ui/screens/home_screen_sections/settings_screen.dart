import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
            width: double.infinity,
            child: Material(
              color: Color.fromARGB(248, 199, 245, 161),
              elevation: 5,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Image.asset(
                      "assets/images/ll.jpg",
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Millie Bobby",
                        style: GoogleFonts.nunitoSans(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Milliebby69@gamil.com",
                        style: GoogleFonts.nunito(fontSize: 10),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SettingsCard(
                    iconData: Icons.notification_add_outlined,
                    label: "Notification",
                  ),
                  SettingsCard(
                    iconData: Icons.question_mark,
                    label: "Help and Support",
                  ),
                  SettingsCard(
                    iconData: Icons.error_outline_outlined,
                    label: "About",
                  ),
                  SettingsCard(
                    iconData: Icons.person,
                    label: "Account",
                  ),
                  SettingsCard(
                    iconData: Icons.logout,
                    label: "Log Out",
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class SettingsCard extends StatelessWidget {
  final IconData iconData;
  final String label;
  const SettingsCard({
    Key? key,
    required this.iconData,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(iconData),
          Text(
            label,
            style: GoogleFonts.poppins(fontSize: 23),
          ),
        ],
      ),
    );
  }
}
