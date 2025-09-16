// lib/features/attendance/presentation/pages/student_attendance_page.dart
import 'package:flutter/material.dart';

class StudentAttendancePage extends StatefulWidget {
  const StudentAttendancePage({super.key});

  @override
  State<StudentAttendancePage> createState() => _StudentAttendancePageState();
}

class _StudentAttendancePageState extends State<StudentAttendancePage> {
  // Mock data for student's attendance log.
  final List<Map<String, dynamic>> _attendanceLog = [
    {
      'date': '15/12/2025',
      'status': 'Present',
      'icon': Icons.check_circle,
      'color': Colors.green,
    },
    {
      'date': '14/12/2025',
      'status': 'Present',
      'icon': Icons.check_circle,
      'color': Colors.green,
    },
    {
      'date': '13/12/2025',
      'status': 'Absent',
      'icon': Icons.cancel,
      'color': Colors.red,
    },
    {
      'date': '12/12/2025',
      'status': 'Present',
      'icon': Icons.check_circle,
      'color': Colors.green,
    },
    {
      'date': '11/12/2025',
      'status': 'Present',
      'icon': Icons.check_circle,
      'color': Colors.green,
    },
    {
      'date': '10/12/2025',
      'status': 'Absent',
      'icon': Icons.cancel,
      'color': Colors.red,
    },
    {
      'date': '09/12/2025',
      'status': 'Present',
      'icon': Icons.check_circle,
      'color': Colors.green,
    },
    {
      'date': '08/12/2025',
      'status': 'Present',
      'icon': Icons.check_circle,
      'color': Colors.green,
    },
  ];

  @override
  Widget build(BuildContext context) {
    const Color primaryGreen = Color(0xFF26A69A);

    final int totalPresent = _attendanceLog
        .where((log) => log['status'] == 'Present')
        .length;
    final int totalAbsent = _attendanceLog
        .where((log) => log['status'] == 'Absent')
        .length;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: primaryGreen,
        foregroundColor: Colors.white,
        title: const Text(
          'View Attendance',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Summary Card
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          '$totalPresent',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        const Text(
                          'Present',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '$totalAbsent',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        const Text(
                          'Absent',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Attendance Log List
            const Text(
              'Attendance Log',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _attendanceLog.length,
              itemBuilder: (context, index) {
                final log = _attendanceLog[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: ListTile(
                    leading: Icon(log['icon'], color: log['color']),
                    title: Text(log['date']),
                    trailing: Text(
                      log['status'],
                      style: TextStyle(
                        color: log['color'],
                        fontWeight: FontWeight.bold,
                      ),
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
