import 'package:flutter/material.dart';
import 'profile_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? userName;
  String? errorMessage;
  bool isAfterRegister = false; // This flag tracks if the user has returned from RegisterPage

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isAfterRegister
          ? null // Remove the AppBar if user has returned from RegisterPage
          : AppBar(
              title: Text('Login'),
              backgroundColor: Colors.deepPurpleAccent,
              foregroundColor: Colors.white,
            ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isAfterRegister) ...[
              // Add a lock icon above the "Welcome Back!!!" text
              Icon(Icons.lock, size: 100, color: Colors.deepPurpleAccent),
              SizedBox(height: 10),
              // Show "Welcome Back!!!" and "Login" after returning from registration
              Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.deepPurpleAccent,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center, // Center align the text
              ),
              SizedBox(height: 10),
              Text(
                'Access your account',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center, // Center align the text
              ),
            ] else ...[
              // Show the initial icon before registration
              Icon(Icons.person, size: 100, color: Colors.deepPurpleAccent),
            ],
            SizedBox(height: 20),
            if (errorMessage != null)
              Text(
                errorMessage!,
                style: TextStyle(color: Colors.red),
              ),
            SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email Anda',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.visibility), // Icon on the right side of email input
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password Anda',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.lock), // Icon on the right side of password input
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  errorMessage = null;

                  if (emailController.text.isEmpty || passwordController.text.isEmpty) {
                    errorMessage = 'Silahkan isi email dan password.';
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Selamat Datang'),
                          content: Text('Selamat Datang, $userName'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProfilePage(
                                      name: userName ?? 'User Name',
                                      email: emailController.text,
                                      address: 'Your Address',
                                      phoneNumber: 'Your Phone Number',
                                    ),
                                  ),
                                );
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                });
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () async {
                final result = await Navigator.pushNamed(context, '/register');
                if (result != null) {
                  setState(() {
                    userName = (result as Map)['name'];
                    emailController.text = (result as Map)['email'];
                    isAfterRegister = true; // Set flag after returning from register
                  });
                }
              },
              child: Text('Belum punya akun? Daftar'),
            ),
          ],
        ),
      ),
    );
  }
}

