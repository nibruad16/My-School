// lib/features/results/presentation/pages/result_page.dart
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(0xFF3F51B5);
    const Color cardColor = Color(0xFFE8F0FE);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        title: const Text(
          'RESULT',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.assessment, size: 28),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // First Terminal Result Card
            _buildResultCard(
              context,
              title: 'First Terminal',
              content:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              onPublish: () {
                print('Publish First Terminal clicked!');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Publish First Terminal functionality to be implemented!',
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            // Second Terminal Result Card
            _buildResultCard(
              context,
              title: 'Second Terminal',
              content:
                  'Ut enim ad minim veniam, quis nostrud exercitation ullamco.',
              onPublish: () {
                print('Publish Second Terminal clicked!');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Publish Second Terminal functionality to be implemented!',
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

  Widget _buildResultCard(
    BuildContext context, {
    required String title,
    required String content,
    required VoidCallback onPublish,
  }) {
    const Color primaryBlue = Color(0xFF3F51B5);
    const Color cardColor = Color(0xFFE8F0FE);

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryBlue,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey[300]!),
              ),
              padding: const EdgeInsets.all(10),
              child: Text(
                content,
                style: const TextStyle(color: Colors.black87),
              ),
            ),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: onPublish,
                child: const Text(
                  'PUBLISH',
                  style: TextStyle(
                    color: primaryBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
