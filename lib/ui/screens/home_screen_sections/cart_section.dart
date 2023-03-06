import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prodel_user/ui/screens/home_screen_sections/shop_section.dart';

import '../../widget/custom_button.dart';

class CartSection extends StatelessWidget {
  const CartSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: 5,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemBuilder: (BuildContext context, int index) {
              return CartScreenContainer();
            },
          ),
        ),
        Material(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1),
            side: BorderSide(color: Colors.black38, width: 0.5),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Price",
                        style: GoogleFonts.nunitoSans(
                          textStyle:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "₹ 27000",
                        style: GoogleFonts.aBeeZee(
                            textStyle:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: Color.fromARGB(255, 26, 126, 1),
                                      fontWeight: FontWeight.w500,
                                    )),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: CustomButton(
                    label: 'Place Order',
                    color: Color.fromARGB(255, 255, 208, 0),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CartScreenContainer extends StatelessWidget {
  const CartScreenContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: Color.fromARGB(255, 234, 224, 247),
          width: double.infinity,
          height: 300,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Image.asset(
                              "assets/images/mm.png",
                              height: 180,
                              width: 180,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.remove_circle_sharp,
                                size: 20,
                              ),
                              Text("Qty"),
                              Icon(
                                Icons.add_circle_sharp,
                                size: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 28),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Realme TV",
                                  style: GoogleFonts.nunitoSans(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600)),
                              SizedBox(
                                child: Text(
                                  "realme 108cm (43 inch)Ultra HD (4k) LED Smart Android TV",
                                ),
                              ),
                              Icon(
                                Icons
                                    .star_rate, //star aswome rating in pub.dev run in terminal then import then copy paste
                                size: 17,
                                color: Color.fromARGB(255, 255, 154, 3),
                              ),
                              SizedBox(
                                  child: Text("15% off",
                                      style: GoogleFonts.aBeeZee(
                                          fontSize: 17, color: Colors.green))),
                              Text("Rs.27,999",
                                  style: GoogleFonts.aBeeZee(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600)),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 18, right: 18, top: 11),
                                child: CustomButton(
                                  label: "Buy Now",
                                  labelColor: Color.fromARGB(255, 36, 146, 2),
                                  onPressed: () {},
                                  color: Color.fromARGB(255, 249, 250, 247),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 7),
                    child: Text("FROM : Nikshan Electronics",
                        style: GoogleFonts.aBeeZee(
                            fontSize: 17, fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
