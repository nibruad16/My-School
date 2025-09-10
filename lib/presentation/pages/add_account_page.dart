// lib/features/auth/presentation/pages/add_account_page.dart
import 'package:flutter/material.dart';

class AddAccountPage extends StatefulWidget {
  const AddAccountPage({super.key});

  @override
  State<AddAccountPage> createState() => _AddAccountPageState();
}

class _AddAccountPageState extends State<AddAccountPage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _classController = TextEditingController();
  final TextEditingController _sectionController = TextEditingController();
  final TextEditingController _rollNoController = TextEditingController();
  final TextEditingController _anotherEmailController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _classController.dispose();
    _sectionController.dispose();
    _rollNoController.dispose();
    _anotherEmailController.dispose();
    super.dispose();
  }

  void _addAccount() {
    print('Add Account button pressed!');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Add Account functionality will be implemented here!'),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }

  void _addPhoto() {
    print('Add Photo button pressed!');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Photo picking functionality to be implemented!'),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(0xFF3F51B5);
    const Color primaryGreen = Color(0xFF26A69A);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // This container creates the curved top section with the gradient
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [primaryGreen, Color(0xFF66BB6A)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
            ),
          ),
          // Custom Back Button positioned in the top-left corner
          Positioned(
            top: 40, // Adjust this value for vertical alignment
            left: 10, // Adjust this value for horizontal alignment
            child: Material(
              color: Colors.transparent,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          // Positioned title
          Positioned(
            top: 50, // Adjust to be horizontally aligned with the back button
            left: 60,
            child: const Text(
              'Add Account',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // The scrollable form content
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 20.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: _addPhoto,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: primaryGreen, width: 3),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_a_photo,
                            size: 50,
                            color: primaryGreen,
                          ),
                          Text(
                            'Add Photo',
                            style: TextStyle(color: primaryGreen, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  _buildTextField(
                    _fullNameController,
                    'Full Name',
                    'Enter Something...',
                  ),
                  const SizedBox(height: 15),
                  _buildTextField(
                    _emailController,
                    'Email',
                    'Enter Something...',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 15),
                  _buildTextField(
                    _classController,
                    'Class',
                    'Enter Something...',
                  ),
                  const SizedBox(height: 15),
                  _buildTextField(
                    _sectionController,
                    'Section',
                    'Enter Something...',
                  ),
                  const SizedBox(height: 15),
                  _buildTextField(
                    _rollNoController,
                    'Roll No.',
                    'Enter Something...',
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 15),
                  _buildTextField(
                    _anotherEmailController,
                    'Email',
                    'Enter Something...',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: _addAccount,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 5,
                      ),
                      child: const Text(
                        'Add to contact',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    String hint, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    const Color primaryBlue = Color(0xFF3F51B5);
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: primaryBlue),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: primaryBlue.withOpacity(0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: primaryBlue, width: 2),
        ),
      ),
    );
  }
}
