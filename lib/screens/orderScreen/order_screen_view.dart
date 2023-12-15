import 'package:coffee_shop/screens/orderScreen/order_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreenView extends GetView<OrderScreenController> {
  OrderScreenView({Key? key}) : super(key: key);

   // @override
   // var controller = Get.put(OrderScreenController());

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(OrderScreenController());
    var ordersList = controller.initializeOrdersList();
    print("The values needed to be displayed ${ordersList.length}");
    print("the values that are stored in the order list is ${ordersList}");
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(left: 6.0,right: 6.0,top: 25.0,bottom: 1.0),
        child: Obx(() => ListView.separated(
            itemCount: controller.orders.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 8.0),
                width: MediaQuery.of(context).size.width,
                child: Expanded(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10,left: 5,right: 5,bottom: 10),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: SizedBox(
                                    width: 100,
                                    height: 150,
                                    child: Image.asset(
                                      ordersList[index]["imageName"],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(5),
                                width: MediaQuery.of(context).size.width / 1.65,
                                child: ListView(
                                  physics:  const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  children: [
                                    Text(
                                      "Order Description :- ",
                                      style: TextStyle(
                                        color: Colors.redAccent.shade700,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Your ",
                                              style: TextStyle(
                                                color: Colors.blueAccent.shade700,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "${ordersList[index]["productName"]} (${ordersList[index]["temperature"]})",
                                              style: TextStyle(
                                                color: Colors.purpleAccent.shade700,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(
                                              text: " has been ordered in ",
                                              style: TextStyle(
                                                color: Colors.blueAccent.shade700,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            TextSpan(
                                              text: ordersList[index]["productShopName"],
                                              style: TextStyle(
                                                color: Colors.purpleAccent.shade700,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(
                                              text: " with the quantity of ",
                                              style: TextStyle(
                                                color: Colors.blueAccent.shade700,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "${ordersList[index]["productQuantity"]}",
                                              style: TextStyle(
                                                color: Colors.purpleAccent.shade700,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(
                                              text: " with the estimated price of ",
                                              style: TextStyle(
                                                color: Colors.blueAccent.shade700,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "${ordersList[index]["price"]}",
                                              style: TextStyle(
                                                color: Colors.purpleAccent.shade700,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(
                                              text: " usd with the added ",
                                              style: TextStyle(
                                                color: Colors.blueAccent.shade700,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "${ordersList[index]["sugarCount"]}",
                                              style: TextStyle(
                                                color: Colors.purpleAccent.shade700,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(
                                              text: " sugar cubes and with the added ",
                                              style: TextStyle(
                                                color: Colors.blueAccent.shade700,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "${ordersList[index]["iceCount"]}",
                                              style: TextStyle(
                                                color: Colors.purpleAccent.shade700,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(
                                              text: " ice cube and with the size of each cup is ",
                                              style: TextStyle(
                                                color: Colors.blueAccent.shade700,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            TextSpan(
                                              text: controller.productSize(ordersList[index]["productSize"]),
                                              style: TextStyle(
                                                color: Colors.purpleAccent.shade700,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(
                                              text: " cup and with the cup count of ",
                                              style: TextStyle(
                                                color: Colors.blueAccent.shade700,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "${ordersList[index]["cupCount"]}",
                                              style: TextStyle(
                                                color: Colors.purpleAccent.shade700,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(
                                              text: " and in addition to that of ",
                                              style: TextStyle(
                                                color: Colors.blueAccent.shade700,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            TextSpan(
                                              text: ordersList[index]["cream"],
                                              style: TextStyle(
                                                color: Colors.purpleAccent.shade700,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            TextSpan(
                                              text: " Cream, ",
                                              style: TextStyle(
                                                color: Colors.blueAccent.shade700,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            TextSpan(
                                              text: ordersList[index]["syrup"],
                                              style: TextStyle(
                                                color: Colors.purpleAccent.shade700,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            TextSpan(
                                              text: " ChocoSyrup, ",
                                              style: TextStyle(
                                                color: Colors.blueAccent.shade700,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            TextSpan(
                                              text: ordersList[index]["topping"],
                                              style: TextStyle(
                                                color: Colors.purpleAccent.shade700,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            TextSpan(
                                              text: " toppings. ",
                                              style: TextStyle(
                                                color: Colors.blueAccent.shade700,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        )),
                                    const SizedBox(height: 10),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 30,
                          height: 50,
                          margin: const EdgeInsets.only(top: 8.0,bottom: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.brown,
                          ),
                          child: InkWell(
                            onTap: () {
                              controller.removeOrder(index);
                            },
                            child: const Center(
                              child: Text(
                                "Delete Order",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                ),
              );
            }, separatorBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.all(5),
              height: 2, // You can adjust the height of the divider
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(25),
              ),
            );
          },
          ),
        ),
      ),
    );
  }
}