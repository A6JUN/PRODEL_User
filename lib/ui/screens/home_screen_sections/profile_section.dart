import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prodel_user/ui/screens/myorder_screen.dart';
import 'package:prodel_user/ui/screens/paymentmethod_screen.dart';

import '../../widget/custom_button.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 50,
          ),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 252, 253, 252)),
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 255, 255, 255),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/bb.jpg"),
                ),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 15,
                      color: Color.fromARGB(153, 248, 248, 247)),
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
                    fontSize: 18,
                    color: Color.fromARGB(255, 14, 13, 13)),
              ),
            )),
        SizedBox(
          height: 270,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                      color: Color.fromARGB(255, 17, 17, 17), width: 1)),
              color: Color.fromARGB(255, 237, 238, 237),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Name :", style: GoogleFonts.nunitoSans(fontSize: 17)),
                    Text("Phone Number :",
                        style: GoogleFonts.nunitoSans(fontSize: 17)),
                    Text("E-mail :",
                        style: GoogleFonts.nunitoSans(fontSize: 17)),
                    Text("Address :",
                        style: GoogleFonts.nunitoSans(fontSize: 17)),
                    Text("Pin Code :",
                        style: GoogleFonts.nunitoSans(fontSize: 17))
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 90,
          width: 300,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Expanded(
              child: CustomButton(
                label: 'Payment Method',
                color: Color.fromARGB(255, 203, 243, 128),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentMethod()));
                },
              ),
            ),
          ),
        ),
        SizedBox(
          height: 90,
          width: 300,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Expanded(
              child: CustomButton(
                label: 'My Orders',
                color: Color.fromARGB(255, 203, 243, 128),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyOrderScreen()));
                },
              ),
            ),
          ),
        ),
      ]),
    ));
  }
}
