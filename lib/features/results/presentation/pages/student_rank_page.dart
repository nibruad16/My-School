// lib/features/results/presentation/pages/student_rank_page.dart
import 'package:flutter/material.dart';

class StudentRankPage extends StatefulWidget {
  const StudentRankPage({super.key});

  @override
  State<StudentRankPage> createState() => _StudentRankPageState();
}

class _StudentRankPageState extends State<StudentRankPage> {
  // Mock data for the student's rank.
  final String studentName = 'Prajesh Shakya';
  final String className = 'Class 3 A';
  final int studentRank = 1;
  final int totalStudents = 30;

  @override
  Widget build(BuildContext context) {
    const Color primaryGreen = Color(0xFF26A69A);
    const Color lightGreen = Color(0xFF66BB6A);
    const Color cardColor = Color(0xFFE8F5E9);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [primaryGreen, lightGreen],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          // This container creates the curved top section with the gradient
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [primaryGreen, lightGreen],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
            ),
          ),
          // Custom Back Button positioned in the top-left corner
          Positioned(
            top: 50,
            left: 20,
            child: Material(color: Colors.transparent),
          ),
          // Positioned title
          // The main content of the page, including the rank card
          Positioned.fill(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 100),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: cardColor,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Your Academic Rank',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: primaryGreen,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Icon(
                            Icons.emoji_events,
                            size: 80,
                            color: Colors.amber,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Rank: $studentRank out of $totalStudents',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Student: $studentName',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Class: $className',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
