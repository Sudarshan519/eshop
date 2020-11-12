import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class AdminServices {
  String refcat = "categories";
  String refbrand = 'brand';
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  createCategory(String name) {
    var id = Uuid();
    String categoryId = id.v1();
    _firestore
        .collection('categories')
        .doc(categoryId)
        .set({'categoryName': name});
  }

  createBrand(String name) {
    var id = Uuid();
    String brandsId = id.v1();
    _firestore.collection('brand').doc(brandsId).set({'brandName': name});
  }

  getCategory() =>
    _firestore.collection('categories').get().then((snap) {
      return snap.docs;
    });
  

  getBrand() {
    Stream<QuerySnapshot> snapshot = _firestore.collection('brand').snapshots();
    List brands;
    snapshot.forEach((snap) {
      brands.insert(0, snap.docs);
    });
  }

 Future<List<DocumentSnapshot>> getSuggestionCategory(String suggestion) =>
     _firestore.collection('categories').where('categoryName',isEqualTo: suggestion).get().then((snap) {
      return snap.docs;
    });
uploadProduct({String productName,String brand,String category,int quantity,List sizes,List images,double price}){
   var id = Uuid();
    String categoryId = id.v1();
    _firestore.collection('products').doc(categoryId).set({
      'productName':productName,
      'brand':brand,
      'category':category,
      'quantity':quantity,
      'images':images,
      'price':price
    });
}
}
