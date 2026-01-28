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
                height: 40,
                cacheHeight:
                    165, // Otimiza a decodificação para economizar memória
                key: ValueKey("imageMedium"),
              ),
              SizedBox(height: 60),
              Center(
                child: Text(
                  "Join Medium.",
                  style: TextStyle(fontSize: 45, fontFamily: 'PlayfairDisplay'),
                  key: ValueKey("textTitle"),
                ),
              ),
              SizedBox(height: 30),
              SocialButton(
                image: "assets/images/google.png",
                social: "Google",
                key: ValueKey("signupGoogle"),
              ),
              SizedBox(height: 15),
              SocialButton(
                image: "assets/images/email.png",
                social: "Email",
                key: ValueKey("signupEmail"),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    key: ValueKey("dividerLeft"),
                    child: Divider(color: Colors.black),
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
                    child: Text(
                      "Or, sign up with",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                  Expanded(
                    key: ValueKey("dividerRight"),
                    child: Divider(color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 30),
              InkWell(
                key: ValueKey("buttonFacebook"),
                onTap: () {},
                customBorder: CircleBorder(),
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset("assets/images/facebook.png", height: 25),
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account?",
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: " Sign in",
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "By signing up, you agree to our ",
                    style: TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                        text: "Terms of Service ",
                        style: TextStyle(
                          color: Colors.green,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(text: "and acknowledge that our "),
                      TextSpan(
                        text: "Privacy Policy ",
                        style: TextStyle(
                          color: Colors.green,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(text: "applies to you."),
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
