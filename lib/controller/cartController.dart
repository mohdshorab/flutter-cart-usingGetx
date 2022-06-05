import 'package:flutter_application_1/model/product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  List<Product> selectedProducts = <Product>[].obs;


  void addProduct(Product product) {
    
    selectedProducts.add(product);
    update();
  }

  void removeProduct(Product product) {
    selectedProducts.remove(product);
    update();
  }

  void increaseQuantity(index){
    selectedProducts[index].quantity++;
    selectedProducts[index].quantityPrice = selectedProducts[index].price * selectedProducts[index].quantity;
    update();
  }

  void decreaseQuantity(index){
    if(selectedProducts[index].quantity>1){
    selectedProducts[index].quantity--;
    }
    selectedProducts[index].quantityPrice = selectedProducts[index].price * selectedProducts[index].quantity;
    update();
  }

  double get totalCost => selectedProducts.fold(
      0, (total, selectedProduct) => total + selectedProduct.quantityPrice);
}
