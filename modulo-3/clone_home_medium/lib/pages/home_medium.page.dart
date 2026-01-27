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
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.black)),
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
                    child: Text(
                      "Or, sign up with",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.black)),
                ],
              ),
              SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  shape: BoxShape.circle,
                ),
                child: Image.asset("assets/images/facebook.png", height: 35),
              ),
              SizedBox(height: 30),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account?",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    children: [
                      TextSpan(
                        text: " Sign in",
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
