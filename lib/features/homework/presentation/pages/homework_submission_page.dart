// lib/features/auth/presentation/pages/homework_submission_page.dart
import 'package:flutter/material.dart';

class HomeworkSubmissionPage extends StatefulWidget {
  const HomeworkSubmissionPage({super.key});

  @override
  State<HomeworkSubmissionPage> createState() => _HomeworkSubmissionPageState();
}

class _HomeworkSubmissionPageState extends State<HomeworkSubmissionPage> {
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _addHomeworkController = TextEditingController();
  bool _isFileUploaded = false; // State to show "File is uploaded successfully"

  @override
  void dispose() {
    _subjectController.dispose();
    _addHomeworkController.dispose();
    super.dispose();
  }

  void _submitHomework() {
    // TODO: Implement actual homework submission logic
    print('Submitting Homework:');
    print('Subject: ${_subjectController.text}');
    print('Homework Details: ${_addHomeworkController.text}');
    setState(() {
      _isFileUploaded = true; // Simulate file upload success
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Homework submitted (mock)!')));
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(0xFF3F51B5); // Consistent blue color

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        title: const Text('HOMEWORK'),
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Top section similar to dashboard/login
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height:
                  MediaQuery.of(context).size.height * 0.25, // Adjust height
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
              child: const Padding(
                padding: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'The standard Lorem ipsum passage',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'The standard Lorem ipsum passage, used since the 1500s.',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Homework Form Card
          Positioned(
            top:
                MediaQuery.of(context).size.height *
                0.2, // Overlap the top section
            left: 20,
            right: 20,
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Subject',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildInputField(_subjectController, 'Enter subject...'),
                    const SizedBox(height: 20),
                    const Text(
                      'Add homework',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildInputField(
                      _addHomeworkController,
                      'Enter homework details or file path...',
                      maxLines: 5,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _submitHomework,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 5,
                        ),
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    if (_isFileUploaded)
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.check_circle_outline,
                              color: Colors.green,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'File is uploaded successfully',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          // Bottom Subject Buttons (Fixed at bottom)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 60, // Height of the bottom bar
              decoration: const BoxDecoration(
                color: primaryBlue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildBottomSubjectButton('Subject A'),
                  _buildBottomSubjectButton('Subject B'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method for input fields
  Widget _buildInputField(
    TextEditingController controller,
    String hint, {
    int maxLines = 1,
  }) {
    const Color primaryBlue = Color(0xFF3F51B5);
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none, // No border for cleaner look
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: primaryBlue, width: 2),
        ),
      ),
    );
  }

  // Helper method for bottom subject buttons
  Widget _buildBottomSubjectButton(String title) {
    return TextButton(
      onPressed: () {
        print('$title button pressed!');
      },
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
