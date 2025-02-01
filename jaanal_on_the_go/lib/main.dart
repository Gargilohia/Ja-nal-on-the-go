import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ja-nal',
      theme: ThemeData(
        colorScheme: ColorScheme.light(background: Color(0xFFFAF9F6)),
        scaffoldBackgroundColor: Color(0xFFFAF9F6),
        useMaterial3: true,
      ),
      home: const JournalPage(),
    );
  }
}

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  final TextEditingController _journalController = TextEditingController();
  String _chatGptResponse = "";

  void _saveEntry() {
    setState(() {
      _chatGptResponse = "Great job! Keep writing your thoughts.";
    });
  }

  void _saveForDay() {
    setState(() {
      _chatGptResponse = "You have saved your journal for today!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ja-nal on the go'),
        actions: [
          IconButton(
            icon: const Icon(Icons.track_changes),
            onPressed: () {
              // Navigate to Track Record Page
            },
          ),
        ],
        backgroundColor: Color(0xFFFAF9F6),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Write your thoughts, reflect, and grow!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: TextField(
                controller: _journalController,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  hintText: "Start journaling here...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _saveEntry,
                  child: const Text("Save Entry"),
                ),
                ElevatedButton(
                  onPressed: _saveForDay,
                  child: const Text("Save for the Day"),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              _chatGptResponse,
              style: const TextStyle(color: Colors.blue, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
