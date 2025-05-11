import 'package:flutter/material.dart';

// Stateful widget for the Search Screen
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key}); // Constructor with a unique key for widget identification

  @override
  _SearchScreenState createState() => _SearchScreenState(); // Creates the mutable state for SearchScreen
}

// The mutable state class for the SearchScreen widget
class _SearchScreenState extends State<SearchScreen> {
  // Variables to store selected filters and price range inputs
  String? selectedResidentType; // Stores selected gender
  String? selectedAmenities; // Stores selected amenities
  String? selectedFloor; // Stores selected floor
  TextEditingController minPriceController = TextEditingController(); // Controller for minimum price input
  TextEditingController maxPriceController = TextEditingController(); // Controller for maximum price input

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Sets the screen background color to white

      // Main body of the screen
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Adds padding around the content
        child: SingleChildScrollView(
          // Ensures the screen is scrollable if the content overflows
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Aligns children to the start of the column
            children: [
              SizedBox(height: 40), // Adds spacing at the top of the screen

              // Back Arrow
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Navigates back to the previous screen
                },
                child: Icon(
                  Icons.arrow_back, // Back arrow icon
                  size: 40, // Icon size
                  color: Color(0xFF519FEE), // Icon color
                ),
              ),
              SizedBox(height: 50), // Adds spacing below the back arrow

              // Title
              Text(
                "Let's Find a room that's\nperfect for you", // Screen title
                style: TextStyle(
                  fontSize: 18, // Font size
                  fontWeight: FontWeight.bold, // Makes the text bold
                ),
              ),
              SizedBox(height: 50), // Adds spacing below the title

              // Location Field (Disabled)
              TextField(
                decoration: InputDecoration(
                  hintText: "Location", // Placeholder text
                  prefixIcon: Icon(Icons.location_on), // Location icon
                  border: OutlineInputBorder(), // Adds a border around the field
                  enabled: false, // Disables the field
                ),
                controller: TextEditingController(text: "Egypt"), // Pre-fills the field with "Egypt"
              ),
              SizedBox(height: 50), // Adds spacing below the location field

              // Resident Type Dropdown
              buildDropdownField(
                "Gender", // Label for the dropdown
                selectedResidentType, // Currently selected value
                ["Male", "Female"], // Dropdown options
                (value) {
                  setState(() {
                    selectedResidentType = value; // Updates the selected value
                  });
                },
              ),
              SizedBox(height: 50), // Adds spacing below the dropdown

              // Amenities Dropdown
              buildDropdownField(
                "Amenities", // Label for the dropdown
                selectedAmenities, // Currently selected value
                ["AC", "Shared Kitchen", "Washing", "Machine", "Wifi", "Tv"], // Dropdown options
                (value) {
                  setState(() {
                    selectedAmenities = value; // Updates the selected value
                  });
                },
              ),
              SizedBox(height: 50), // Adds spacing below the dropdown

              // Floor Dropdown
              buildDropdownField(
                "Floor", // Label for the dropdown
                selectedFloor, // Currently selected value
                ["Ground", "First", "Second", "Third"], // Dropdown options
                (value) {
                  setState(() {
                    selectedFloor = value; // Updates the selected value
                  });
                },
              ),
              SizedBox(height: 50), // Adds spacing below the dropdown

              // Price Range Inputs
              Row(
                children: [
                  // Minimum Price Input
                  Expanded(
                    child: TextField(
                      controller: minPriceController, // Binds the controller to the field
                      keyboardType: TextInputType.number, // Sets keyboard type to number
                      decoration: InputDecoration(
                        labelText: "Price - From", // Label text
                        border: OutlineInputBorder(), // Adds a border around the field
                      ),
                    ),
                  ),
                  SizedBox(width: 10), // Adds spacing between the two fields

                  // Maximum Price Input
                  Expanded(
                    child: TextField(
                      controller: maxPriceController, // Binds the controller to the field
                      keyboardType: TextInputType.number, // Sets keyboard type to number
                      decoration: InputDecoration(
                        labelText: "Price - To", // Label text
                        border: OutlineInputBorder(), // Adds a border around the field
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50), // Adds spacing below the price range inputs

              // Search Button
              SizedBox(
                width: double.infinity, // Makes the button full width
                height: 56, // Sets the button height
                child: ElevatedButton(
                  onPressed: () {
                    // Handle search functionality here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF519FEE), // Button background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Rounded corners for the button
                    ),
                  ),
                  child: const Text(
                    'Search', // Button text
                    style: TextStyle(
                      fontSize: 16, // Font size
                      fontWeight: FontWeight.w600, // Font weight
                      color: Colors.white, // Text color
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build a dropdown field
  Widget buildDropdownField(
      String label, String? selectedValue, List<String> options, ValueChanged<String?> onChanged) {
    return DropdownButtonFormField<String>(
      value: selectedValue, // Currently selected value
      decoration: InputDecoration(
        labelText: label, // Label text
        border: OutlineInputBorder(), // Adds a border around the dropdown
      ),
      items: options
          .map((option) => DropdownMenuItem(
                value: option, // Dropdown value
                child: Text(option), // Dropdown label
              ))
          .toList(),
      onChanged: onChanged, // Callback to handle value changes
    );
  }
}