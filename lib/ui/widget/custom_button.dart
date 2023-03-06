import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final Color color, labelColor;
  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.labelColor = Colors.black,
    this.color = const Color(0XFFD9D9D9),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
        side: const BorderSide(
          color: Color.fromARGB(255, 201, 195, 195),
          width: 0.0001,
        ),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.button?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: labelColor,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
