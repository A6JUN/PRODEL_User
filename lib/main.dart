import 'package:flutter/material.dart';
import 'package:prodel_user/ui/screens/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://pprklkrcyqnhjrukxuhq.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBwcmtsa3JjeXFuaGpydWt4dWhxIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3ODc5MjQwNSwiZXhwIjoxOTk0MzY4NDA1fQ.1cxsjPil4_8q319xKcQnQxtFxRDZznSispolD0RYmLk',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PRODEL App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        inputDecorationTheme: InputDecorationTheme(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          fillColor: Colors.yellow[50],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.yellow[900]!,
              width: 0.5,
            ),
          ),
        ),
      ),
      home: const LoginScreen(),
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