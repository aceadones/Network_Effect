import 'package:flutter/material.dart';
import 'profile_setup.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  bool _otpSent = false;
  String? _errorMessage;

  void _handleLogin() async {
    String phone = _phoneController.text.trim();
    setState(() {
      _errorMessage = null;
    });

    // Validate phone number
    if (phone.isEmpty || phone.length < 9) {
      setState(() {
        _errorMessage = "Please enter a valid phone number with at least 9 digits.";
      });
      return;
    }

    // Simulate OTP flow and user status check
    bool isNewUser = true; // Replace with Firebase or backend logic
    if (_otpSent) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => isNewUser ? ProfileSetupPage() : HomePage(),
        ),
      );
    } else {
      setState(() {
        _otpSent = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Image.network(
              'https://via.placeholder.com/150',
              height: 180,
            ),
            const SizedBox(height: 30),
            const Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Login to continue',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 40),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Enter your phone number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              ),
            ),
            const SizedBox(height: 20),
            if (_otpSent)
              TextField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter OTP',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                ),
              ),
            if (_otpSent) const SizedBox(height: 20),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFF7C64B4), Color(0xFF5A3AA6)],
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(15.0),
                onTap: _handleLogin,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Center(
                    child: Text(
                      _otpSent ? 'Login' : 'Send OTP',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'By logging in, you agree to our Terms & Privacy Policy',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            if (_errorMessage != null)
              Text(
                _errorMessage!,
                style: const TextStyle(fontSize: 14, color: Colors.red),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
