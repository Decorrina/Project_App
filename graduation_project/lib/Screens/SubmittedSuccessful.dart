import 'package:flutter/material.dart';

// Stateless widget for displaying a successful submission screen
class Submittedsuccessful extends StatelessWidget {
  const Submittedsuccessful({super.key}); // Constructor with a unique key for widget identification

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Sets the background color of the screen to white

      // Main body content
      body: Padding(
        padding: const EdgeInsets.all(13.0), // Adds padding around the content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centers content vertically
          crossAxisAlignment: CrossAxisAlignment.center, // Centers content horizontally
          children: [
            // Image representing a successful submission
            Image.asset(
              'images/Successful.jpg', // Path to the success image
              width: 350, // Sets the image width
              height: 250, // Sets the image height
            ),

            SizedBox(height: 25), // Adds spacing below the image

            // Text for the success message
            Text(
              'Submitted Successful', // Message displayed on the screen
              style: TextStyle(
                fontWeight: FontWeight.bold, // Makes the text bold
                fontSize: 25, // Sets the font size
                color: Colors.grey, // Sets the text color
              ),
            ),

            SizedBox(height: 20), // Adds spacing below the text

            // "Ok" button
            Container(
              width: double.infinity, // Makes the button full width
              height: 60, // Sets the button height
              decoration: BoxDecoration(
                color: Color(0xFF519FEE), // Button background color
                borderRadius: BorderRadius.all(Radius.circular(10)), // Rounded corners for the button
              ),
              child: Center(
                // Centers the button text
                child: Text(
                  'Ok', // Button label
                  style: TextStyle(
                    color: Colors.white, // Button text color
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}