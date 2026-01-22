import 'package:clone_home_twitter/widgets/custom_button.widget.dart';
import 'package:clone_home_twitter/widgets/social_button.widget.dart';
import 'package:flutter/material.dart';

class HomeTwitterPage extends StatelessWidget {
  const HomeTwitterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("assets/images/twitter.png", width: 30, height: 30),
              Text(
                "See what's happening in the world right now",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SocialButton(pathImage: "google", text: "Google"),
              SizedBox(height: 20),
              SocialButton(pathImage: "apple_full", text: "Apple"),
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("or"),
                  ),
                  Expanded(child: Divider(color: Colors.grey)),
                ],
              ),
              SizedBox(height: 5),
              CustomButton(text: "Create account"),
            ],
          ),
        ),
      ),
    );
  }
}
