// lib/features/results/presentation/pages/student_marks_page.dart
import 'package:flutter/material.dart';

class StudentMarksPage extends StatefulWidget {
  const StudentMarksPage({super.key});

  @override
  State<StudentMarksPage> createState() => _StudentMarksPageState();
}

class _StudentMarksPageState extends State<StudentMarksPage> {
  // Mock data for a student's marks.
  final List<Map<String, dynamic>> _studentMarks = [
    {
      'assessment': 'Maths Quiz',
      'score': 18,
      'total': 20,
      'status': 'Submitted',
    },
    {
      'assessment': 'Science Mid-term',
      'score': 85,
      'total': 100,
      'status': 'Published',
    },
    {
      'assessment': 'English Assignment',
      'score': 92,
      'total': 100,
      'status': 'Published',
    },
    {
      'assessment': 'History Test',
      'score': 0,
      'total': 50,
      'status': 'Pending',
    },
    {'assessment': 'Art Project', 'score': 0, 'total': 50, 'status': 'Pending'},
    {
      'assessment': 'Social Studies Exam',
      'score': 76,
      'total': 100,
      'status': 'Published',
    },
  ];

  @override
  Widget build(BuildContext context) {
    const Color primaryGreen = Color(0xFF26A69A);
    const Color cardColor = Color(0xFFE8F5E9);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: primaryGreen,
        foregroundColor: Colors.white,
        title: const Text(
          'View Marks',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Assessments',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: primaryGreen,
              ),
            ),
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _studentMarks.length,
              itemBuilder: (context, index) {
                final mark = _studentMarks[index];
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.only(bottom: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: cardColor,
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    title: Text(
                      mark['assessment'],
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text('Status: ${mark['status']}'),
                    trailing: mark['status'] == 'Published'
                        ? Text(
                            '${mark['score']}/${mark['total']}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: primaryGreen,
                            ),
                          )
                        : const Icon(
                            Icons.pending_actions,
                            color: Colors.orange,
                          ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
