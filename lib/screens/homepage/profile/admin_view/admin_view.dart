import 'package:apple_ecommerce/components/buttons/custom_button.dart';
import 'package:apple_ecommerce/data/demo_data.dart';
import 'package:apple_ecommerce/providers/product_provider.dart';
import 'package:apple_ecommerce/screens/auth_screens/widgets/custom_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        child: SingleChildScrollView(
          child: Consumer<ProductProvider>(
              builder: (context, productProvider, child) {
            return Column(
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
                productProvider.pickedImage == null
                    ? GestureDetector(
                        onTap: () {
                          productProvider.pickProductImage();
                        },
                        child: const CircleAvatar(
                          radius: 70,
                          child: Icon(Icons.add),
                        ),
                      )
                    : Column(
                        children: [
                          Image(
                            image: FileImage(productProvider.pickedImage!),
                            height: 140,
                            fit: BoxFit.fitHeight,
                          ),
                          FilledButton(
                              onPressed: () {
                                productProvider.pickProductImage();
                              },
                              child: const Text('Change Image'))
                        ],
                      ),
                CustomTextField(
                    controller: productProvider.nameController,
                    hint: 'Product Name',
                    prefixIcon: Icons.shopping_cart_rounded),
                CustomTextField(
                    controller: productProvider.descriptionController,
                    hint: 'Description',
                    prefixIcon: Icons.description),
                CustomTextField(
                  controller: productProvider.priceController,
                  hint: 'Price',
                  prefixIcon: Icons.price_change,
                  textInputType: TextInputType.number,
                ),
                CustomTextField(
                    controller: productProvider.quantityController,
                    textInputType: TextInputType.number,
                    hint: 'Quntity',
                    prefixIcon: Icons.production_quantity_limits),
                const Text(
                  'Select Product Category',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                        DemoData.categories.length,
                        (index) => Padding(
                              padding: const EdgeInsets.only(left: 2, right: 2),
                              child: InkWell(
                                onTap: () {
                                  productProvider.setSelectCategory(
                                      DemoData.categories[index].name);
                                },
                                child: Chip(
                                    backgroundColor:
                                        productProvider.selectedCategory ==
                                                DemoData.categories[index].name
                                            ? Colors.blue
                                            : Colors.white,
                                    label: Text(
                                      DemoData.categories[index].name,
                                      style: TextStyle(
                                          color: productProvider
                                                      .selectedCategory ==
                                                  DemoData
                                                      .categories[index].name
                                              ? Colors.white
                                              : Colors.black),
                                    )),
                              ),
                            )),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                  size: size,
                  text: 'Add Product',
                  ontap: () {
                    productProvider.startAddProduct(context);
                  },
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
