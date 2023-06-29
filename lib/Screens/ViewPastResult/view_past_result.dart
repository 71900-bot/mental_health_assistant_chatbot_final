import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mental_health_chatbot/Screens/ViewDASS_21ScoringGuidelines/view_dass_21_scoring_guidelines.dart';
import 'package:mental_health_chatbot/constants.dart';
import 'package:mental_health_chatbot/dashboard.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

// Create a view past result screen for the app that allows user to view the past evaluation scores
class ViewPastResultScreen extends StatefulWidget {
  final String info;
  const ViewPastResultScreen({Key? key, required this.info}) : super(key: key);

  @override
  State<ViewPastResultScreen> createState() => _ViewPastResultState();
}

// Hold the state of the ViewPastResultScreen widget
class _ViewPastResultState extends State<ViewPastResultScreen> {
  String _quote = '';
  String _author = '';

  @override
  void initState() {
    super.initState();
    _fetchDailyQuote();
  }

  Future<void> _fetchDailyQuote() async {
    final response = await http.get(Uri.parse('https://type.fit/api/quotes'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final quotes = json as List;
      final randomIndex = Random().nextInt(quotes.length); // Generate a random index
      final quote = quotes[randomIndex]; // Get the quote object at the random index

      setState(() {
        _quote = quote['text'];
        _author = quote['author'];
      });
    } else {
      throw Exception('Failed to fetch daily quote');
    }
  }

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
              "Past Psychometric Evaluation Result",
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
            future: getViewPastResultDataGridSource(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
              return snapshot.hasData
                  ? SfDataGrid(source: snapshot.data, columns: getColumns())
                  : const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                ),
              );
            }
        ),
        ),
              const Divider(
                height: 10,
                thickness: 5,
              ),
              const SizedBox(height: defaultPadding / 2),
              const Text(
                "Quote of the Day",
                style: TextStyle(fontSize: 20, decoration: TextDecoration.underline, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: defaultPadding / 2),
              if (_quote.isNotEmpty)
              SizedBox(
                height: 150,
                child:  Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _quote,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              if (_author.isNotEmpty)
                SizedBox(
                  height: 20,
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      '- $_author',
                      textAlign: TextAlign.end,
                      style: const TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              if (_quote.isEmpty && _author.isEmpty)
                const Center(child: CircularProgressIndicator()),
          const SizedBox(height: defaultPadding * 2),
          SizedBox(
            width: 250,
            height: 30,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context)=>ViewDASS21ScoringGuidelinesScreen(info: widget.info),
                  ),
                );
              },
              child: Text("View DASS-21 Scoring Guide".toUpperCase(), textAlign: TextAlign.center),
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
                        builder: (context)=>DashBoard(info: widget.info),
                      ),
                    );
                  },
                  child: Text("Go Back".toUpperCase(), textAlign: TextAlign.center),
                ),
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

  Future<ViewPastResultDataGridSource> getViewPastResultDataGridSource() async{
    var viewPastResultList = await generateViewPastResultList();
    return ViewPastResultDataGridSource(viewPastResultList);
  }

  List<GridColumn> getColumns(){
    return <GridColumn>[
      GridColumn(
        columnName: 'Date and Time',
        width: 130,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          decoration: const BoxDecoration(
            color: Colors.redAccent,
          ),
          child: const Text(
            'Date and Time',
            overflow: TextOverflow.clip,
            softWrap: true,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      GridColumn(
        columnName: 'Depression Score',
        width: 90,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          decoration: const BoxDecoration(
            color: Colors.redAccent,
          ),
          child: const Text(
            'Depression Score',
            overflow: TextOverflow.clip,
            softWrap: true,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      GridColumn(
        columnName: 'Anxiety Score',
        width: 70,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          decoration: const BoxDecoration(
            color: Colors.redAccent,
          ),
          child: const Text(
            'Anxiety Score',
            overflow: TextOverflow.clip,
            softWrap: true,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      GridColumn(
        columnName: 'Stress Score',
        width: 70,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          decoration: const BoxDecoration(
            color: Colors.redAccent,
          ),
          child: const Text(
            'Stress Score',
            overflow: TextOverflow.clip,
            softWrap: true,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ];
  }
  Future<List<ViewPastResult>> generateViewPastResultList() async{
    var url = "http://192.168.43.74/mental_health_assistant_chatbot/StartEvaluation/evaluationPastResult.php";
    var response = await http.post(url, body: {
      "email": widget.info
    });
    var decodedViewPastResult = json.decode(response.body).cast<Map<String, dynamic>>();
    List<ViewPastResult> viewPastResultList = await decodedViewPastResult
        .map<ViewPastResult>((json) => ViewPastResult.fromJson(json))
        .toList();
    return viewPastResultList;
  }
}

class ViewPastResultDataGridSource extends DataGridSource {
  ViewPastResultDataGridSource(this.viewPastResultList) {
    buildDataGridRow();
  }
  late List<DataGridRow> dataGridRows;
  late List<ViewPastResult> viewPastResultList;
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
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[3].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      )
    ]);
  }
  @override
  List<DataGridRow> get rows => dataGridRows;
  void buildDataGridRow(){
    dataGridRows = viewPastResultList.map<DataGridRow>((dataGridRow){
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'Date and Time', value: dataGridRow.date),
        DataGridCell<String>(columnName: 'Depression Score', value: dataGridRow.depressionScore),
        DataGridCell<String>(columnName: 'Anxiety Score', value: dataGridRow.anxietyScore),
        DataGridCell<String>(columnName: 'Stress Score', value: dataGridRow.stressScore),
      ]);
    }).toList(growable: false);
  }
}


class ViewPastResult{
  factory ViewPastResult.fromJson(Map<String, dynamic> json){
    return ViewPastResult(date: json['date'], depressionScore: json['depression_score'], anxietyScore: json['anxiety_score'], stressScore: json['stress_score']);
  }
  ViewPastResult(
      {
        required this.date,
        required this.depressionScore,
        required this.anxietyScore,
        required this.stressScore
      });
  final String? date;
  final String? depressionScore;
  final String? anxietyScore;
  final String? stressScore;
}
