import 'package:flutter/material.dart';
import 'package:graduation_project/Screens/Ad_Details.dart';
import 'package:graduation_project/Screens/HomeScreen.dart';
import 'package:graduation_project/Screens/ProfileScreen.dart'; 
import 'package:graduation_project/Screens/SearchScreen.dart'; 
import 'package:graduation_project/Screens/WishlistScreen.dart'; 
import 'package:graduation_project/Screens/rooms.dart'; 

// Stateful widget representing the Homepage
class Homepage extends StatefulWidget {
  const Homepage({super.key}); // Constructor with a unique key

  @override
  State<Homepage> createState() => _HomepageState(); // Creates the mutable state for the Homepage
}

// The mutable state class for Homepage
class _HomepageState extends State<Homepage> {
  int _currentIndex = 0; // Tracks the current selected index of the bottom navigation bar
  
  // List of screens to navigate between using the bottom navigation bar
  final tabs = [
    Homescreen(), // Home screen
    Wishlistscreen(), // Wishlist screen
    AdDetailsScreen(), // Add details screen
    Rooms(), // Rooms screen
    ProfileScreen(), // Profile screen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Sets the background color of the screen to white
      
      // AppBar (Part 1)
      appBar: AppBar(
        backgroundColor: Colors.white, // Sets the AppBar background color to white
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer(); 
                // Opens the side drawer when the menu icon is tapped
              },
              icon: Icon(
                Icons.menu, // Menu icon
                size: 30, // Icon size
                color: Color(0xFF519FEE), // Icon color
              ),
            );
          },
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, 'AIModel');
          }, icon: Icon(Icons.smart_toy), color: Color(0xFF519FEE), iconSize: 35,)
          
        ],
      ),
      
      // Side Drawer for navigation (Part 1)
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, // Removes default padding
          children: [
            // Drawer header displaying user information
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF519FEE)), // Background color of the header
              accountName: Text('User_12'), // Displays the username
              accountEmail: Text('User-@gmail.com'), // Displays the user's email
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white, // Background color of the avatar
                child: Icon(
                  Icons.person_outline_rounded, // User icon
                  size: 50, // Icon size
                  color: Color(0xFF519FEE), // Icon color
                ),
              ),
            ),
            // List of navigation options in the drawer
            ListTile(
              leading: Icon(Icons.person), // Icon for "Update Profile"
              title: Text('Update Profile'),
              onTap: () {
                Navigator.pushNamed(context, 'ProfileScreen'); 
                // Navigates to the Profile screen
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_support), // Icon for "Contact Us"
              title: Text('Contact Us'),
              onTap: () {
                Navigator.pushNamed(context, 'ContactUs'); 
                // Navigates to the Contact Us screen
              },
            ),
            ListTile(
              leading: Icon(Icons.feedback_outlined), // Icon for "Report"
              title: Text('Report'),
              onTap: () {
                Navigator.pushNamed(context, 'ReportScreen'); 
                // Navigates to the Report screen
              },
            ),
            ListTile(
              leading: Icon(Icons.logout), // Icon for "Log out"
              title: Text('Log out'),
              onTap: () {
                Navigator.pop(context); 
                // Closes the drawer and logs out
              },
            ),
          ],
        ),
      ),
      
      // Main body content (Part 2)
      body: tabs[_currentIndex], 
      // Displays the screen corresponding to the selected bottom navigation bar index
      
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Tracks the selected index
        type: BottomNavigationBarType.fixed, // Fixed type bar to show all items
        backgroundColor: Color(0xFF519FEE), // Bar background color
        items: [
          // First item: Explore
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined), // Icon for Explore
            backgroundColor: Color(0xFF519FEE), 
            label: 'Explore', // Label for the item
          ),
          // Second item: Wishlist
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite), // Icon for Wishlist
            backgroundColor: Color(0xFF519FEE), 
            label: 'Wishlist', // Label for the item
          ),
          // Third item: Ad Details
          BottomNavigationBarItem(
            icon: Icon(Icons.add), // Icon for Ad Details
            backgroundColor: Color(0xFF519FEE),
            label: 'AD Details', // Label for the item
          ),
          // Fourth item: Rooms
          BottomNavigationBarItem(
            icon: Icon(Icons.business), // Icon for Rooms
            backgroundColor: Color(0xFF519FEE),
            label: 'rooms', // Label for the item
          ),
          // Fifth item: Profile
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Icon for Profile
            label: 'Profile', // Label for the item
            backgroundColor: Color.fromARGB(255, 17, 18, 20),
          ),
        ],
        onTap: (value) {
          setState(() {
            _currentIndex = value; 
            // Updates the current index when a navigation item is tapped
          });
        },
        selectedItemColor: Colors.white, 
        // Color of the selected item's icon and label
      ),
    );
  }
}