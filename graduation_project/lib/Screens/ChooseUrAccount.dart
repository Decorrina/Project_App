
import 'package:flutter/material.dart';
import 'package:graduation_project/Screens/ChooseUrAccount.dart';

class ChooseAccountScreen extends StatefulWidget { // This widget represents the Choose Account screen, which allows the user to select their account type
  const ChooseAccountScreen({super.key});// Constructor with a unique key for widget identification

  @override
  _ChooseAccountScreenState createState() => _ChooseAccountScreenState();
}
// Creates the mutable state for this screen
// The mutable state class for ChooseAccountScreen
class _ChooseAccountScreenState extends State<ChooseAccountScreen> {
  String _selectedAccount = 'Student';
 // Default selected account type is "Student"
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set screen background color to white
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF519FEE)),
           // Back arrow icon with specific color
          onPressed: () {
            Navigator.pop(context);
            // Navigates back to the previous screen
          },
        ),
        backgroundColor: Colors.white, // Set AppBar background color to white
        elevation: 0, // Removes the AppBar shadow
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),  // Horizontal padding for the body content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Aligns content to the start of the column
          children: [
            const SizedBox(height: 20), // Adds vertical spacing
            const Text(
              "Choose your Account",
              style: TextStyle(
                fontSize: 22,// Font size for the title
                fontWeight: FontWeight.bold, // Bold font weight
                color: Color(0xFF519FEE), // Title color
              ),
            ),
            const SizedBox(height: 10), // Adds spacing below the title
            const Text(
              "To complete the sign-up process, please make the choice",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 30), // Adds spacing before the account selection options 
             // Radio button for selecting "Student" account type
            RadioListTile(
              title: const Text("Student", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              value: "Student",  // Value associated with this option
              groupValue: _selectedAccount, // Selected option in the group
              onChanged: (value) {
                setState(() {
                  _selectedAccount = value.toString(); 
                   // Updates the selected account type
                });
              },
              activeColor: Color(0xFF519FEE), // Active color for the radio button
            ),

            RadioListTile(
              title: const Text("Owner", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              value: "Owner",
              groupValue: _selectedAccount,
              onChanged: (value) {
                setState(() {
                  _selectedAccount = value.toString();  
                  // Updates the selected account type
                });
              },
              activeColor: Color(0xFF519FEE), // Active color for the radio button
            ),
            const Spacer(), 
            // Pushes the "Next" button to the bottom of the screen 
             // "Next" button to proceed to registration
            SizedBox(
              width: double.infinity,// Button takes full width of the screen
              child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'Register'); 
            // Navigates to the registration screen
          }, 
      
          child: Container( 
            width: double.infinity,
            height: 50,// Height of the button
            decoration: BoxDecoration( 
              color: Color(0xFF519FEE),
              borderRadius: BorderRadius.all(Radius.circular(10)), 
               // Rounded corners for the button
            ), 
            
            child: Center(child: Text('Next', 
             // text Button
             style: TextStyle(color: Colors.white, fontSize: 17),)), 
             // Text style for the button
          ),
        ), 
            ),
            const SizedBox(height: 20), // Adds spacing below the button
          ],
        ),
      ),
    );
  }
}