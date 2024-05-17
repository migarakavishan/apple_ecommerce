import 'package:cloud_firestore/cloud_firestore.dart';

class ProductController {
  CollectionReference productCollection =
      FirebaseFirestore.instance.collection('Products');
}
