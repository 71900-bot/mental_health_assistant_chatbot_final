import 'package:flutter/material.dart'; // Build Material Design apps with Flutter
import 'package:mental_health_chatbot/Components/background.dart'; // Provide a background for the app
import 'package:mental_health_chatbot/Screens/SignIn/components/signin_form.dart'; // Provide a form for signing in
import 'package:mental_health_chatbot/Screens/SignIn/components/signin_screen_top_image.dart'; // Provide an image for the sign-in screen
import 'package:mental_health_chatbot/responsive.dart'; // Provide a responsive layout for the app

// Create a sign-in screen for the app
class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: const MobileLoginScreen(),
          desktop: Row(
            children: [
              const Expanded(
                child: SignInScreenTopImage(),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 450,
                      child: SignInForm(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Creates the sign-in screen for mobile devices
class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SignInScreenTopImage(),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: SignInForm(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}