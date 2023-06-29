import 'package:flutter/material.dart';
import 'package:mental_health_chatbot/constants.dart';

class AcceptTermsOfUse extends StatelessWidget {
  final Function? press;
  const AcceptTermsOfUse({
    Key? key,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text("I have read & accepted ",
          style: TextStyle(color: kPrimaryColor, fontSize: 10),
        ),
        GestureDetector(
          onTap: press as void Function()?,
          child: const Text("ALL the terms and conditions.",
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        )
      ],
    );
  }
}