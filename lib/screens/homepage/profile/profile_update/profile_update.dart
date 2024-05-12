import 'package:apple_ecommerce/components/buttons/custom_button.dart';
import 'package:apple_ecommerce/providers/user_provider.dart';
import 'package:apple_ecommerce/screens/auth_screens/widgets/custom_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        child: Consumer<UserProvider>(builder: (context, userProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            image: userProvider.pickedImage == null
                                ? DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        NetworkImage(userProvider.user!.image))
                                : DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        FileImage(userProvider.pickedImage!)),
                            shape: BoxShape.circle,
                            color: Colors.grey),
                      ),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: () {
                              userProvider.pickProfilePicture();
                            },
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.black.withOpacity(0.5),
                              child: const Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                CustomTextField(
                  hint: 'Name',
                  prefixIcon: Icons.person,
                  controller: userProvider.nameUpdateController,
                ),
                CustomButton(
                  size: size,
                  text: 'Update Profile',
                  ontap: () {
                    userProvider.startUserUpdate(context);
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
