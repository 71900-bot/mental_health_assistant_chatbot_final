import 'package:flutter/material.dart';
import 'package:mental_health_chatbot/Components/select_causes_of_mental_illness.dart';
import 'package:mental_health_chatbot/Components/select_mental_illness_warning_signs.dart';
import 'package:mental_health_chatbot/Screens/AboutMentalIllness/selection_pages/causes_of_mental_illness.dart';
import 'package:mental_health_chatbot/Screens/AboutMentalIllness/selection_pages/mental_illness_warning_signs.dart';
import 'package:mental_health_chatbot/constants.dart';
import 'package:mental_health_chatbot/dashboard.dart';

// Create an about mental illness screen for the app
class AboutMentalIllnessScreen extends StatelessWidget {

  final String info;
  const AboutMentalIllnessScreen({Key? key, required this.info}) : super(key: key);

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
              "About Mental Illness",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: defaultPadding / 2),
            Row(
              children: [
                const Spacer(),
                Expanded(
                  flex: 2,
                  child: Image.asset("assets/images/mental_illness.png"),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: defaultPadding / 2),
            RichText(
              text: const TextSpan(
                text: "Mental illness is a medical condition that \naffects a person's thoughts, behavior, \nmotivation, feelings, and sense of well-being.",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black
                ),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: defaultPadding / 2),
            RichText(
              text: const TextSpan(
                text: 'Anxiety disorders and mood disorders such \nas depression are examples of common \nmental health illnesses.',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black
                ),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: defaultPadding / 2),
            const Divider(
              height: 50,
              thickness: 5,
            ),
            const Text(
              "Select One Information",
              style: TextStyle(fontSize: 20, decoration: TextDecoration.underline, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: defaultPadding / 2),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                  child: Image.asset(
                    "assets/icons/causes.png",
                    height: 70.0,
                    width: 70.0,
                  ),
                ),
                // Navigate to Causes of Mental Illness Screen
                  SelectCausesOfMentalIllness(
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context)=>CausesOfMentalIllnessScreen(info: info),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Row(children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                  child: Image.asset(
                    "assets/icons/warning_signs.png",
                    height: 70.0,
                    width: 70.0,
                  ),
                ),
                // Navigate to Mental Illness Warning Signs Screen
                  SelectMentalIllnessWarningSigns(
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context)=>MentalIllnessWarningSignsScreen(info: info),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
            const SizedBox(height: defaultPadding / 2),
            SizedBox(
              width: 200,
              height: 30,
              child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context)=>DashBoard(info: info),
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
              EdgeInsets.symmetric(vertical: 8, horizontal: 15),
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

