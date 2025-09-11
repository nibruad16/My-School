import 'package:flutter/material.dart';

class ClassListPage extends StatelessWidget {
  const ClassListPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(0xFF3F51B5);

    // Sample class data
    final List<Map<String, dynamic>> classes = [
      {
        'name': 'Class 3 A',
        'subject': 'Mathematics',
        'students': 25,
        'time': '9:00 AM - 10:00 AM',
        'room': 'Room 101',
      },
      {
        'name': 'Class 3 B',
        'subject': 'Science',
        'students': 23,
        'time': '10:00 AM - 11:00 AM',
        'room': 'Room 102',
      },
      {
        'name': 'Class 4 A',
        'subject': 'English',
        'students': 28,
        'time': '11:00 AM - 12:00 PM',
        'room': 'Room 103',
      },
      {
        'name': 'Class 4 B',
        'subject': 'Social Studies',
        'students': 26,
        'time': '1:00 PM - 2:00 PM',
        'room': 'Room 104',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Browse Classes'),
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: classes.length,
        itemBuilder: (context, index) {
          final classData = classes[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: CircleAvatar(
                backgroundColor: primaryBlue.withOpacity(0.1),
                child: Icon(Icons.school, color: primaryBlue),
              ),
              title: Text(
                classData['name'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    'Subject: ${classData['subject']}',
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Students: ${classData['students']}',
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Time: ${classData['time']}',
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Room: ${classData['room']}',
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey[400],
                size: 16,
              ),
              onTap: () {
                // Navigate to class details or roster
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Selected ${classData['name']}'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
