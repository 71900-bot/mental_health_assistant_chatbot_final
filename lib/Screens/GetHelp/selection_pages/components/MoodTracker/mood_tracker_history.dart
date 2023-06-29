import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mental_health_chatbot/Screens/GetHelp/selection_pages/components/MoodTracker/mood_tracker.dart';
import 'package:mental_health_chatbot/constants.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

// Create a mood tracker history screen for the app that shows all the mood tracker past records
class MoodTrackerHistory extends StatefulWidget {
  final String info;
  const MoodTrackerHistory({Key? key, required this.info}) : super(key: key);

  @override
  State<MoodTrackerHistory> createState() => _MoodTrackerHistoryState();
}


class _MoodTrackerHistoryState extends State<MoodTrackerHistory> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
      home: Scaffold(
      appBar: AppBar(title: const Text('Mental Health Assistant Chatbot'),),
      body:
      Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Mood Tracker History",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: defaultPadding / 2),
            const Text(
              "~ Scroll down to see the latest record ~",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: defaultPadding / 2),
          SizedBox(
          height: 200,
          child: FutureBuilder(
            future: getMoodTrackerDataGridSource(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
            return snapshot.hasData
                ? SfDataGrid(source: snapshot.data, columns: getColumns())
                : const Center(
              child: CircularProgressIndicator(
                strokeWidth: 3,
              ),
            );
          },
      ),
    ),
        const SizedBox(height: defaultPadding / 2),
        Padding(
          padding:
          const EdgeInsets.symmetric(vertical: 0, horizontal: 35),
          child: Image.asset(
            "assets/images/mood.gif",
          ),
        ),
        const SizedBox(height: defaultPadding / 2),
        SizedBox(
          width: 250,
          height: 30,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=>MoodTrackerScreen(info: widget.info),
                ),
              );
            },
            child: Text("Go Back".toUpperCase(), textAlign: TextAlign.center),
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
    ),
    );
  }

  Future<MoodTrackerDataGridSource> getMoodTrackerDataGridSource() async{
    var moodTrackerList = await generateMoodTrackerList();
    return MoodTrackerDataGridSource(moodTrackerList);
  }

  List<GridColumn> getColumns() {
    return <GridColumn>[
      GridColumn(
        columnName: 'Date and Time',
        width: 130,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          decoration: const BoxDecoration(
            color: Colors.lightGreen,
          ),
          child: const Text(
            'Date and Time',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      GridColumn(
        columnName: 'Mood',
        width: 80,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          decoration: const BoxDecoration(
            color: Colors.lightGreen,
          ),
          child: const Text(
            'Mood',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      GridColumn(
        columnName: 'Comment',
        width: 500,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          decoration: const BoxDecoration(
            color: Colors.lightGreen,
          ),
          child: const Text(
            'Comment',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ];
  }
  Future<List<MoodTracker>> generateMoodTrackerList() async{
    var url = "http://192.168.43.74/mental_health_assistant_chatbot/MoodTracker/moodTrackerHistory.php";
    var response = await http.post(url, body: {
      "email": widget.info
    });
    var decodedMoodTracker = json.decode(response.body).cast<Map<String, dynamic>>();
    List<MoodTracker> moodTrackerList = await decodedMoodTracker
        .map<MoodTracker>((json) => MoodTracker.fromJson(json))
    .toList();
    return moodTrackerList;
  }
}

class MoodTrackerDataGridSource extends DataGridSource {
  MoodTrackerDataGridSource(this.moodTrackerList) {
    buildDataGridRow();
  }
  late List<DataGridRow> dataGridRows;
  late List<MoodTracker> moodTrackerList;
  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    // TODO: implement buildRow
    return DataGridRowAdapter(cells: [
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[0].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[1].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[2].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      )
    ]);
  }
  @override
  List<DataGridRow> get rows => dataGridRows;
  void buildDataGridRow(){
    dataGridRows = moodTrackerList.map<DataGridRow>((dataGridRow){
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'Date and Time', value: dataGridRow.date),
        DataGridCell<String>(columnName: 'Mood', value: dataGridRow.mood),
        DataGridCell<String>(columnName: 'Comment', value: dataGridRow.comment),
      ]);
    }).toList(growable: false);
  }
}


class MoodTracker{
  factory MoodTracker.fromJson(Map<String, dynamic> json){
    return MoodTracker(date: json['date'], mood: json['mood'], comment: json['comment']);
  }
  MoodTracker(
  {
    required this.date,
    required this.mood,
    required this.comment,
  });
  final String? date;
  final String? mood;
  final String? comment;
}

