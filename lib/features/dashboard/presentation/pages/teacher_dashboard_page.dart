// lib/features/auth/presentation/pages/dashboard_page.dart
import 'package:flutter/material.dart';

// Import all the pages you've created for a teacher's use
import 'package:myapp/features/attendance/presentation/pages/attendance_page.dart';
import 'package:myapp/features/results/presentation/pages/result_page.dart';
import 'package:myapp/features/homework/presentation/pages/homework_submission_page.dart';
import 'package:myapp/features/auth/presentation/pages/add_account_page.dart';

class TeacherDashboardPage extends StatelessWidget {
  const TeacherDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(
      0xFF3F51B5,
    ); // A shade of blue from your design (e.g., AppBar)

    // Define the items for the teacher's dashboard grid
    final List<Map<String, dynamic>> dashboardItems = [
      {
        'title': 'Attendance',
        'icon': Icons.calendar_today_outlined,
        'color': Colors.indigo,
      },
      {
        'title': 'Homework',
        'icon': Icons.assignment_outlined,
        'color': Colors.blueAccent,
      },
      {'title': 'Result', 'icon': Icons.grade_outlined, 'color': Colors.green},
      {
        'title': 'Exam Routine',
        'icon': Icons.schedule_outlined,
        'color': Colors.orange,
      },
      {
        'title': 'Solution',
        'icon': Icons.lightbulb_outline,
        'color': Colors.purple,
      },
      {
        'title': 'Notice & Events',
        'icon': Icons.campaign_outlined,
        'color': Colors.redAccent,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100], // Light grey background as in design
      body: CustomScrollView(
        slivers: [
          // Custom AppBar with curved bottom and welcome message
          SliverAppBar(
            expandedHeight: 200.0, // Height of the expanded app bar
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      primaryBlue,
                      Color(0xFF5C6BC0),
                    ], // Darker to lighter blue
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
                            ), // User icon
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Welcome, Teacher →', // Modified welcome message for clarity
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'The standard Lorem ipsum passage, used since the 1500s.', // Placeholder text
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Grid of Dashboard Items
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 items per row
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 1.2, // Adjust card height
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
                    // Handle navigation for each grid item based on its title
                    if (item['title'] == 'Attendance') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AttendancePage(),
                        ),
                      );
                    } else if (item['title'] == 'Homework') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeworkSubmissionPage(),
                        ),
                      );
                    } else if (item['title'] == 'Result') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResultPage(),
                        ),
                      );
                    }
                    // You can add navigation for other items here later
                    print('${item['title']} clicked!');
                  },
                );
              }, childCount: dashboardItems.length),
            ),
          ),

          // Add Account Button at the bottom
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
                    ), // Navigate to Add Account
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
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ), // Bottom padding
        ],
      ),
    );
  }
}

// Custom Widget for Dashboard Grid Items
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
