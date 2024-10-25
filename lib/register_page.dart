import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  String? errorMessage;
  String? successMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: null, // Background color removed
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(''), // Keep the title empty for simplicity
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // "Create your account" text with size 40 and color purple
            Text(
              'Create your account',
              style: TextStyle(
                fontSize: 40,
                color: Colors.deepPurpleAccent, // Text color changed to purple
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            // Form fields start here
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nama Lengkap',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.visibility), // Mata icon for Nama
                  onPressed: () {
                    // You can add a function here if needed, or leave it inactive
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.visibility), // Mata icon for Email
                  onPressed: () {
                    // You can add a function here if needed, or leave it inactive
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.lock), // Gembok icon for Password
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible; // Toggle password visibility
                    });
                  },
                ), // Lock icon for password
              ),
              obscureText: !isPasswordVisible, // Password visibility control
            ),
            SizedBox(height: 20),
            TextField(
              controller: confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.lock), // Gembok icon for Confirm Password
                  onPressed: () {
                    setState(() {
                      isConfirmPasswordVisible = !isConfirmPasswordVisible; // Toggle confirm password visibility
                    });
                  },
                ), // Lock icon for confirm password
              ),
              obscureText: !isConfirmPasswordVisible, // Confirm password visibility control
            ),
            SizedBox(height: 20),

            if (errorMessage != null)
              Text(
                errorMessage!,
                style: TextStyle(color: Colors.red),
              ),
            if (successMessage != null)
              Text(
                successMessage!,
                style: TextStyle(color: Colors.green),
              ),

            SizedBox(height: 20),

            // Register button with centered text
            ElevatedButton(
              onPressed: () {
                setState(() {
                  errorMessage = null;
                  successMessage = null;

                  if (nameController.text.isEmpty ||
                      emailController.text.isEmpty ||
                      passwordController.text.isEmpty ||
                      confirmPasswordController.text.isEmpty) {
                    errorMessage = 'Data tidak valid, yuk lengkapi semua kolom.';
                  } else if (passwordController.text != confirmPasswordController.text) {
                    errorMessage = 'Password dan Konfirmasi Password tidak cocok.';
                  } else {
                    successMessage = 'Pendaftaran Berhasil Dilakukan';

                    // After showing the success message, pass the name and email back to LoginPage
                    Future.delayed(Duration(seconds: 2), () {
                      Navigator.pop(context, {
                        'name': nameController.text,
                        'email': emailController.text,
                      }); // Pass the name and email
                    });
                  }
                });
              },
              child: Text(
                'Register',
                style: TextStyle(color: Colors.deepPurpleAccent), // Button text color changed to purple
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Sudah punya akun? Login',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


