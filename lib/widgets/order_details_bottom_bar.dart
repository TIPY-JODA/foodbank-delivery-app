import 'package:flutter/material.dart';
import 'package:tipy_shop/controllers/global-controller.dart';
import 'package:tipy_shop/controllers/order_details_controller.dart';
import 'package:tipy_shop/utils/theme_colors.dart';
import 'package:get/get.dart';

class Order_details_bottom_bar extends StatefulWidget {
  final String? subTotal;
  final String? deliveryFee;
  final String? total;
  final int? orderID;
  final int? statusCode;
  Order_details_bottom_bar({
    Key? key,
    required this.statusCode,
    required this.orderID,
    this.subTotal,
    this.deliveryFee,
    this.total,
  }) : super(key: key);

  @override
  _Order_details_bottom_barState createState() =>
      _Order_details_bottom_barState();
}

class _Order_details_bottom_barState extends State<Order_details_bottom_bar> {
  String Received_text = "RECEIVED".tr;
  String delivered_text = "DELIVERED".tr;
  var mainHeight, mainWidth;
  var cart_value = 2;

  @override
  Widget build(BuildContext context) {
    final orderDetailsController = Get.put(
      OrderDetailsController(widget.orderID),
    );
    mainWidth = MediaQuery.of(context).size.width;
    mainHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        // color: ThemeColors.off_white_Color,
        color: ThemeColors.baseThemeColor.withOpacity(.1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
      height: mainHeight / 4.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'SUB_TOTAL'.tr,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  Get.find<GlobalController>().currency! +
                      widget.subTotal.toString(),
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),

          //SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'DELIVERY_FEE'.tr,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  Get.find<GlobalController>().currency! +
                      widget.deliveryFee.toString(),
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          //SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "TOTAL_MAIN".tr,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  Get.find<GlobalController>().currency! +
                      widget.total.toString(),
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          // SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.symmetric(vertical: 1),
            width: mainWidth,
            height: 50,
            child:
                widget.statusCode == 20
                    ? Center(
                      child: Text(
                        'COMPLETED'.tr,
                        style: TextStyle(
                          color: ThemeColors.baseThemeColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                    : widget.statusCode! >= 15
                    ? action_button(orderDetailsController)
                    : Container(),
          ),
        ],
      ),
    );
  }

  action_button(orderDetailsController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            //  elevation: 0.0,
            backgroundColor: Colors.black, // background
            foregroundColor: Colors.white, // foreground
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // <-- Radius
            ),
          ),
          onPressed: () async {
            setState(() {
              widget.statusCode == 15
                  ? showAlertDialog(context, orderDetailsController)
                  : showAlertCompletDialog(context, orderDetailsController);
            });
          },
          child: Text(
            widget.statusCode == 15 ? Received_text : delivered_text,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  showAlertDialog(BuildContext context, orderDetailsController) {
    Widget cancelButton = TextButton(
      child: Text("CANCEL".tr),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("YES".tr),
      onPressed: () {
        orderDetailsController.changeStatus('5', widget.orderID);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("RECEIVED?".tr),
      content: Text("ARE_YOU_SURE_YOU_HAVE_RECEIVED_THE_ALL_PRODUCTS".tr),
      actions: [cancelButton, continueButton],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertCompletDialog(BuildContext context, orderDetailsController) {
    Widget cancelButton = TextButton(
      child: Text("CANCEL".tr),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("YES".tr),
      onPressed: () {
        orderDetailsController.orderStatus('20', widget.orderID);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("DELIVERED?".tr),
      content: Text("ARE_YOU_SURE_YOU_HAVE_DELIVERED_THE_ORDER".tr),
      actions: [cancelButton, continueButton],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
