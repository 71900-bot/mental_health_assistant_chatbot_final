import 'package:flutter/material.dart';
import 'package:mental_health_chatbot/Components/select_medical_helplines.dart';
import 'package:mental_health_chatbot/Components/select_self_care_guidelines.dart';
import 'package:mental_health_chatbot/Screens/GetHelp/selection_pages/medical_helplines.dart';
import 'package:mental_health_chatbot/Screens/GetHelp/selection_pages/self_care_guidelines.dart';
import 'package:mental_health_chatbot/constants.dart';
import 'package:mental_health_chatbot/dashboard.dart';

// Create a get help home screen for the app
class GetHelpScreen extends StatelessWidget {

  final String info;
  const GetHelpScreen({Key? key, required this.info}) : super(key: key);

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
              "Get Help",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: defaultPadding / 2),
            Row(
              children: [
                const Spacer(),
                Expanded(
                  flex: 1,
                  child: Image.asset("assets/images/chatbot.png"),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: defaultPadding / 2),
            RichText(
              text: const TextSpan(
                text: "Don't worry, I am always staying beside you. :) \nNow, let me give you some advice.",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black
                ),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: defaultPadding / 2),
            RichText(
              text: const TextSpan(
                text: "If all three scales are under 'Normal' or 'Mild', \nyou can choose the 'Self-Practice' action to \npractice some examples of self-care.",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black
                ),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: defaultPadding / 2),
            RichText(
              text: const TextSpan(
                text: "If any of your three scales is under 'Moderate', \n'Severe' or 'Extremely Severe', you should choose \n'Helpline' to contact the professional mental \nhealth services for immediate assistance.",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black
                ),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: defaultPadding / 2),
            RichText(
              text: const TextSpan(
                text: "However, the result of DASS-21 is only for \nreference. You are advised to always consult \nmental health professionals if possible.",
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
                      "assets/icons/self_care.png",
                      height: 50.0,
                      width: 50.0,
                    ),
                  ),
                  // Navigate to Self-Care Guidelines Screen
                  SelectSelfCareGuidelines(
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context)=>SelfCareGuidelinesScreen(info: info),
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
                      "assets/icons/helpline.png",
                      height: 50.0,
                      width: 50.0,
                    ),
                  ),
                  // Navigate to Medical Helplines Screen
                  SelectMedicalHelplines(
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context)=>MedicalHelplinesScreen(info: info),
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

