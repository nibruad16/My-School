import 'package:flutter/material.dart';
import 'package:myapp/features/splash%20screen/presentation/pages/second.dart';

class firstscreen extends StatelessWidget {
  const firstscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0077C8),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SecondScreen()),
          );
        },
        child: const Icon(Icons.arrow_forward, color: Colors.white),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SecondScreen()),
          );
        },
        child: Stack(
          children: [
            // Top curved shape
            Align(
              alignment: Alignment.topLeft,
              child: ClipPath(
                clipper: _TopCurveClipper(),
                child: Container(
                  height: 100,
                  width: 200,
                  color: const Color(0xFF2EC4B6),
                ),
              ),
            ),
            // Bottom curved shape
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipPath(
                clipper: _BottomCurveClipper(),
                child: Container(
                  height: 100,
                  color: const Color(0xFF0077C8),
                  alignment: Alignment.bottomCenter,
                  child: const Padding(
                    padding: EdgeInsets.only(bottom: 24.0),
                    child: Text(
                      'Powered by: XYZ COM',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Center logo and text
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Replace with your logo asset
                  Container(
                    height: 120,
                    width: 120,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/logo.png'), // Update path
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "CREATIVE READER'S",
                    style: TextStyle(
                      color: Color(0xFF0077C8),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const Text(
                    'PUBLICATION',
                    style: TextStyle(
                      color: Color(0xFF2EC4B6),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 1.1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom clipper for the top curve
class _TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width * 0.5, 0, size.width, 0);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// Custom clipper for the bottom curve
class _BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
