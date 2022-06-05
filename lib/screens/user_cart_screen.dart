import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/cartController.dart';
import 'package:get/get.dart';

class UserCartScreen extends StatelessWidget {
  const UserCartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Cart'),
        ),
        body: GetBuilder<CartController>(
          builder: ((controller) {
            return Column(children: [
              SizedBox(
                height: 500,
                child: ListView.builder(
                    itemCount: controller.selectedProducts.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shadowColor: Colors.blue,
                        elevation: 20,
                        child: ListTile(
                          tileColor: Colors.grey.shade200,
                          leading: Image.network(
                            controller.selectedProducts[index].imageUrl,
                            height: 50,
                            width: 50,
                          ),
                          title: Text(
                              controller.selectedProducts[index].productName),
                          subtitle: Text(controller.selectedProducts[index].price
                              .toString()),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 50,
                                child: TextButton(
                                  onPressed: () {
                                    controller.increaseQuantity(index);
                                  },
                                  child: const Icon(Icons.add_circle,),
                                ),
                              ),
                      
                      
                              // --------------------------------------------------------------------------------------
                              Text(controller.selectedProducts[index].quantity.toString()),
                      
                              // ----------------------------------------------------------------------------------------
                      
                      
                              SizedBox(
                                width: 50,
                                child: TextButton(
                                    onPressed: () {
                                      controller.decreaseQuantity(index);
                                    },
                                    child: Icon(Icons.remove_circle)),
                              ),
                      
                              const SizedBox(
                                width: 20,
                              ),
                      
                              SizedBox(
                                width: 60,
                                child: ElevatedButton(
                                    onPressed: () {
                                      controller.removeProduct(
                                          controller.selectedProducts[index]);
                                    },
                                    child: const Text(
                                      'Remove',
                                      style: TextStyle(
                                          fontSize: 7,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: Card(
                  color: Colors.blue.shade500,
                  elevation: 40,
                  shadowColor: Colors.grey.shade900,
                  child: Text(
                    'Total Price : Rs. ${controller.totalCost}',
                    style: const TextStyle(fontSize: 30.0, color: Colors.white), textAlign: TextAlign.center,
                  ),
                ),
              )
            ]);
          }),
        ));
  }
}
