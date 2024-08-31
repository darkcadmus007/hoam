import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hoam_v1/core/resources/colors.dart';

import '../components/appbar_widget.dart';

class HOAProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: 'Member`s Profile',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Information Section
            _buildSectionHeader('Profile Information'),
            _buildProfileInfo(),
            Gap(10.0),
            Divider(
              color: primaryColor,
            ),
            // Administrator Information Section
            Gap(10.0),
            _buildSectionHeader('Administrator Information'),
            _buildAdministratorInfo(),

            // Property Section
            SizedBox(height: 20),
            _buildSectionHeader('Property'),
            _buildPropertyInfo(),
            Gap(10.0),
            Divider(
              color: primaryColor,
            ),
            // Administrator Information Section
            Gap(10.0),
            // Parking Section
            SizedBox(height: 20),
            _buildSectionHeader('Parking'),
            _buildParkingInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Column(
      children: [
        _buildTextRow('Name', 'Joana Doe'),
        _buildTextRow('Email', 'joanadoe@gmail.com'),
        _buildTextRow('Contact Number', '+1234567890'),
        SizedBox(height: 10),
        _buildImageRow('User',
            'https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg'),
      ],
    );
  }

  Widget _buildAdministratorInfo() {
    return Column(
      children: [
        _buildTextRow('Administrator Name', 'HOA App Admin'),
        _buildTextRow('Email', 'admin@example.com'),
        _buildTextRow('Contact Number', '+0987654321'),
      ],
    );
  }

  Widget _buildPropertyInfo() {
    return Column(
      children: [
        _buildTextRow('Property Address', '123 Property St'),
        SizedBox(height: 10),
        _buildImageRow('Property Image',
            'https://cebubestestate.com/wp-content/uploads/2021/03/hoouse.jpg'),
      ],
    );
  }

  Widget _buildParkingInfo() {
    return Column(
      children: [
        _buildTextRow('Parking Address', '456 Parking Ave'),
        SizedBox(height: 10),
        _buildImageRow('Parking Image',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStejc52e1bAq1-CH6-CQ3KpfqcLc4M2Kfs3w&s'),
      ],
    );
  }

  Widget _buildTextRow(String label, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$label:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(text),
      ],
    );
  }

  Widget _buildImageRow(String label, String imagePath) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Image.network(imagePath, height: 150, fit: BoxFit.cover),
      ],
    );
  }
}
