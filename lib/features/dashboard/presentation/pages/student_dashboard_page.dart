// lib/features/dashboard/presentation/pages/student_dashboard_page.dart
import 'package:flutter/material.dart';

// We'll import these pages once they are created
// import 'package:my_school_app/features/results/presentation/pages/student_result_page.dart';
// import 'package:my_school_app/features/attendance/presentation/pages/student_attendance_page.dart';
// import 'package:my_school_app/features/results/presentation/pages/student_rank_page.dart';

class StudentDashboardPage extends StatelessWidget {
  const StudentDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // You can choose a different color to distinguish the student dashboard
    const Color primaryGreen = Color(0xFF26A69A);
    const Color lightGreen = Color(0xFF66BB6A);

    // Define the items for the student's dashboard grid
    final List<Map<String, dynamic>> dashboardItems = [
      {
        'title': 'View Rank',
        'icon': Icons.leaderboard_outlined,
        'color': Colors.amber,
      },
      {
        'title': 'View Marks',
        'icon': Icons.bar_chart_outlined,
        'color': Colors.blueAccent,
      },
      {
        'title': 'View Attendance',
        'icon': Icons.calendar_month_outlined,
        'color': Colors.orange,
      },
      // You can add more student-specific items here
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        slivers: [
          // Top section with welcome message (similar to teacher's dashboard)
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [primaryGreen, lightGreen],
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
                              Icons.person_outline,
                              size: 40,
                              color: primaryGreen,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Welcome, Student!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Your academic summary is here.',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Grid of Student Dashboard Items
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
                    // TODO: Implement navigation for each student-specific page
                    print('${item['title']} clicked!');
                    // Example navigation (will implement pages later)
                    // if (item['title'] == 'View Rank') {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => const StudentRankPage()),
                    //   );
                    // }
                  },
                );
              }, childCount: dashboardItems.length),
            ),
          ),
        ],
      ),
    );
  }
}

// Reusing the DashboardGridItem widget from the teacher dashboard
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
