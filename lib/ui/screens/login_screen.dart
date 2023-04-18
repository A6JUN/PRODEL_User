import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:prodel_user/ui/widget/branding.dart';

import '../widget/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              child: Branding(),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 80,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Already have an account ?",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
