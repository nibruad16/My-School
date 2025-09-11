// lib/features/auth/presentation/pages/dashboard_page.dart
import 'package:flutter/material.dart';

// Import all the pages you've created or will create
import 'package:myapp/features/attendance/presentation/pages/attendance_page.dart';
import 'package:myapp/features/results/presentation/pages/result_page.dart';
import 'package:myapp/features/teacher/presentation/pages/class_list_page.dart'; // We'll link to this
import 'package:myapp/features/teacher/presentation/pages/create_assessment_page.dart';
import 'package:myapp/features/teacher/presentation/pages/student_roster_page.dart';
import 'package:myapp/features/teacher/presentation/pages/single_student_mark_page.dart';
import 'package:myapp/features/auth/presentation/pages/add_account_page.dart';

class TeacherDashboardPage extends StatelessWidget {
  const TeacherDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(0xFF3F51B5); // Consistent blue
    const Color primaryGreen = Color(0xFF26A69A); // Consistent green

    final List<Map<String, dynamic>> dashboardItems = [
      {'title': 'Browse Classes', 'icon': Icons.school, 'color': primaryBlue},
      {
        'title': 'Create Assessment',
        'icon': Icons.assignment_add,
        'color': primaryGreen,
      },
      {
        'title': 'Fill Attendance',
        'icon': Icons.calendar_today_outlined,
        'color': Colors.indigo,
      },
      {
        'title': 'Submit Results',
        'icon': Icons.grade_outlined,
        'color': Colors.green,
      },
      {'title': 'View Roster', 'icon': Icons.list_alt, 'color': Colors.orange},
      {
        'title': 'View Single Mark',
        'icon': Icons.person_search,
        'color': Colors.purple,
      },
      {
        'title': 'Notice & Events',
        'icon': Icons.campaign_outlined,
        'color': Colors.redAccent,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [primaryBlue, Color(0xFF5C6BC0)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 60.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.sentiment_satisfied_alt,
                              size: 40,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Welcome, Teacher!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Manage your classes, students, and tasks.',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 1.2,
              ),
              delegate: SliverChildBuilderDelegate((
                BuildContext context,
                int index,
              ) {
                final item = dashboardItems[index];
                return DashboardGridItem(
                  title: item['title'],
                  icon: item['icon'],
                  color: item['color'],
                  onTap: () {
                    if (item['title'] == 'Browse Classes') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ClassListPage(),
                        ),
                      );
                    } else if (item['title'] == 'Create Assessment') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreateAssessmentPage(),
                        ),
                      );
                    } else if (item['title'] == 'Fill Attendance') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AttendancePage(),
                        ),
                      );
                    } else if (item['title'] == 'Submit Results') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResultPage(),
                        ),
                      );
                    } else if (item['title'] == 'View Roster') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const StudentRosterPage(className: 'Class 3 A'),
                        ),
                      );
                    } else if (item['title'] == 'View Single Mark') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SingleStudentMarkPage(
                            studentName: 'Prajesh Shakya',
                          ),
                        ),
                      );
                    } else {
                      // Placeholder for other functionalities
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '${item['title']} functionality coming soon!',
                          ),
                        ),
                      );
                    }
                  },
                );
              }, childCount: dashboardItems.length),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddAccountPage(),
                    ),
                  );
                },
                icon: const Icon(Icons.person_add_alt_1, color: Colors.white),
                label: const Text(
                  'Add Account',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  elevation: 5,
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }
}

class DashboardGridItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const DashboardGridItem({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
