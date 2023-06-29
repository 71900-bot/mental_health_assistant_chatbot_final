import 'package:flutter/material.dart';
import 'package:mental_health_chatbot/constants.dart';

class SelectMedicalHelplines extends StatelessWidget {
  final Function? press;
  const SelectMedicalHelplines({
    Key? key,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: press as void Function()?,
          child: const Text("Medical Helplines",
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        )
      ],
    );
  }
}