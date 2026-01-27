import 'package:clone_home_medium/widgets/social_button.page.dart';
import 'package:flutter/material.dart';

class HomeMediumPage extends StatelessWidget {
  const HomeMediumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "assets/images/medium.png",
                height: 55,
                cacheHeight:
                    165, // Otimiza a decodificação para economizar memória
              ),
              Center(
                child: Text(
                  "Join Medium.",
                  style: TextStyle(fontSize: 55, fontFamily: 'PlayfairDisplay'),
                ),
              ),
              SocialButton(image: "assets/images/google.png", social: "Google"),
              SizedBox(height: 15),
              SocialButton(image: "assets/images/email.png", social: "Email"),
            ],
          ),
        ),
      ),
    );
  }
}
