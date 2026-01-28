import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  const CustomButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Material(
        color: Colors.black,
        borderRadius: BorderRadius.circular(55),
        child: InkWell(
          onTap: () {},
          // splashColor: Colors.white,
          borderRadius: BorderRadius.circular(55),
          child: Align(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
