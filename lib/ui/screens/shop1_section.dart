// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:prodel_user/ui/widget/custom_button.dart';

// class Shop1_Section extends StatelessWidget {
//   const Shop1_Section({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final PageController pagecontroll = PageController();
//     return GestureDetector(
//       onTap: () {
//         final currentFocus = FocusScope.of(context);
//         if (!currentFocus.hasPrimaryFocus) {
//           currentFocus.unfocus();
//         }
//       },
//       child: Scaffold(
//         backgroundColor: Color.fromARGB(255, 255, 255, 255),
//         body: ListView(
//           children: [
//             SizedBox(
//               height: 250,
//               child: PageView(controller: pagecontroll, children: [
//                 SizedBox(
//                   height: 200,
//                   width: double.infinity,
//                   child: Center(
//                     child: Stack(
//                       children: [
//                         SizedBox(
//                           width: double.infinity,
//                           child: ClipRRect(
//                             borderRadius: const BorderRadius.only(
//                                 bottomRight: Radius.circular(50),
//                                 bottomLeft: Radius.circular(50)),
//                             child: Image.asset(
//                               "assets/images/CUP1.jpg",
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 60),
//                           child: Center(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   "STARBUCKS",
//                                   style: GoogleFonts.bebasNeue(
//                                       fontSize: 50,
//                                       color:
//                                           Color.fromARGB(255, 246, 252, 247)),
//                                 ),
//                                 Text(
//                                   "My Starbucks. Mine only!",
//                                   style: GoogleFonts.nunitoSans(
//                                       fontSize: 15, color: Colors.white),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                     height: 200,
//                     width: double.infinity,
//                     child: Center(
//                       child: Stack(children: [
//                         SizedBox(
//                           width: double.infinity,
//                           child: ClipRRect(
//                             borderRadius: const BorderRadius.only(
//                                 bottomRight: Radius.circular(50),
//                                 bottomLeft: Radius.circular(50)),
//                             child: Image.asset(
//                               "assets/images/sbc.jpg",
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ]),
//                     )),
//               ]),
//             ),
//             SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: Column(
//                   children: [
//                     CustomStarbuckItem(
//                       titleText: "Frappuccino Drink",
//                       image: "assets/images/cd.png",
//                       subText:
//                           "White chocolate Matcha Starbucks \n Frappuccino Drink",
//                       onTap: () {},
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     CustomStarbuckItem(
//                       titleText: "Dragon Drink",
//                       image: "assets/images/pnk.png",
//                       subText: "Dragon Drink Starbucks Refreshers Beverage",
//                       onTap: () {},
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     CustomStarbuckItem(
//                       titleText: "Frappuccino Drink",
//                       image: "assets/images/burger.png",
//                       subText:
//                           "White chocolate Matcha Starbucks \n Frappuccino Drink",
//                       onTap: () {},
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     CustomStarbuckItem(
//                       titleText: "Frappuccino Drink",
//                       image: "assets/images/pnk.png",
//                       subText:
//                           "White chocolate Matcha Starbucks \n Frappuccino Drink",
//                       onTap: () {},
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     CustomStarbuckItem(
//                       titleText: "Frappuccino Drink",
//                       image: "assets/images/pnk.png",
//                       subText:
//                           "White chocolate Matcha Starbucks \n Frappuccino Drink",
//                       onTap: () {},
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     CustomStarbuckItem(
//                       titleText: "Frappuccino Drink",
//                       image: "assets/images/pnk.png",
//                       subText:
//                           "White chocolate Matcha Starbucks \n Frappuccino Drink",
//                       onTap: () {},
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     CustomStarbuckItem(
//                       titleText: "Frappuccino Drink",
//                       image: "assets/images/pnk.png",
//                       subText:
//                           "White chocolate Matcha Starbucks \n Frappuccino Drink",
//                       onTap: () {},
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     CustomStarbuckItem(
//                       titleText: "Frappuccino Drink",
//                       image: "assets/images/pnk.png",
//                       subText:
//                           "White chocolate Matcha Starbucks \n Frappuccino Drink",
//                       onTap: () {},
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CustomStarbuckItem extends StatelessWidget {
//   final String titleText, subText, image;
//   final Function() onTap;

//   const CustomStarbuckItem({
//     Key? key,
//     required this.titleText,
//     required this.subText,
//     required this.image,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 150,
//       width: double.infinity,
//       child: Material(
//         elevation: 5,
//         child: Padding(
//           padding: const EdgeInsets.only(left: 10, right: 15, top: 10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Image.asset(
//                 image,
//                 scale: 7,
//               ),
//               SizedBox(
//                 width: 5,
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text(titleText,
//                           style: GoogleFonts.oswald(
//                               textStyle:
//                                   Theme.of(context).textTheme.titleLarge)),
//                       Text(
//                         subText,
//                         style: GoogleFonts.robotoCondensed(
//                             textStyle: Theme.of(context).textTheme.labelMedium),
//                       ),
//                       //TODO:ADD RATING
//                     ],
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: SizedBox(
//                     width: 80,
//                     child: CustomButton(
//                       borderRadiusValue: 10,
//                       color: Color.fromARGB(255, 22, 22, 22),
//                       label: "Buy ",
//                       labelColor: Colors.white,
//                       onPressed: onTap,
//                     )),
//               )
//             ],
//           ),
//         ),
//         color: const Color.fromARGB(255, 219, 252, 184),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//           side: const BorderSide(
//               color: Color.fromARGB(255, 249, 250, 249), width: 3),
//         ),
//       ),
//     );
//   }
// }
