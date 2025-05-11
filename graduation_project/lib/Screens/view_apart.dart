import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ViewApart extends StatefulWidget {
  const ViewApart({super.key});

  @override
  State<ViewApart> createState() => _ViewApartState();
}

class _ViewApartState extends State<ViewApart> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section with PageView
            Stack(
              children: [
                SizedBox(
                  height: 424,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        'images/OIP.jfif',
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 19,
                  left: 22,
                  child: IconButton( 
                    // CircleAvatar(backgroundColor:Colors.blueAccent , child: Icon(Icons.arrow_back, color: Colors.white,size:35,),)
                    icon: const Icon(Icons.arrow_back, color:Color(0xFF519FEE),size:27,),
                    color: Colors.black,
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Positioned(
                  top: 18,
                  right: 14,
                  child: IconButton(
                    icon: const CircleAvatar(backgroundColor:Color(0xFF519FEE) , child: Icon(Icons.favorite_border, color: Colors.white,size:27,),),
                    color: Colors.black,
                    onPressed: () {},
                  ),
                ),
                Positioned(
                  top: 92,
                  right: 14,
                  child: IconButton(
                    icon: const CircleAvatar(backgroundColor:Color(0xFF519FEE) , child: Icon(Icons.share, color: Colors.white,size:27,),),
                    color: Colors.black,
                    onPressed: () {},
                  ),
                ),
                Positioned(
                  bottom: 27,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: 5,
                      effect: const WormEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        spacing: 18,
                        dotColor: Color(0x85D8DCDC),
                        activeDotColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Apartment Title
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Apartment In maadi',
                style: GoogleFonts.sen(
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),

            // Location
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                   
                  Icon(Icons.location_on_sharp, weight: 24,color: Color(0xFF519FEE),),
                  const SizedBox(width: 32),
                  Expanded(
                    child: Text(
                      '12 Abrag Othman Corniche El Nile Maadi Apartment 191 19 Th Floor, Maadi',
                      style: GoogleFonts.sen(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Divider(indent: 20, endIndent: 20, height: 40),

            // // Resident Type
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Gender: Male',
                style: GoogleFonts.sen(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            SizedBox(height: 20,), 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Space: 140 Sqft',
                style: GoogleFonts.sen(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const Divider(indent: 20, endIndent: 20, height: 40),

            // Available Rooms 

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Available Beds:',
                    style: GoogleFonts.sen(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Container(
                      width: double.infinity,
                      height: 163,
                      decoration: BoxDecoration(
                        color: const Color(0xFF519FEE),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 4,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 12,
                            left: 17,
                            child: Text(
                              'Bed (1):',
                              style: GoogleFonts.sen(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
        
                          Positioned(
                            top: 101,
                            left: 20,
                            child: Text(
                              'Price 450L.E',
                              style: GoogleFonts.sen(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Divider(indent: 20, endIndent: 20, height: 40),

            // Amenities
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Amenities:',
                    style: GoogleFonts.sen(
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Row(
                      children: [
                        Icon(Icons.wifi, size: 35, color: Color(0xFF519FEE),),
                        const SizedBox(width: 41),
                        Text(
                          'Wifi',
                          style: GoogleFonts.sen(
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ), 

                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Row(
                      children: [
                        Icon(Icons.kitchen_rounded, size: 35, color: Color(0xFF519FEE),),
                        const SizedBox(width: 41),
                        Text(
                          'Shared Kitchen',
                          style: GoogleFonts.sen(
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ), 

                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Row(
                      children: [
                        Icon(Icons.ac_unit, size: 35, color: Color(0xFF519FEE),),
                        const SizedBox(width: 41),
                        Text(
                          'Air Conditioner',
                          style: GoogleFonts.sen(
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ), 

                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Row(
                      children: [
                        Icon(Icons.tv_sharp, size: 35, color: Color(0xFF519FEE),),
                        const SizedBox(width: 41),
                        Text(
                          'Tv',
                          style: GoogleFonts.sen(
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ), 

            const Divider(indent: 20, endIndent: 20, height: 40),

            // Details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description:',
                    style: GoogleFonts.sen(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting',
                    style: GoogleFonts.sen(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),

            const Divider(indent: 20, endIndent: 20, height: 40),

            // Listed By
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Owned by:',
                    style: GoogleFonts.sen(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 22.5,
                            backgroundImage: AssetImage('images/OIP.jfif'),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            'User_12',
                            style: GoogleFonts.sen(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.feedback_outlined, color: Color(0xFF519FEE), size: 35,),
                        onPressed: () {Navigator.pushNamed(context, 'ReportScreen');},
                      ),
                    ],
                  ),
                ],
              ),
           ), 
           Container( 
            decoration: BoxDecoration( 
              color: Color(0xFF519FEE),
            ), 
            width: double.infinity, 
            height: 105, 
            child: Column( 
              children: [  
                SizedBox(height: 13,),
                Text('450L.E Monthly',style: TextStyle(color: Colors.white, fontSize: 20),), 
                 SizedBox(height: 5,),
                 ElevatedButton(
                        onPressed: () {Navigator.pushNamed(context, 'ReservationScreen');},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor:  const Color(0xFF519FEE),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(21),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 12,
                          ),
                        ),
                        child: const Text('Reservation'),
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