import 'package:flutter/material.dart';
import 'package:myapp/features/auth/presentation/pages/login_screen.dart';
import 'package:myapp/features/dashboard/presentation/pages/student_dashboard_page.dart';
import 'package:myapp/features/dashboard/presentation/pages/teacher_dashboard_page.dart'
    as teacher;

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          // Top curved area with logo
          Stack(
            alignment: Alignment.center,
            children: [
              ClipPath(
                clipper: _TopCurveClipper(),
                child: Container(height: 180, color: const Color(0xFF2EC4B6)),
              ),
              Positioned(
                top: 60,
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF2EC4B6),
                      width: 4,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Replace with your logo asset
                        Container(
                          height: 60,
                          width: 60,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/logo.png',
                              ), // Update path
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "CREATIVE READER'S",
                          style: TextStyle(
                            color: Color(0xFF0077C8),
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            letterSpacing: 1.1,
                          ),
                        ),
                        const Text(
                          'PUBLICATION',
                          style: TextStyle(
                            color: Color(0xFF2EC4B6),
                            fontWeight: FontWeight.bold,
                            fontSize: 9,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          const Text(
            'Choose your option',
            style: TextStyle(
              color: Color(0xFF0077C8),
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 32),
          // Options
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _OptionButton(
                      icon: Icons.school,
                      label: 'Student',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StudentDashboardPage(),
                          ),
                        );
                      },
                    ),
                    _OptionButton(
                      icon: Icons.person_outline,
                      label: 'Teacher',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                teacher.TeacherDashboardPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _OptionButton(
                      icon: Icons.person,
                      label: 'Guest',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const LoginScreen(role: 'Guest'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OptionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _OptionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: const Color(0xFF0077C8),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: Colors.white, size: 40),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(color: Colors.black, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

// Custom clipper for the top curve
class _TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.7);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height * 0.7,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
