import 'package:flutter/material.dart';
import '../../../constants.dart'; // Contain some constants used in the app

// Provide an image for the sign-in screen
class SignInScreenTopImage extends StatelessWidget {
  const SignInScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Display the text "SIGN IN"
        const Text(
          "SIGN IN",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: defaultPadding * 2),
        Row(
          children: [
            const Spacer(),
            // Display an image named "login_page.png" from the "assets/icons" directory
            Expanded(
              flex: 3,
              child: Image.asset("assets/icons/login_page.png"),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}