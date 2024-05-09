import 'package:apple_ecommerce/components/buttons/custom_button.dart';
import 'package:apple_ecommerce/screens/auth_screens/widgets/custom_text_fields.dart';
import 'package:flutter/material.dart';

class AdminView extends StatelessWidget {
  const AdminView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Settings'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Add New Product",
              style: TextStyle(
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.w700,
                  fontSize: 22),
            ),
            const SizedBox(
              height: 15,
            ),
            const CircleAvatar(
              radius: 70,
              child: Icon(Icons.add),
            ),
            const CustomTextField(
                hint: 'Product Name', prefixIcon: Icons.shopping_cart_rounded),
            const CustomTextField(
                hint: 'Description', prefixIcon: Icons.description),
            const CustomTextField(
                hint: 'Price', prefixIcon: Icons.price_change),
            const CustomTextField(
                hint: 'Quntity', prefixIcon: Icons.production_quantity_limits),
            const SizedBox(
              height: 15,
            ),
            CustomButton(size: size, text: 'Add Product'),
          ],
        ),
      ),
    );
  }
}
