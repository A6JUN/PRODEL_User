import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prodel_user/ui/widget/custom_button.dart';

class RegisterScreeen2 extends StatelessWidget {
  RegisterScreeen2({super.key});
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
                  "PRODEL",
                  style: GoogleFonts.bungeeHairline(
                    textStyle: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
              ),
            ),
            Text("Create your account"),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: TextFormField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255),
                        width: 2.0,
                      ),
                    ),
                    prefixIcon: Icon(Icons.person_outline),
                    filled: true,
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 78, 78, 78)),
                    hintText: "User Name",
                    fillColor: Color.fromARGB(255, 209, 209, 209)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: TextFormField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255),
                        width: 2.0,
                      ),
                    ),
                    prefixIcon: Icon(Icons.phone_android_outlined),
                    filled: true,
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 78, 78, 78)),
                    hintText: "Phone number",
                    fillColor: Color.fromARGB(255, 209, 209, 209)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: TextFormField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255),
                        width: 2.0,
                      ),
                    ),
                    prefixIcon: Icon(Icons.email_outlined),
                    filled: true,
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 78, 78, 78)),
                    hintText: "Email Address",
                    fillColor: Color.fromARGB(255, 209, 209, 209)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 2.0,
                    ),
                  ),
                  prefixIcon: const Icon(Icons.lock_outline),
                  filled: true,
                  suffixIcon: const Icon(Icons.remove_red_eye),
                  hintStyle:
                      const TextStyle(color: Color.fromARGB(255, 78, 78, 78)),
                  hintText: "Password",
                  fillColor: Color.fromARGB(255, 209, 209, 209),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 2.0,
                    ),
                  ),
                  prefixIcon: const Icon(Icons.lock_outline),
                  filled: true,
                  suffixIcon: const Icon(Icons.remove_red_eye),
                  hintStyle:
                      const TextStyle(color: Color.fromARGB(255, 78, 78, 78)),
                  hintText: "Confirm Password",
                  fillColor: Color.fromARGB(255, 209, 209, 209),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: CustomButton(
                label: "REGISTER",
                onPressed: () {},
                color: Color.fromARGB(255, 211, 210, 210),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Already have an account?Login",
              style: GoogleFonts.raleway(),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
