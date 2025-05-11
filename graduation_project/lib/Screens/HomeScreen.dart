import 'package:flutter/material.dart';
//import 'package:share/share.dart';

// Stateless widget for the Home Screen
class Homescreen extends StatelessWidget {
  const Homescreen({super.key}); // Constructor with a unique key for widget identification

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Sets the background color of the screen
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Adds padding around the screen content
        child: SingleChildScrollView(
          // Allows scrolling when the screen content overflows
          child: Column(
            children: [
              SizedBox(height: 20), // Adds vertical spacing
              
              // Search Bar
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'SearchScreen'); 
                  // Navigates to the SearchScreen when the search bar is tapped
                },
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search, // Search icon
                      color: Color(0xFF519FEE), // Icon color
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'SearchScreen'); 
                        // Navigates to the SearchScreen when the filter icon is pressed
                      },
                      icon: Icon(Icons.filter_alt_outlined), // Filter icon
                      color: Color(0xFF519FEE), // Icon color
                    ),
                    hintText: 'Search', // Placeholder text
                    hintStyle: TextStyle(
                      color: Colors.grey, // Placeholder text color
                      fontSize: 20, // Placeholder text size
                      fontWeight: FontWeight.bold, // Bold placeholder text
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35), 
                      // Rounded corners for the search bar
                    ),
                  ),
                ),
              ),
              
              SizedBox(height: 20), // Adds spacing below the search bar
              
              // List of Apartments
              ...List.generate(
                15, 
                // Generates a list of 15 apartment cards
                (index) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'VeiwApart'); 
                    // Navigates to the VeiwApart screen when a card is tapped
                  },
                  child: Container(
                    width: 430, // Sets the width of the card
                    height: 390, // Sets the height of the card
                    margin: EdgeInsets.only(bottom: 15), // Adds margin below each card
                    padding: EdgeInsets.all(16), // Adds padding inside the card
                    decoration: BoxDecoration(
                      color: Colors.white, // Card background color
                      borderRadius: BorderRadius.circular(10), 
                      // Rounded corners for the card
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), 
                          // Shadow color with opacity
                          spreadRadius: 3, // Spread radius of the shadow
                          blurRadius: 10, // Blur radius of the shadow
                          offset: Offset(0, 3), // Shadow position
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, 
                      // Aligns content to the start of the column
                      mainAxisSize: MainAxisSize.min, 
                      // Minimizes the column size to fit its content
                      children: [
                        
                        // Apartment Image with Icons
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0), 
                              // Rounded corners for the image
                              child: Image.asset(
                                'images/OIP.jfif', 
                                // Apartment image loaded from assets
                                height: 200, // Image height
                                width: double.infinity, // Image width
                                fit: BoxFit.fill, // Scale the image to fill its container
                              ),
                            ),
                            Positioned(
                              top: 8.0,
                              right: 8.0,
                              child: CircleAvatar(
                                backgroundColor: Color(0xFF519FEE), 
                                // Favorite icon background color
                                child: Icon(
                                  Icons.favorite_border, 
                                  // Favorite icon
                                  color: Colors.white, // Icon color
                                  size: 27, // Icon size
                                ),
                              ),
                            ),
                            Positioned(
                              top: 54,
                              right: 8.0,
                              child: CircleAvatar(
                                backgroundColor: Color(0xFF519FEE), 
                                // Share icon background color
                                child: IconButton(
                                  onPressed: () {
                             //       Share.share(
                               //       'Check out this amazing post! https://www.youtube.com/');
                                      // Shares the content via the Share package
                                  }, 
                                  icon: Icon(
                                    Icons.share, // Share icon
                                    color: Colors.white, // Icon color
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        
                        SizedBox(height: 12), // Adds spacing below the image
                        
                        // Apartment Title
                        Text(
                          'Apartment In Maadi', 
                          // Title of the apartment
                          style: TextStyle(
                            fontSize: 16.0, // Font size
                            color: Colors.grey[700], // Text color
                          ),
                        ),
                        
                        SizedBox(height: 12), // Adds spacing below the title
                        
                        // Apartment Price
                        Text(
                          'Price Start From 450 L.E/Monthly', 
                          // Price information
                          style: TextStyle(
                            fontSize: 16.0, // Font size
                            color: Colors.grey[700], // Text color
                          ),
                        ),
                        
                        SizedBox(height: 8.0), // Adds spacing below the price
                        
                        // Apartment Details
                        Text(
                          '4 Rooms - 2 Bathrooms - Furnished - 140 Sqft', 
                          // Details of the apartment
                          style: TextStyle(
                            fontSize: 14.0, // Font size
                            color: Colors.grey[600], // Text color
                          ),
                        ),
                        
                        SizedBox(height: 12.0), // Adds spacing below the details
                        
                        // Apartment Location
                        Row(
                          children: [
                            Icon(
                              Icons.location_on, 
                              // Location icon
                              color: Color(0xFF519FEE), // Icon color
                            ),
                            SizedBox(width: 6.0), // Adds spacing between the icon and text
                            Expanded(
                              child: Text(
                                '12 Abraq Othman Corniche El Nile Maadi Apartment 191, 19th Floor, Maadi', 
                                // Location text
                                style: TextStyle(
                                  fontSize: 14.0, // Font size
                                  color: Colors.grey[600], // Text color
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15), // Adds spacing below the list
            ],
          ),
        ),
      ),
    );
  }
}