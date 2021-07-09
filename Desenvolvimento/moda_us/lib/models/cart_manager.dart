import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moda_us/models/cart_product.dart';
import 'package:moda_us/models/product.dart';
import 'package:moda_us/models/user.dart';
import 'package:moda_us/models/user_manager.dart';

class CartManager{

  List<CartProduct> items = [];

  User user;

  void updateUser(UserManager userManager){
    user = userManager.user;
    items.clear();

    if(user != null){
      _loadCartItems();
    }
  }

  Future<void> _loadCartItems() async {
    final QuerySnapshot cartSnap = await user.cartReference.getDocuments();

    cartSnap.documents.map((d) => CartProduct.fromDocument(d)).toList();

  }


  void addToCart(Product product){
    items.add(CartProduct.fromProduct(product));
  }
    
}