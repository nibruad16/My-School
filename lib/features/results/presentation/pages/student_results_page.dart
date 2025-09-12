import 'package:flutter/material.dart';

class StudentResultsPage extends StatelessWidget {
  const StudentResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Results'),
        backgroundColor: const Color(0xFF26A69A),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'Student results coming soon',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
