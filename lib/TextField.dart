import 'package:flutter/material.dart';

class Textfieldstask extends StatefulWidget {
  const Textfieldstask({super.key});

  @override
  _TextfieldstaskState createState() => _TextfieldstaskState();
}

class _TextfieldstaskState extends State<Textfieldstask> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name cannot be empty';
    } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return 'Only Alphabet Is Allowed in Name';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (!RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#\$%^&*(),.?":{}|<>]).{8,}$')
        .hasMatch(value)) {
      return 'Password must contain letters, numbers, and symbols';
    }
    return null;
  }

  String? validateCNIC(String? value) {
    if (value == null || value.isEmpty) {
      return 'CNIC cannot be empty';
    } else if (value.length != 13) {
      return 'CNIC must be exactly 13 digits';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Enter a valid CNIC';
    }
    return null;
  }

  String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Address cannot be empty';
    }
    return null;
  }

  String? validateContact(String? value) {
    if (value == null || value.isEmpty) {
      return 'Contact number cannot be empty';
    } else if (!RegExp(r'^[0-9]{10,12}$').hasMatch(value)) {
      return 'Enter a valid contact number (10-12 digits)';
    }
    return null;
  }

  Widget buildTextField(String label, String? Function(String?) validator) {
    return Container(
      width: 300,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color: Colors.green,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color: Colors.blueAccent,
            ),
          ),
        ),
        validator: validator,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Field Validation"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Text(
                  "TEXT FIELD VALIDATION",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                buildTextField("Name", validateName),
                SizedBox(height: 20),
                buildTextField("Email", validateEmail),
                SizedBox(height: 20),
                buildTextField("Password", validatePassword),
                SizedBox(height: 20),
                buildTextField("Contact Number", validateContact),
                SizedBox(height: 20),
                buildTextField("Address", validateAddress),
                SizedBox(height: 20),
                buildTextField("CNIC", validateCNIC),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
