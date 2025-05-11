import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Bed {
  final int beds;
  final double price;
  const Bed({this.beds = 1, this.price = 450.0});
}
// Main widget for Ad Details Screen
class AdDetailsScreen extends StatefulWidget {
  const AdDetailsScreen({super.key});

  @override
  State<AdDetailsScreen> createState() => _AdDetailsScreenState();
}
// State class for AdDetailsScreen
class _AdDetailsScreenState extends State<AdDetailsScreen> { 
  // List to store Room objects
  List<Bed> bed = const [Bed(), Bed()]; 
   // Set to store selected amenities
  Set<String> selectedAmenities = {}; 
    // Controllers to manage input fields
  final titleController = TextEditingController();
  final areaController = TextEditingController();
  final addressController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final mapLocationController = TextEditingController(); 
   // Variables for floor and resident type
  int floor = 1; // Default floor is 1
  String selectedResidentType = 'Male'; // Default resident type 
   // Variable for storing selected image
  File? _selectedImage;
  // List of amenities to choose from
  static const List<String> amenitiesList = [
    'WiFi',
    'Parking',
    'Air Conditioning',
    'Kitchen',
    'TV',
    'Washing Machine',
  ];
   // List of resident types
  static const List<String> residentTypes = [
    'Male',
    'Female',
    
    
  ];
   // Method to add a new room
  void addRoom() {
    setState(() {
      bed = [...bed, const Bed()];
    });
  }
  // Method to remove a room by index
  void removeRoom(int index) {
    if (bed.length > 1) {
      setState(() {
        List<Bed> newRooms = List.from(bed);
        newRooms.removeAt(index);
        bed = newRooms;
      });
    }
  }
   // Method to update the number of beds in a room
  void updateBeds(int index, bool increment) {
    setState(() {
      final List<Bed> newRooms = List.from(bed);
      final currentBeds = bed[index].beds; 
       // Increment or decrement the number of beds
      newRooms[index] = Bed(
        beds: increment ? currentBeds + 1 : currentBeds > 1 ? currentBeds - 1 : 1,
        price: bed[index].price,
      );
      bed = newRooms;
    });
  }
  // Method to update the price of a room
  void updatePrice(int index, String value) {
    setState(() {
      final List<Bed> newRooms = List.from(bed); 
      // Parse the price value and update the room
      newRooms[index] = Bed(
        beds: bed[index].beds,
        price: double.tryParse(value) ?? bed[index].price,
      );
      bed = newRooms;
    });
  }
   // Method to update the floor number
  void updateFloor(bool increment) {
    setState(() {
      if (increment) {
        floor++; // Increment floor
      } else if (floor > 1) {
        floor--; // Decrement floor only if greater than 1
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header

                const SizedBox(height: 24),// Spacer

                // Image Upload Section
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F3FB),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [ 
                       // Placeholder for image icon
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Icon(
                          Icons.add_photo_alternate_outlined,
                          size: 30,
                          color: Color(0xFF519FEE),
                        ),
                      ),
                      const SizedBox(height: 16), 
                       // Button to pick an image
                      ElevatedButton(
                        onPressed: () { 
                          _pickImageFromGallery(); // Pick image from gallery
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF519FEE),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(21),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 12,
                          ),
                        ),
                        child: const Text('Add images'),
                      ),
                      // Display the selected image or prompt to select 
                      _selectedImage != null ? Image.file(_selectedImage!) :const Text('Please Selected an image'),
                      const SizedBox(height: 8),
                      const Text(
                        '5MB maximum file size accepted in the following formats: .jpg .jpeg .png .gif',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black38,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Title input field
                _buildTextField(
                  label: 'Ad title',
                  controller: titleController,
                ),

                const SizedBox(height: 16),

                // Area input field
                _buildTextField(
                  label: 'Area',
                  controller: areaController,
                ),
                // Remaining UI components like resident type, floor selection, room management, amenities, and text fields are implemented similarly
                // Continue adding comments explaining each section as above
                const SizedBox(height: 16),

                // Resident Type
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Gender',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButton<String>(
                        value: selectedResidentType,
                        isExpanded: true,
                        underline: const SizedBox(),
                        items: residentTypes.map((String type) {
                          return DropdownMenuItem<String>(
                            value: type,
                            child: Text(type),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() {
                              selectedResidentType = newValue;
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Floor
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Floor',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () => updateFloor(false),
                          ),
                          Text(
                            floor.toString(),
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () => updateFloor(true),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),
                const Divider(height: 1, thickness: 2),
                const SizedBox(height: 24),

                // Rooms Section Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Beds (${bed.length})',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF519FEE),
                      ),
                    ),
                    Row(
                      children: [
                        ElevatedButton.icon(
                          onPressed: addRoom,
                          icon: const Icon(Icons.add),
                          label: const Text('Add'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF519FEE),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(34),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Room Cards
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: bed.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                        side: const BorderSide(color: Color(0xFFC4C4C4)),
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                const SizedBox(height: 20),

                                // Price Input
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Price',
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 120,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                          suffix: Text('L.E'),
                                          border: OutlineInputBorder(),
                                        ),
                                        controller: TextEditingController(
                                          text: bed[index].price.toString(),
                                        ),
                                        onChanged: (value) =>
                                            updatePrice(index, value),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          if (bed.length > 1)
                            Positioned(
                              top: 2,
                              right: 2,
                              child: IconButton(
                                icon: const Icon(Icons.close,
                                    color: Colors.red, size: 20),
                                onPressed: () => removeRoom(index),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),

                const Divider(height: 32, thickness: 2),

                // Amenities Section
                const Text(
                  'Amenities',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: amenitiesList.map((amenity) {
                    final isSelected = selectedAmenities.contains(amenity);
                    return FilterChip(
                      label: Text(amenity),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            selectedAmenities.add(amenity);
                          } else {
                            selectedAmenities.remove(amenity);
                          }
                        });
                      },
                      backgroundColor: Colors.white,
                      selectedColor:
                      const Color(0xFF519FEE).withAlpha(51), // 0.2 * 255 ≈ 51
                      checkmarkColor: const Color(0xFF519FEE),
                      side: BorderSide(
                        color:
                        isSelected ? const Color(0xFF519FEE) : Colors.grey,
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 16),

                // Address
                _buildTextField(
                  label: 'Address',
                  controller: addressController,
                ),

                const SizedBox(height: 16),

                // Google Map Location
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Location',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: mapLocationController,
                        decoration: InputDecoration(
                          hintText: 'Enter location',
                          prefixIcon: const Icon(Icons.location_on,
                              color: Color(0xFF519FEE)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Description
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: descriptionController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        border: OutlineInputBorder( 
                          
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ), 
                        labelText: 'Description'
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Price',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade50,
                              borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(9),
                              ),
                            ),
                            child: const Text(
                              'EGP',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: priceController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                border: InputBorder.none,
                                hintText: 'Enter price',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Submit Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () { 
                      Navigator.pushNamed(context, 'SubmittedSuccessful');
                      // Handle submit
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF519FEE),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                         color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
          ),
        ),
      ],
    );
  }
  // Method to pick an image from the gallery

  Future _pickImageFromGallery() async {
   final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery); 
   if (returnedImage == null) return; 
   setState(() {
     _selectedImage = File(returnedImage!.path);// Convert picked image to File
   });
  }
}