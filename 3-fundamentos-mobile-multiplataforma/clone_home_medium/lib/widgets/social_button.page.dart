import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String image;
  final String social;

  const SocialButton({super.key, required this.image, required this.social});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(55),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(55),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Image.asset(image, height: 20),
              ),
            ),
            Center(
              child: Text(
                "Sign up with $social",
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
