import 'package:flutter_application_1/model/product_model.dart';
import 'package:flutter_application_1/service/product_service.dart';
import 'package:get/get.dart';

class ShoppingController extends GetxController {
  List<Product> products = <Product>[].obs;
  @override
  void onInit() {
    super.onInit();
    getProductDetails();
  }

  void getProductDetails() async {
    products.assignAll(ProductService().getProducts().toList());
  }
}
