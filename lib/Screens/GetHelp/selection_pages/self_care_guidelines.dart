import 'package:flutter/material.dart';
import 'package:mental_health_chatbot/Screens/GetHelp/selection_pages/components/MoodTracker/mood_tracker.dart';
import 'package:mental_health_chatbot/Screens/GetHelp/get_help.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mental_health_chatbot/constants.dart';

// Create a self-care guidelines screen for the app
class SelfCareGuidelinesScreen extends StatelessWidget {

  final String info;
  const SelfCareGuidelinesScreen({Key? key, required this.info}) : super(key: key);

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
              "Self-Care Guidelines",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: defaultPadding * 2),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
              child: Image.asset(
                "assets/images/self_care_guidelines.png",
              ),
            ),
            const SizedBox(height: defaultPadding * 2),
            Row(children: const [
              Padding(
                padding:
                EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Text('1. ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Text('Exercise. Every day, go for a 15- to \n30-minute brisk walk.',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ]),
            Row(children: const [
              Padding(
                padding:
                EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Text('2. ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Text('Consume nutritious foods and plenty of \nwater.',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ]),
            Row(children: const [
              Padding(
                padding:
                EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Text('3. ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Text('Practice enough sleep every night.',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ]),
            Row(children: const [
              Padding(
                padding:
                EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Text('4. ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Text('Sign off early from work or cancel social \nplans to rest.',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ]),
            Row(children: const [
              Padding(
                padding:
                EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Text('5. ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Text('Spend time journaling to better understand \nyour emotions.',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ]),
            Row(children: const [
              Padding(
                padding:
                EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Text('6. ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Text('Practice yoga or other mindful exercises \nthat help you reconnect with yourself.',
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
              Text('Practice a hobby such as drawing, baking, \ndancing and so on.',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ]),
            const SizedBox(height: defaultPadding / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              SizedBox(
                width: 95,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    const url = 'https://www.googleadservices.com/pagead/aclk?sa=L&ai=DChcSEwiGy5_3urf-AhVSmWYCHe1-Bd0YABABGgJzbQ&ohost=www.google.com&cid=CAESa-D2WW5HGa5NLDQvI3lS3QtiPWvCvEAr3ay-OHmt2HZUdUvFFzYHt7OLsJGvjyBmLIS7DTmdvJa2HOpzwPjo8elltI3UT54_ebMrFjktzMSc8cgSENSolYFwmFcLpSqycFswklW2NM9V6P4v&sig=AOD64_1Ti-0MmWKOdg1A9NLkGszKVlExaA&q&adurl&ved=2ahUKEwi5_5j3urf-AhWO6jgGHaqCDVkQ0Qx6BAgJEAE';
                    if (await canLaunch(url)) {
                      await launch(Uri.parse(url).toString());
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Text("Play Game".toUpperCase(), textAlign: TextAlign.center),
                ),
              ),
                const SizedBox(
                  width: 10,
                ),
              SizedBox(
                width: 95,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context)=>MoodTrackerScreen(info: info),
                      ),
                    );
                  },
                  child: Text("Mood Tracker".toUpperCase(), textAlign: TextAlign.center),
                ),
              ),
                const SizedBox(
                  width: 10,
                ),
              SizedBox(
                width: 95,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context)=>GetHelpScreen(info: info),
                      ),
                    );
                  },
                  child: Text("Go Back".toUpperCase(), textAlign: TextAlign.center),
                ),
              ),
            ]),
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