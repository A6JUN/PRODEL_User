import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prodel_user/ui/widget/myorder_widget.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "My Orders",
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
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.white,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
              ),
            ),
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            body: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: MyOrder(
                    image: 'assets/images/nut.png',
                    quantity: '1',
                    subtitle: 'nutella CHOCOLATE SPREAD 750gm 750 g',
                    title: 'Delivered on jan 7,2023',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: MyOrder(
                    image: 'assets/images/wp.png',
                    quantity: '1',
                    subtitle: 'Surf excel Detergant Detergent Powder 1000 g',
                    title: 'Delivered on feb 17,2023',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: MyOrder(
                    image: 'assets/images/book.jpg',
                    quantity: '4',
                    subtitle:
                        'ANTIQUE LEATHER STORE  A5 Diary Un-ruled 80 Pages  (Black)',
                    title: 'Refund completed',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: MyOrder(
                    image: 'assets/images/nut.png',
                    quantity: '1',
                    subtitle: 'nutella CHOCOLATE SPREAD 750gm 750 g',
                    title: 'Delivered on jan 7,2023',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: MyOrder(
                    image: 'assets/images/nut.png',
                    quantity: '1',
                    subtitle: 'nutella CHOCOLATE SPREAD 750gm 750 g',
                    title: 'Delivered on jan 7,2023',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: MyOrder(
                    image: 'assets/images/nut.png',
                    quantity: '1',
                    subtitle: 'nutella CHOCOLATE SPREAD 750gm 750 g',
                    title: 'Delivered on jan 7,2023',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: MyOrder(
                    image: 'assets/images/nut.png',
                    quantity: '1',
                    subtitle: 'nutella CHOCOLATE SPREAD 750gm 750 g',
                    title: 'Delivered on jan 7,2023',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: MyOrder(
                    image: 'assets/images/nut.png',
                    quantity: '1',
                    subtitle: 'nutella CHOCOLATE SPREAD 750gm 750 g',
                    title: 'Delivered on jan 7,2023',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: MyOrder(
                    image: 'assets/images/nut.png',
                    quantity: '1',
                    subtitle: 'nutella CHOCOLATE SPREAD 750gm 750 g',
                    title: 'Delivered on jan 7,2023',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: MyOrder(
                    image: 'assets/images/nut.png',
                    quantity: '1',
                    subtitle: 'nutella CHOCOLATE SPREAD 750gm 750 g',
                    title: 'Delivered on jan 7,2023',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                // MyOrder(),
                // SizedBox(
                //   height: 30,
                // ),
                // MyOrder(),
                // SizedBox(
                //   height: 30,
                // ),
                // MyOrder(),
                // SizedBox(
                //   height: 30,
                // ),
                // MyOrder(),
                // SizedBox(
                //   height: 30,
                // ),
                // MyOrder(),
                // SizedBox(
                //   height: 30,
                // ),
                // MyOrder(),
                // SizedBox(
                //   height: 30,
                // ),
                // MyOrder(),
                // SizedBox(
                //   height: 30,
                // ),
                // MyOrder(),
                // SizedBox(
                //   height: 30,
                // ),
                // MyOrder(),
              ]),
            )));
  }
}
