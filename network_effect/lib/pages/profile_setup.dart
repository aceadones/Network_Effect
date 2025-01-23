import 'package:flutter/material.dart';
import 'home_page.dart';

class ProfileSetupPage extends StatefulWidget {
  @override
  _ProfileSetupPageState createState() => _ProfileSetupPageState();
}

class _ProfileSetupPageState extends State<ProfileSetupPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  String? _profileImageUrl; // Placeholder for uploaded profile image URL
  String? _errorMessage;

  // Simulate profile save (connect to Firebase or backend here)
  void _saveProfile() {
    String name = _nameController.text.trim();
    String companyName = _companyController.text.trim();

    // Validate inputs
    if (name.isEmpty || companyName.isEmpty) {
      setState(() {
        _errorMessage = "Please fill in all fields.";
      });
      return;
    }

    // Save profile logic here (e.g., upload to Firebase)
    print("Saving profile: Name: $name, Company: $companyName, Image: $_profileImageUrl");

    // Navigate to Home Page after successful save
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  // Simulate image upload (connect to a real image picker here)
  void _uploadProfilePicture() {
    setState(() {
      _profileImageUrl = "https://via.placeholder.com/150"; // Replace with uploaded image URL
    });
    print("Profile picture uploaded.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Set Up Profile'),
        backgroundColor: const Color(0xFF7C64B4), // Purple gradient color
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture Section
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: _profileImageUrl != null
                        ? NetworkImage(_profileImageUrl!)
                        : null,
                    child: _profileImageUrl == null
                        ? const Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.grey,
                    )
                        : null,
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: _uploadProfilePicture,
                    child: const Text(
                      "Upload Profile Picture",
                      style: TextStyle(
                        color: Color(0xFF7C64B4),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Name Input
            const Text(
              "Full Name",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: "Enter your name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Company Name Input
            const Text(
              "Company Name",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _companyController,
              decoration: const InputDecoration(
                hintText: "Enter your company name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),

            // Error Message
            if (_errorMessage != null)
              Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            const SizedBox(height: 16),

            // Save & Continue Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saveProfile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7C64B4), // Purple button
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Save & Continue",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
