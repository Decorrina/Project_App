import 'dart:developer'; 
import 'package:flutter/material.dart';
import 'package:graduation_project/Screens/ChooseUrAccount.dart'; 
import 'package:graduation_project/Screens/Register.dart'; 

// Stateful widget for the Login screen
class Login extends StatefulWidget {
  const Login({super.key}); // Constructor with a unique key for widget identification

  @override
  State<Login> createState() => _LoginState(); // Creates the mutable state for the Login screen
}

// The mutable state class for the Login widget
class _LoginState extends State<Login> {
  bool _passwordInVisible = true; 
  // Tracks whether the password field is visible or hidden

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 247, 247), 
      // Sets the background color of the Login screen
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF519FEE)), 
          // Back arrow icon with a custom color
          onPressed: () {
            Navigator.pop(context); 
            // Navigates back to the previous screen when the back button is pressed
          },
        ),
      ),

      // Main body content wrapped inside a centered card
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(24), // Adds margin around the card
          child: Padding(
            padding: const EdgeInsets.all(24.0), // Adds padding inside the card
            child: Column(
              mainAxisSize: MainAxisSize.min, 
              // Minimizes the column size to fit its content
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
              // Distributes children evenly with equal spacing
              children: [
                _image(context), // Displays the app logo
                _header(context), // Displays the "Login" header
                _inputField(context), // Input fields for username and password
                _forgotPassword(context), // "Forgot password?" button
                _signup(context), // "Sign up" and terms & conditions section
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget to display the app logo
  Widget _image(BuildContext context) {
    return const Column(
      children: [
        Image(
          image: AssetImage('images/LogoStudentHousingHub.png'), 
          // Loads the logo image from the assets folder
          height: 170, // Sets the height of the image
          width: 300, // Sets the width of the image
        ),
        SizedBox(height: 10), // Adds spacing below the image
      ],
    );
  }

  // Widget to display the "Login" header
  Widget _header(BuildContext context) {
    return const Column(
      children: [
        Text(
          "Login", // Screen header text
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold), 
          // Sets font size and makes the text bold
        ),
      ],
    );
  }

  // Widget for the input fields (username and password)
  Widget _inputField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch, 
      // Stretches input fields to fill the available width
      children: [
        // Username input field
        TextField(
          onSubmitted: (value) {
            log(value); // Logs the entered username
          },
          decoration: InputDecoration(
            hintText: "Enter Your Username", // Placeholder text
            labelText: 'Username', // Input field label
            border: const OutlineInputBorder(), 
            // Adds a border around the input field
            fillColor: Colors.white, // Background color of the field
            filled: true, // Ensures the field is filled with the background color
          ),
        ),
        const SizedBox(height: 10), // Adds spacing between fields

        // Password input field
        TextField(
          onSubmitted: (value) {
            log(value); // Logs the entered password
          },
          obscureText: _passwordInVisible, // Toggles visibility of the password
          decoration: InputDecoration(
            hintText: "Enter Your Password", // Placeholder text
            labelText: 'Password', // Input field label
            border: const OutlineInputBorder(),
            fillColor: Colors.white, // Background color of the field
            filled: true, // Ensures the field is filled with the background color
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _passwordInVisible = !_passwordInVisible; 
                  // Toggles the password visibility
                });
              },
              icon: Icon(
                _passwordInVisible ? Icons.visibility_off : Icons.visibility, 
                // Changes the icon based on password visibility
              ),
            ),
          ),
        ),
        const SizedBox(height: 10), // Adds spacing below the password field

        // Login button
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'HomePage'); 
            // Navigates to the HomePage screen when the button is clicked
          },
          child: Container(
            width: double.infinity, // Makes the button full width
            height: 50, // Sets the button height
            decoration: BoxDecoration(
              color: Color(0xFF519FEE), // Button background color
              borderRadius: const BorderRadius.all(Radius.circular(10)), 
              // Adds rounded corners to the button
            ),
            child: const Center(
              child: Text(
                'Login', // Button text
                style: TextStyle(color: Colors.white), 
                // Sets the text color to white
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Widget for the "Forgot password?" button
  Widget _forgotPassword(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Add functionality for forgot password
      },
      child: const Text(
        "Forgot password?", // Button text
        style: TextStyle(color: Color(0xFF519FEE)), 
        // Sets the text color to match the theme
      ),
    );
  }

  // Widget for the "Sign up" and terms & conditions section
  Widget _signup(BuildContext context) {
    return Column(
      children: [
        // Row for "Sign up" button
        Row(
          mainAxisAlignment: MainAxisAlignment.center, 
          // Aligns content to the center
          children: [
            const Text("Don't have an account?"), // Static text
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ChooseAccountScreen(); 
                  // Navigates to the account selection screen
                }));
              },
              child: const Text(
                "Sign Up", // Button text
                style: TextStyle(color: Color(0xFF519FEE)), 
                // Sets the text color to match the theme
              ),
            ),
          ],
        ),
        const SizedBox(height: 10), // Adds spacing below the row

        // Terms and conditions text
        const Text("By creating an account or signing you"),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, 
            // Aligns content to the center
            children: [
              const Text("agree to our"), // Static text
              TextButton(
                onPressed: () {
                  // Add functionality for Terms and Conditions
                },
                child: const Text(
                  "Terms and Conditions", // Button text
                  style: TextStyle(color: Color(0xFF519FEE)), 
                  // Sets the text color to match the theme
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}