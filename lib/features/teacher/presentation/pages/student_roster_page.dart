import 'package:flutter/material.dart';

class StudentRosterPage extends StatelessWidget {
  final String className;

  const StudentRosterPage({super.key, required this.className});

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(0xFF3F51B5);

    // Sample student data
    final List<Map<String, dynamic>> students = [
      {
        'id': '001',
        'name': 'Prajesh Shakya',
        'rollNumber': '001',
        'attendance': 95,
        'averageMarks': 85.5,
        'status': 'Active',
      },
      {
        'id': '002',
        'name': 'Sarah Johnson',
        'rollNumber': '002',
        'attendance': 88,
        'averageMarks': 92.0,
        'status': 'Active',
      },
      {
        'id': '003',
        'name': 'Michael Chen',
        'rollNumber': '003',
        'attendance': 92,
        'averageMarks': 78.5,
        'status': 'Active',
      },
      {
        'id': '004',
        'name': 'Emily Davis',
        'rollNumber': '004',
        'attendance': 100,
        'averageMarks': 95.0,
        'status': 'Active',
      },
      {
        'id': '005',
        'name': 'David Wilson',
        'rollNumber': '005',
        'attendance': 75,
        'averageMarks': 82.0,
        'status': 'Active',
      },
      {
        'id': '006',
        'name': 'Lisa Brown',
        'rollNumber': '006',
        'attendance': 90,
        'averageMarks': 88.5,
        'status': 'Active',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('$className - Student Roster'),
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Search functionality coming soon!'),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Implement filter functionality
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Filter functionality coming soon!'),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Class Summary Card
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildSummaryItem(
                  'Total Students',
                  students.length.toString(),
                  Icons.people,
                  Colors.blue,
                ),
                _buildSummaryItem(
                  'Avg Attendance',
                  '${(students.map((s) => s['attendance'] as int).reduce((a, b) => a + b) / students.length).toStringAsFixed(1)}%',
                  Icons.calendar_today,
                  Colors.green,
                ),
                _buildSummaryItem(
                  'Avg Marks',
                  '${(students.map((s) => s['averageMarks'] as double).reduce((a, b) => a + b) / students.length).toStringAsFixed(1)}',
                  Icons.grade,
                  Colors.orange,
                ),
              ],
            ),
          ),

          // Students List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: CircleAvatar(
                      backgroundColor: primaryBlue.withOpacity(0.1),
                      child: Text(
                        student['rollNumber'],
                        style: TextStyle(
                          color: primaryBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(
                      student['name'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              size: 14,
                              color: Colors.grey[600],
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Attendance: ${student['attendance']}%',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Icon(
                              Icons.grade,
                              size: 14,
                              color: Colors.grey[600],
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Avg: ${student['averageMarks']}',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: student['status'] == 'Active'
                            ? Colors.green.withOpacity(0.1)
                            : Colors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        student['status'],
                        style: TextStyle(
                          color: student['status'] == 'Active'
                              ? Colors.green
                              : Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    onTap: () {
                      // Navigate to student details
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Viewing details for ${student['name']}',
                          ),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new student functionality
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Add student functionality coming soon!'),
            ),
          );
        },
        backgroundColor: primaryBlue,
        child: const Icon(Icons.person_add, color: Colors.white),
      ),
    );
  }

  Widget _buildSummaryItem(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
      ],
    );
  }
}
