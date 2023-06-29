import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mental_health_chatbot/Screens/GetHelp/selection_pages/components/MoodTracker/insert_mood_tracker/insert_mood_screen.dart';
import 'package:mental_health_chatbot/Screens/GetHelp/selection_pages/components/MoodTracker/mood_tracker_history.dart';
import 'package:mental_health_chatbot/Screens/GetHelp/selection_pages/self_care_guidelines.dart';
import 'package:mental_health_chatbot/constants.dart';
import 'package:http/http.dart' as http;

// Create a mood tracker home screen for the app
class MoodTrackerScreen extends StatefulWidget {
  final String info;
  const MoodTrackerScreen({Key? key, required this.info}) : super(key: key);

  @override
  State<MoodTrackerScreen> createState() => _MoodTrackerScreenState();
}

// Hold the state of the MoodTrackerScreen widget
class _MoodTrackerScreenState extends State<MoodTrackerScreen> {

  Future getMoodTrackerData() async {
    var url = 'http://192.168.43.74/mental_health_assistant_chatbot/MoodTracker/moodTrackerHistory.php';
    var response = await http.post(url, body: {
      "email": widget.info
    });
    return json.decode(json.encode(response.body));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(title: const Text('Mental Health Assistant Chatbot'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: defaultPadding * 2),
            const Text(
              "Mood Tracker",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: defaultPadding * 2),
            const Text(
              "How Are You Feeling Today?",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: defaultPadding * 2),
            Row(
              children: [
                const Spacer(),
                Expanded(
                  flex: 8,
                  child: Image.asset("assets/images/emotion.gif"),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: defaultPadding * 2),
            SizedBox(
              width: 200,
              height: 30,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          InsertMoodScreen(info: widget.info),
                    ),
                  );
                },
                child: Text("Add Mood Log Entry".toUpperCase()),
              ),
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
                          builder: (context) =>
                              MoodTrackerHistory(info: widget.info),
                        ),
                      );
                    },
                    child: Text("View History".toUpperCase()),
                  ),
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
                          builder: (context) =>
                              SelfCareGuidelinesScreen(info: widget.info),
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
            Text(" ${widget.info}",
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
