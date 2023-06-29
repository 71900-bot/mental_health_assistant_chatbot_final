import 'package:flutter/material.dart';
import 'package:mental_health_chatbot/Screens/AboutMentalIllness/about_mental_illness.dart';

import 'package:mental_health_chatbot/constants.dart';

// Create a mental illness warning signs screen for the app
class MentalIllnessWarningSignsScreen extends StatelessWidget {

  final String info;
  const MentalIllnessWarningSignsScreen({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(title: const Text('Mental Health Assistant Chatbot'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Mental Illness Warning Signs",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: defaultPadding / 2),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
              child: Image.asset(
                "assets/images/mental_illness_warning_signs.png",
              ),
            ),
            Row(children: const [
              Padding(
                padding:
                EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Text('1. ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Text('Prolonged depression such as sadness \nor irritability.',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ]),
            Row(children: const [
              Padding(
                padding:
                EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Text('2. ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Text('Difficulty in thinking.',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ]),
            Row(children: const [
              Padding(
                padding:
                EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Text('3. ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Text('Loss of concentration in activity.',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ]),
            Row(children: const [
              Padding(
                padding:
                EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Text('4. ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Text('Change in eating or sleeping habits.',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ]),
            Row(children: const [
              Padding(
                padding:
                EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Text('5. ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Text('Severe highs and lows in mood.',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ]),
            Row(children: const [
              Padding(
                padding:
                EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Text('6. ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Text('Excessive anxiety, worry, terror and anger.',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ]),
            Row(children: const [
              Padding(
                padding:
                EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Text('7. ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Text('Social isolation.',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ]),
            Row(children: const [
              Padding(
                padding:
                EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Text('8. ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Text('Hallucinations or delusions.',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ]),
            Row(children: const [
              Padding(
                padding:
                EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Text('9. ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Text('Suicidal thoughts.',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ]),
            Row(children: const [
              Padding(
                padding:
                EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Text('10. ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Text('Rejection of clear issues.',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ]),
            Row(children: const [
              Padding(
                padding:
                EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Text('11. ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Text('Several inexplicable physical conditions.',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ]),
            Row(children: const [
              Padding(
                padding:
                EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Text('12. ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Text('Abusing drugs.',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ]),
            const SizedBox(height: defaultPadding / 2),
            SizedBox(
              width: 200,
              height: 30,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=>AboutMentalIllnessScreen(info: info),
                    ),
                  );
                },
                child: Text("Go Back".toUpperCase()),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding:
              EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: Icon(
                Icons.email,
              ),
            ),
            Text(" $info",
                style: const TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)
            )
          ],
        ),
      ),
    ),
    );
  }
}