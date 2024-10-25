import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String email;
  final String address;
  final String phoneNumber;
  final String bio; // Add a bio section

  ProfilePage({
    required this.name,
    required this.email,
    required this.address,
    required this.phoneNumber,
    this.bio = "Bio not provided",
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Profile'),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Handle notification click
              },
            ),
          ],
        ),
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Header with Picture, Name, and Email
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Profile Picture
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/profile_picture.png'), // Add your profile image here
                    ),
                    SizedBox(height: 10),
                    
                    // Name
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    
                    // Email
                    Text(
                      email,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bio Section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              child: Column(
                children: [
                  Text(
                    bio,
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Information Section (Phone, Address)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.home, color: Colors.deepPurpleAccent),
                    title: Text('Address'),
                    subtitle: Text(address),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone, color: Colors.deepPurpleAccent),
                    title: Text('Phone'),
                    subtitle: Text(phoneNumber),
                  ),
                  Divider(),
                ],
              ),
            ),

            // Action Buttons (Edit Profile, Settings, Logout)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  ElevatedButton.icon(
                    icon: Icon(Icons.edit),
                    label: Text('Edit Profile'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent, // Button background color
                      foregroundColor: Colors.white, // Button text color
                      minimumSize: Size(double.infinity, 50), // Full-width button
                    ),
                    onPressed: () {
                      // Handle profile edit
                    },
                  ),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    icon: Icon(Icons.settings),
                    label: Text('Settings'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Button background color
                      foregroundColor: Colors.black, // Button text color
                      minimumSize: Size(double.infinity, 50), // Full-width button
                    ),
                    onPressed: () {
                      // Handle settings
                    },
                  ),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    icon: Icon(Icons.help),
                    label: Text('Help'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Button background color
                      foregroundColor: Colors.black, // Button text color
                      minimumSize: Size(double.infinity, 50), // Full-width button
                    ),
                    onPressed: () {
                      // Handle help
                    },
                  ),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    icon: Icon(Icons.logout),
                    label: Text('Logout'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Button background color
                      foregroundColor: Colors.deepPurpleAccent, // Button text color
                      minimumSize: Size(double.infinity, 50), // Full-width button
                    ),
                    onPressed: () {
                      // Handle logout
                      Navigator.pop(context); // Go back to previous page (Login Page)
                    },
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
