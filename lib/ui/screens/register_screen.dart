import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prodel_user/ui/widget/custom_button.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
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
        Text("Login to your account"),
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
                hintStyle: TextStyle(color: Color.fromARGB(255, 78, 78, 78)),
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
        ValueListenableBuilder(
          valueListenable: _checkboxState,
          builder: (context, value, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _checkboxState.value,
                        onChanged: (newCheckboxState) {
                          _checkboxState.value = newCheckboxState!;
                        },
                      ),
                      Text("Remember me"),
                    ],
                  ),
                  TextButton(
                      onPressed: (() {}), child: Text("forgot password ?"))
                ],
              ),
            );
          },
        ),
        SizedBox(
          height: 20,
        ),
        // Padding(
        //   padding: const EdgeInsets.only(left: 100, right: 100),
        //   child: CustomButton(
        //     label: "LOGIN",
        //     onPressed: () {},
        //     color: Color.fromARGB(255, 211, 210, 210),
        //   ),
        // ),
        SizedBox(
          height: 30,
        ),
      ],
    )));
  }
}
