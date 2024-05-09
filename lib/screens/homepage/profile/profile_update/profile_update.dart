import 'package:apple_ecommerce/components/buttons/custom_button.dart';
import 'package:apple_ecommerce/screens/auth_screens/widgets/custom_text_fields.dart';
import 'package:flutter/material.dart';

class ProfileUpdate extends StatelessWidget {
  const ProfileUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Update Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                    'https://static-00.iconduck.com/assets.00/profile-circle-icon-2048x2048-cqe5466q.png'),
              ),
              const CustomTextField(hint: 'Name', prefixIcon: Icons.person),
              CustomButton(size: size, text: 'Update Profile'),
            ],
          ),
        ),
      ),
    );
  }
}
