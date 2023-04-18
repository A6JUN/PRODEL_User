// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:prodel_user/ui/screens/home_screen_sections/profile_section.dart';

// class PaymentMethod extends StatelessWidget {
//   const PaymentMethod({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//             appBar: AppBar(
//               title: Text(
//                 "Payment Method",
//                 style: GoogleFonts.jost(
//                     textStyle: Theme.of(context).textTheme.bodyMedium,
//                     fontSize: 30,
//                     shadows: <Shadow>[
//                       Shadow(
//                         offset: Offset(3, 2),
//                         blurRadius: 9,
//                         color: Color.fromARGB(136, 0, 0, 0),
//                       ),
//                     ]),
//               ),
//               centerTitle: true,
//               elevation: 0,
//               backgroundColor: Colors.white,
//               leading: IconButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
//               ),
//             ),
//             backgroundColor: Color.fromARGB(255, 255, 255, 255),
//             body: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Select your payment method :",
//                     style: GoogleFonts.jost(fontSize: 21),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 40, right: 200),
//                     child: Text(
//                       "Add a new credit/debit card",
//                       style: GoogleFonts.inter(
//                           fontWeight: FontWeight.normal, fontSize: 15),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 80,
//                     width: double.infinity,
//                     child: Material(
//                         color: Color.fromARGB(255, 214, 214, 213),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                             side: const BorderSide(
//                                 color: Color.fromARGB(255, 247, 245, 245),
//                                 width: .5)),
//                         child: Row(
//                           children: [
//                             Image.asset(
//                               "assets/images/cri.png",
//                               height: 60,
//                               width: 80,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 17),
//                               child: Text("Credit Card",
//                                   style: GoogleFonts.inter(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 15)),
//                             )
//                           ],
//                         )),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   SizedBox(
//                     height: 80,
//                     width: double.infinity,
//                     child: Material(
//                         color: Color.fromARGB(255, 214, 214, 213),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                             side: const BorderSide(
//                                 color: Color.fromARGB(255, 247, 245, 245),
//                                 width: .5)),
//                         child: Row(
//                           children: [
//                             Image.asset(
//                               "assets/images/pe.png",
//                               height: 55,
//                               width: 75,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 17),
//                               child: Text("Phonepe",
//                                   style: GoogleFonts.inter(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 15)),
//                             )
//                           ],
//                         )),
//                   ),
//                   Padding(
//                       padding:
//                           const EdgeInsets.only(left: 15, right: 15, top: 30),
//                       child: Container(
//                         height: 80,
//                         width: double.infinity,
//                         child: Material(
//                             color: Color.fromARGB(255, 214, 214, 213),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20),
//                                 side: const BorderSide(
//                                     color: Color.fromARGB(255, 247, 245, 245),
//                                     width: .5)),
//                             child: Row(
//                               children: [
//                                 Image.asset(
//                                   "assets/images/gp.png",
//                                   height: 50,
//                                   width: 70,
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 17),
//                                   child: Text("Google pay",
//                                       style: GoogleFonts.inter(
//                                           fontWeight: FontWeight.w500,
//                                           fontSize: 15)),
//                                 )
//                               ],
//                             )),
//                       )),
//                   Padding(
//                       padding:
//                           const EdgeInsets.only(left: 15, right: 15, top: 30),
//                       child: Container(
//                         height: 80,
//                         width: double.infinity,
//                         child: Material(
//                             color: Color.fromARGB(255, 214, 214, 213),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20),
//                                 side: const BorderSide(
//                                     color: Color.fromARGB(255, 247, 245, 245),
//                                     width: .5)),
//                             child: Row(
//                               children: [
//                                 Image.asset(
//                                   "assets/images/ap.png",
//                                   height: 60,
//                                   width: 80,
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 17),
//                                   child: Text("Apple pay",
//                                       style: GoogleFonts.inter(
//                                           fontWeight: FontWeight.w500,
//                                           fontSize: 15)),
//                                 )
//                               ],
//                             )),
//                       )),
//                   Padding(
//                       padding:
//                           const EdgeInsets.only(left: 15, right: 15, top: 30),
//                       child: Container(
//                         height: 80,
//                         width: double.infinity,
//                         child: Material(
//                             color: Color.fromARGB(255, 214, 214, 213),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20),
//                                 side: const BorderSide(
//                                     color: Color.fromARGB(255, 247, 245, 245),
//                                     width: .5)),
//                             child: Row(
//                               children: [
//                                 Image.asset(
//                                   "assets/images/cod.png",
//                                   height: 45,
//                                   width: 65,
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 17),
//                                   child: Text("Cash on Delivery",
//                                       style: GoogleFonts.inter(
//                                           fontWeight: FontWeight.w500,
//                                           fontSize: 15)),
//                                 )
//                               ],
//                             )),
//                       ))
//                 ],
//               ),
//             )));
//   }
// }
