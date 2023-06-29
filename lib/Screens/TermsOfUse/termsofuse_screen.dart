import 'package:flutter/material.dart';
import 'package:mental_health_chatbot/Components/background.dart';
import 'package:mental_health_chatbot/Screens/TermsOfUse/components/termsofuse.dart';
import 'package:mental_health_chatbot/responsive.dart';

// Create a terms of use screen for the app
class TermsOfUseScreen extends StatelessWidget {
  const TermsOfUseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: const MobileTermsOfUseScreen(),
          desktop: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 450,
                      child: TermsOfUse(),
                    ),
                    // SocialSignUp()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Creates a terms of use screen for mobile devices
class MobileTermsOfUseScreen extends StatelessWidget {
  const MobileTermsOfUseScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: TermsOfUse(),
            ),
            Spacer(),
          ],
        ),
        // const SocialSignUp()
      ],
    );
  }
}