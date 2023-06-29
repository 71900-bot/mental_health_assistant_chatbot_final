import 'package:flutter/material.dart';
import 'package:mental_health_chatbot/Screens/AboutMentalIllness/about_mental_illness.dart';
import 'package:mental_health_chatbot/Screens/GetHelp/get_help.dart';
import 'package:mental_health_chatbot/Screens/SignIn/signin_screen.dart';
import 'package:mental_health_chatbot/Screens/StartEvaluation/start_evaluation.dart';
import 'package:mental_health_chatbot/Screens/ViewPastResult/view_past_result.dart';
import 'package:mental_health_chatbot/constants.dart';

class DashBoard extends StatelessWidget {

  final String info;
  final String message = "Start Evaluation";
  const DashBoard({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(title: const Text('Mental Health Assistant Chatbot'),),
      body:
      Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const Text(
              "About Us",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: defaultPadding * 2),
          RichText(
            text: const TextSpan(
            text: 'Hi, my dear! What are you thinking about?',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black
            ),
      ),
            textAlign: TextAlign.center,
    ),
            const SizedBox(height: defaultPadding / 2),
            Row(
              children: [
                const Spacer(),
                Expanded(
                  flex: 1,
                  child: Image.asset("assets/images/dashboard.png"),
                ),
                const Spacer(),
              ],
            ),
    const SizedBox(height: defaultPadding / 2),
          RichText(
            text: const TextSpan(
            text: 'We are a Mental Health Assistant Chatbot that \nconducts an evaluation test for you based on \nthe DASS-21.',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black
            ),
      ),
            textAlign: TextAlign.center,
    ),
    const SizedBox(height: defaultPadding / 2),
          RichText(
            text: const TextSpan(
            text: 'We are not a counseling or professional \nmental health service.',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black
            ),
          ),
            textAlign: TextAlign.center,
        ),
    const SizedBox(height: defaultPadding / 2),
          RichText(
            text: const TextSpan(
              text: 'We aim to assist you to connect \nwith mental health professionals more efficiently \nat the end of the evaluation.',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black
              ),
            ),
            textAlign: TextAlign.center,
          ),
    const SizedBox(height: defaultPadding / 2),
          RichText(
            text: const TextSpan(
              text: 'We also provide you with self-care guidelines if \nneeded. However, you are advised to always \nseek professional help if possible.',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black
              ),
            ),
            textAlign: TextAlign.center,
          ),
    const SizedBox(height: defaultPadding * 2),
        // Display "Start Evaluation" button
        SizedBox(
          width: 200,
          height: 30,
          child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=>EvaluationScreen(info: info, title: '', defaultMessage: '',),
              ),
            );
          },
          child: Text("Start Evaluation".toUpperCase()),
        ),
        ),
    const SizedBox(height: defaultPadding / 2),
          // Display "View Past Result" button
          SizedBox(
          width: 200,
          height: 30,
          child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=>ViewPastResultScreen(info: info),
              ),
            );
          },
          child: Text("View Past Result".toUpperCase()),
        ),
      ),
    const SizedBox(height: defaultPadding / 2),
        // Display "Get Help" button
        SizedBox(
          width: 200,
          height: 30,
          child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=>GetHelpScreen(info: info),
              ),
            );
          },
          child: Text("Get Help".toUpperCase()),
        ),
        ),
    const SizedBox(height: defaultPadding / 2),
        // Display "About Mental Illness" button
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
          child: Text("About Mental Illness".toUpperCase()),
        ),
        ),
    const SizedBox(height: defaultPadding / 2),
        // Display "Sign Out" button
        SizedBox(
          width: 200,
          height: 30,
          child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=>const SignInScreen(),
              ),
            );
          },
          child: Text("Sign Out".toUpperCase()),
        )
        ),
      ],
        ),
      ),
      // A bottom bar showing the specific user's email
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