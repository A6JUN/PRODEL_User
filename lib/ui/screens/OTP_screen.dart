import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});
  final ValueNotifier<bool> _checkboxState = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  "Enter your 6-digit verification code sent to your number",
                  style: GoogleFonts.jost(
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 130, right: 130),
              child: TextFormField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 165, 41, 41),
                        width: 2.0,
                      ),
                    ),
                    prefixIcon: Icon(Icons.arrow_right_sharp),
                    filled: true,
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 78, 78, 78)),
                    hintText: "PROCEED",
                    fillColor: Color.fromARGB(255, 209, 209, 209)),
              ),
            ),
            SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
