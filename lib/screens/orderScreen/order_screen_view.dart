import 'package:coffee_shop/screens/orderScreen/order_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreenView extends GetView<OrderScreenController> {
   OrderScreenView({Key? key}) : super(key: key);

  @override
  var controller = Get.put(OrderScreenController());

  @override
  Widget build(BuildContext context) {
    print("The vlaues needed to be displayed ${controller.orders.length}");
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.yellow,
        padding: const EdgeInsets.only(left: 6.0,right: 6.0,top: 25.0,bottom: 1.0),
        child: ListView.builder(
          itemCount: controller.orders.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(bottom: 8.0),
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
              child: Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Text("the Data index is $index"),
                      Container(
                        width: 25,
                        height: 25,
                        margin: EdgeInsets.only(top: 8.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.amber,
                        ),
                        child: InkWell(
                          onTap: () {
                            controller.removeOrder(index);
                          },
                          child: const Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                )
              ),
            );
          },
        ),
      ),
    );
  }
}