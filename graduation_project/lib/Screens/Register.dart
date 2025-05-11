import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart'; // << added import

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  File? _selectedImage;
  bool _passwordInVisible = true;
  bool _password = true;
  String? _selectedGender;
  TextEditingController _dateController = TextEditingController();
  String? _phoneNumber; // << store full phone number
  List<String> _genders = ['Male', 'Female'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF519FEE)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: Icon(
                  Icons.account_circle,
                  color: Color(0xFF519FEE),
                  size: 85,
                ),
              ),
              SizedBox(height: 15),

              // First Name
              _buildLabel('First Name'),
              _buildTextField('First Name', TextInputType.name),

              SizedBox(height: 20),

              // Last Name
              _buildLabel('Last Name'),
              _buildTextField('Last Name', TextInputType.name),

              SizedBox(height: 20),

              // Email
              _buildLabel('Email Address'),
              _buildTextField('Email Address', TextInputType.emailAddress),

              SizedBox(height: 20),

              // Password
              _buildPasswordField('Password', _passwordInVisible, () {
                setState(() {
                  _passwordInVisible = !_passwordInVisible;
                });
              }),

              SizedBox(height: 20),

              // Confirm Password
              _buildPasswordField('Confirm Password', _password, () {
                setState(() {
                  _password = !_password;
                });
              }),

              SizedBox(height: 20),

              // Phone Number (new)
              //_buildLabel('Phone No.'),
              IntlPhoneField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'EG', // Set default country
                languageCode: "en",
                onChanged: (phone) {
                  _phoneNumber = phone.completeNumber;
                  print('Complete Phone Number: $_phoneNumber');
                },
                onCountryChanged: (country) {
                  print('Country changed to: ${country.name}');
                },
              ),

              SizedBox(height: 20),

              // Date of Birth
              _buildLabel('Date of Birth'),
              TextField(
                controller: _dateController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'mm/dd/yyyy',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                  suffixIcon: Icon(
                    Icons.calendar_today,
                    color: Color(0xFF519FEE),
                    size: 25,
                  ),
                  fillColor: Colors.white70,
                  filled: true,
                ),
                readOnly: true,
                onTap: _SelectDate,
              ),

              SizedBox(height: 20),

              // Gender
              _buildLabel('Gender'),
              _buildDropdownField(),

              SizedBox(height: 20),

              // National ID
              _buildLabel('National Id'),
              _buildTextField('National Id', TextInputType.number),

              SizedBox(height: 15),

              // Upload Image
              _buildImageUploadSection(),

              SizedBox(height: 70),

              // Submit button
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'SubmittedSuccessful');
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFF519FEE),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
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

  // Common Widgets
  Widget _buildLabel(String labelText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(labelText),
      ],
    );
  }

  Widget _buildTextField(String hintText, TextInputType keyboardType) {
    return TextField(
      onSubmitted: (value) {
        log(value);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        fillColor: Colors.white70,
        filled: true,
        hintText: hintText,
      ),
      keyboardType: keyboardType,
    );
  }

  Widget _buildPasswordField(String hintText, bool obscureText, VoidCallback toggleVisibility) {
    return TextField(
      obscureText: obscureText,
      onSubmitted: (value) {
        log(value);
      },
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(),
        fillColor: Colors.white,
        filled: true,
        suffixIcon: IconButton(
          onPressed: toggleVisibility,
          icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
        ),
      ),
    );
  }

  Widget _buildDropdownField() {
    return DropdownButton<String>(
      isExpanded: true,
      value: _selectedGender,
      hint: Text('Gender'),
      items: _genders.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedGender = newValue;
        });
      },
    );
  }

  Widget _buildImageUploadSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F3FB),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
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
          ElevatedButton(
            onPressed: _pickImageFromCamera,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF519FEE),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            child: const Text('Add images'),
          ),
          const SizedBox(height: 8),
          _selectedImage != null
              ? Image.file(_selectedImage!)
              : const Text('Please select an image'),
          const Text(
            '5MB maximum file size accepted in the following formats: .jpg .jpeg .png .gif',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10, color: Colors.black38),
          ),
        ],
      ),
    );
  }

  Future<void> _SelectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _dateController.text = pickedDate.toString().split(" ")[0];
      });
    }
  }

  Future<void> _pickImageFromCamera() async {
    final returnImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      _selectedImage = File(returnImage.path);
    });
  }
}
