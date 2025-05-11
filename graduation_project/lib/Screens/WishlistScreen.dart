import 'package:flutter/material.dart';
//import 'package:share/share.dart';

// Stateless widget representing the Wishlist screen
class Wishlistscreen extends StatelessWidget {
  const Wishlistscreen({super.key}); // Constructor with a unique key for widget identification

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Sets the screen background color to white

      // Main body content
      body: ListView.builder(
        itemCount: 15, // Number of items in the wishlist
        itemBuilder: (context, index) {
          return Center(
            child: Column(
              children: [
                SizedBox(height: 30), // Adds spacing between wishlist items

                // GestureDetector wraps the apartment card to make it clickable
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'VeiwApart'); 
                    // Navigates to the "View Apartment" screen when tapped
                  },
                  child: Container(
                    width: 430, // Sets the card's width
                    height: 390, // Sets the card's height
                    padding: EdgeInsets.all(16), // Adds padding inside the card
                    decoration: BoxDecoration(
                      color: Colors.white, // Card background color
                      borderRadius: BorderRadius.circular(10), // Rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Shadow color with opacity
                          spreadRadius: 3, // Spread radius of the shadow
                          blurRadius: 10, // Blur radius of the shadow
                          offset: Offset(0, 3), // Offset of the shadow
                        ),
                      ],
                    ),

                    // Card content
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Aligns children to the start of the column
                      mainAxisSize: MainAxisSize.min, // Minimizes the column size to fit its content
                      children: [
                        // Image and Action Icons
                        Stack(
                          children: [
                            // Apartment image with rounded corners
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                'images/OIP.jfif', // Placeholder image from assets
                                height: 200, // Image height
                                width: double.infinity, // Image width
                                fit: BoxFit.fill, // Scales the image to fill its container
                              ),
                            ),

                            // Favorite Icon
                            Positioned(
                              top: 8.0,
                              right: 8.0,
                              child: CircleAvatar(
                                backgroundColor: Color(0xFF519FEE), // Background color of the favorite icon
                                child: Icon(
                                  Icons.favorite, // Favorite icon
                                  color: Colors.red, // Icon color
                                  size: 27, // Icon size
                                ),
                              ),
                            ),

                            // Share Icon
                            Positioned(
                              top: 54,
                              right: 8.0,
                              child: CircleAvatar(
                                backgroundColor: Color(0xFF519FEE), // Background color of the share icon
                                child: IconButton(
                                  onPressed: () {
                                    //Share.share(
                                     // 'Check out this amazing post! https://www.youtube.com/');
                                      // Shares the apartment details when the share button is clicked
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

                        // Apartment title
                        Text(
                          'Apartment In Maadi', // Title of the apartment
                          style: TextStyle(
                            fontSize: 16.0, // Font size
                            color: Colors.grey[700], // Text color
                          ),
                        ),

                        SizedBox(height: 12), // Adds spacing below the title

                        // Apartment price
                        Text(
                          'Price Start From 450 L.E/Monthly', // Price information
                          style: TextStyle(
                            fontSize: 16.0, // Font size
                            color: Colors.grey[700], // Text color
                          ),
                        ),

                        SizedBox(height: 8.0), // Adds spacing below the price

                        // Apartment details
                        Text(
                          '4 Rooms - 2 Bathrooms - Furnished - 140 Sqft', // Details of the apartment
                          style: TextStyle(
                            fontSize: 14.0, // Font size
                            color: Colors.grey[600], // Text color
                          ),
                        ),

                        SizedBox(height: 12.0), // Adds spacing below the details

                        // Apartment location
                        Row(
                          children: [
                            Icon(
                              Icons.location_on, // Location icon
                              color: Color(0xFF519FEE), // Icon color
                            ),
                            SizedBox(width: 6.0), // Spacing between icon and text
                            Expanded(
                              child: Text(
                                '12 Abraq Othman Corniche El Nile Maadi Apartment 191, 19th Floor, Maadi', 
                                // Location description
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
              ],
            ),
          );
        },
      ),
    );
  }
}