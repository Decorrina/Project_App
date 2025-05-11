import 'package:flutter/material.dart';

// Stateless widget representing the Profile Screen
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key}); // Constructor with a unique key for widget identification

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Sets the background color of the screen
      body: SingleChildScrollView(
        // Ensures the screen is scrollable if the content overflows
        child: Column(
          children: [
                   Image(
          image: AssetImage('images/LogoStudentHousingHub.png'), 
          // Loads the logo image from the assets folder
          height: 170, // Sets the height of the image
          width: 300, // Sets the width of the image
        ),
            SafeArea(
              // Ensures content is displayed within safe areas (e.g., below the status bar)
              child: Stack(
                children: [
                  // Main Content
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 23), // Horizontal padding for content
                    child: Column(
                      children: [
                        const SizedBox(height: 15), // Adds spacing above the profile card
                        
                        // Profile Card
                        Card(
                          elevation: 4, // Adds a shadow to the card for a raised look
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14), // Rounded corners for the card
                          ),
                          child: SizedBox(
                            height: 271, // Sets the height of the profile card
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center, 
                              // Aligns children in the center vertically
                              crossAxisAlignment: CrossAxisAlignment.center, 
                              // Aligns children in the center horizontally
                              children: [
                                Stack(
                                  // Overlapping widgets for profile details
                                  children: [
                                    // Background Color
                                    Container(
                                      height: 172, // Height of the background section
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF519FEE), // Background color
                                      ),
                                    ),
                                    // Blue Overlay at the Bottom
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        height: 100, // Height of the blue overlay
                                        color: const Color(0xFF519FEE), // Overlay color
                                      ),
                                    ),
                                    // Profile Picture
                                    Positioned(
                                      top: 18,
                                      left: 29,
                                      child: SizedBox(
                                        height: 50, // Height of the profile picture container
                                        child: Container(
                                          width: 70, // Width of the profile picture container
                                          height: 70, // Height of the profile picture container
                                          decoration: const BoxDecoration(
                                            color: Colors.white, // Background color of the profile picture
                                            shape: BoxShape.circle, // Circular shape for the picture
                                          ),
                                          child: const Icon(
                                            Icons.person, // Placeholder for the profile picture
                                            size: 50, // Icon size
                                            color: Color(0xFF519FEE), // Icon color
                                          ),
                                        ),
                                      ),
                                    ),
                                    // User Info
                                    Positioned(
                                      bottom: 47,
                                      left: 29,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start, 
                                        // Aligns children to the start of the column
                                        children: const [
                                          Text(
                                            'User_12', // Username
                                            style: TextStyle(
                                              color: Colors.white, // Text color
                                              fontSize: 25, // Font size
                                            ),
                                          ),
                                          Text(
                                            'user@gmail.com', // User's email
                                            style: TextStyle(
                                              color: Colors.white, // Text color
                                              fontSize: 15, // Font size
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Student Badge
                                    Positioned(
                                      top: 109,
                                      right: 23,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20, // Horizontal padding for the badge
                                          vertical: 8, // Vertical padding for the badge
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white, // Background color of the badge
                                          borderRadius: BorderRadius.circular(23), // Rounded corners
                                        ),
                                        child: const Text(
                                          'Student', // Badge text
                                          style: TextStyle(
                                            color: Color(0xFF519FEE), // Text color
                                            fontSize: 20, // Font size
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // Update Profile Button
                                Padding(
                                  padding: const EdgeInsets.only(top: 20, left: 20), // Padding for the button
                                  child: Row(
                                    children: const [
                                      Icon(Icons.person, size: 40), // Icon for the button
                                      SizedBox(width: 12), // Spacing between icon and text
                                      Text(
                                        'Update Profile', // Button label
                                        style: TextStyle(fontSize: 15), // Text style
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 52), // Spacing between the profile card and the menu card
                        
                        // Menu Card
                        Card(
                          elevation: 4, // Adds a shadow to the card
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14), // Rounded corners for the card
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(31), // Padding inside the menu card
                            child: Column(
                              children: [
                                // Contact Us Row
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, "ContactUs"); 
                                    // Navigates to the Contact Us screen
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.contact_support, size: 40), // Icon for Contact Us
                                      const SizedBox(width: 12), // Spacing between icon and text
                                      const Text(
                                        'Contact Us', // Label for Contact Us
                                        style: TextStyle(fontSize: 15), // Text style
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 35), // Spacing between menu items
                                
                                // Report Row
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, 'ReportScreen'); 
                                    // Navigates to the Report screen
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.feedback_outlined, size: 40), // Icon for Report
                                      const SizedBox(width: 12), // Spacing between icon and text
                                      const Text(
                                        'Report', // Label for Report
                                        style: TextStyle(fontSize: 15), // Text style
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 35), // Spacing between menu items
                                
                                // Log Out Row
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context); 
                                    // Logs out and navigates back
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.logout, size: 40), // Icon for Log Out
                                      const SizedBox(width: 12), // Spacing between icon and text
                                      const Text(
                                        'Log out', // Label for Log Out
                                        style: TextStyle(fontSize: 15), // Text style
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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