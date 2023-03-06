import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopSection extends StatelessWidget {
  const ShopSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController pagecontroll = PageController();
    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: ListView(
          children: [
            SizedBox(
              height: 200,
              child: PageView(
                controller: pagecontroll,
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    color: Color.fromARGB(255, 255, 187, 0),
                    child: Center(
                      child: Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Image.asset(
                              "assets/images/gg.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "up to 70% off",
                                  style: GoogleFonts.bebasNeue(
                                      fontSize: 50, color: Colors.white),
                                ),
                                Text(
                                  "Get special discount",
                                  style: GoogleFonts.nunitoSans(
                                      fontSize: 15, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.red,
                      child: Center(
                        child: Stack(children: [
                          SizedBox(
                            width: double.infinity,
                            child: Image.asset(
                              "assets/images/pp.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "up to 90% off",
                                  style: GoogleFonts.bebasNeue(
                                      fontSize: 50, color: Colors.white),
                                ),
                                Text(
                                  "On Groceries Online",
                                  style: GoogleFonts.nunitoSans(
                                      fontSize: 18, color: Colors.white),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 40),
                                  child: Text(
                                    "SHOP NOW",
                                    style: GoogleFonts.raleway(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ]),
                      )),
                  Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.green,
                      child: Center(
                          child: Stack(children: [
                        SizedBox(
                          width: double.infinity,
                          child: Image.asset(
                            "assets/images/kk.jpg", //upload pic
                            fit: BoxFit.cover,
                          ),
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "today deals ",
                                style: GoogleFonts.bebasNeue(
                                    fontSize: 50, color: Colors.white),
                              ),
                              Text(
                                "Elegant Furniture Deals",
                                style: GoogleFonts.nunitoSans(
                                    fontSize: 18, color: Colors.white),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: Text(
                                  "ORDER NOW",
                                  style: GoogleFonts.raleway(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700),
                                ),
                              )
                            ],
                          ),
                        ),
                      ]))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  hintText: "search",
                  hintStyle: GoogleFonts.nunitoSans(
                    textStyle: Theme.of(context).textTheme.titleLarge,
                  ),
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Color.fromARGB(255, 221, 221, 221),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 90,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context, index) => Container(
                  color: Color.fromARGB(255, 134, 148, 123),
                  height: 80,
                  width: 90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.restaurant,
                        color: Color.fromARGB(255, 254, 255, 255),
                      ),
                      Text(
                        "Resturant",
                        style: GoogleFonts.nunitoSans(color: Colors.white),
                      )
                    ],
                  ),
                ),
                itemCount: 10,
                separatorBuilder: (context, index) => SizedBox(
                  width: 10,
                ),
              ),
            ),
            HomeScreenGrid(
              bottomSize: 100,
              leftSize: 20,
              rightSize: 20,
              topSize: 20,
              child: HomeScreenContainer(),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreenGrid extends StatelessWidget {
  HomeScreenGrid({
    super.key,
    required this.topSize,
    required this.bottomSize,
    required this.leftSize,
    required this.rightSize,
    required this.child,
  });
  final double topSize;
  final double bottomSize;
  final double leftSize;
  final double rightSize;

  Widget child;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 20.0,
      crossAxisSpacing: 16,
      padding: EdgeInsets.only(
        top: topSize,
        bottom: bottomSize,
        left: leftSize,
        right: rightSize,
      ),
      children: List.generate(10, (index) => child),
    );
  }
}

class HomeScreenContainer extends StatelessWidget {
  const HomeScreenContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromARGB(255, 156, 187, 160),
      borderRadius: BorderRadius.circular(20),
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset(
                "assets/images/starbucks-coffee-png-19.png",
                height: 100,
                width: 100,
              ),
            ),
          ),
          Center(
            child: Text(
              "STARBUCKS",
              style: GoogleFonts.bebasNeue(fontSize: 17),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 10,
                  color: Color.fromARGB(255, 252, 30, 1),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: Text(
                    "Kannur,Kerala",
                    style: GoogleFonts.nunitoSans(fontSize: 10),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 36),
                  child: Text(
                    "DELIVERY",
                    style: GoogleFonts.nunitoSans(
                        fontSize: 8, color: Color.fromARGB(255, 57, 128, 59)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Icon(
                  Icons.stars_rounded,
                  color: Color.fromARGB(255, 248, 232, 2),
                  size: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child:
                      Text("4.5", style: GoogleFonts.nunitoSans(fontSize: 10)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80),
                  child: Text(
                    "PREORDER",
                    style: GoogleFonts.nunitoSans(
                        fontSize: 8, color: Color.fromARGB(255, 57, 128, 59)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Icon(
                  Icons.access_time_outlined,
                  size: 10,
                  color: Color.fromARGB(255, 14, 119, 15),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: Text(
                    "10am - 8pm",
                    style: GoogleFonts.nunitoSans(fontSize: 10),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: Text(
                    "(Open Now)",
                    style: GoogleFonts.nunitoSans(
                        fontSize: 7, color: Color.fromARGB(255, 36, 77, 37)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
