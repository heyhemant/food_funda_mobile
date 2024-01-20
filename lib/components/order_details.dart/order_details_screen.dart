import 'package:flutter/material.dart';
import 'package:food_funda_business/components/common/constants/constants.dart';
import 'package:food_funda_business/components/order_details.dart/order_details_controller.dart';
import 'package:food_funda_business/components/order_details.dart/order_model.dart';

class OrderDetailsScreen extends StatefulWidget {
  final Order order;
  const OrderDetailsScreen({super.key, required this.order});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  late OrderDetailsController controller;

  @override
  void initState() {
    controller = OrderDetailsController(order: widget.order);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        toolbarHeight: 100,
        leading: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              size: 25,
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            )),
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order Details #${controller.order.orderId}',
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  widget.order.restaurantName ?? '',
                  style: const TextStyle(
                      fontSize: 14.0, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const Spacer(),
            Text(
              widget.order.orderStatus ?? '',
              style:
                  const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: ListView(
              children: [
                const Text(
                  'Customer Details',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                _buildDetailItem('Customer Name :', widget.order.customerName),
                _buildDetailItem(
                    "Customer Mobile No. :", widget.order.customerPhone),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Orders Details',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                _buildDetailItem('Order Number :', widget.order.orderId),
                _buildDetailItem('Order Value :',
                    (widget.order.orderValue ?? '').toString()),
                _buildDetailItem('Order Date : ', widget.order.orderDate),
                _buildDetailItem('Order Status :', widget.order.orderStatus),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Order Items',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                ...widget.order.orderItems!.map((e) => ListTile(
                      title: RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                            text: '${e.itemName ?? ''}  ',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: '  ${e.variation ?? ''}  ',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text: ' x ${e.itemQuantity ?? '1'}  ',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600),
                          ),
                        ]),
                      ),
                      subtitle: Text(
                        '\u20B9 ${e.itemPrice ?? ''}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400),
                      ),
                      trailing: Text(
                        '\u20B9 ${((e.itemPrice ?? 0) * (e.itemQuantity ?? 1))}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400),
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                _buildOrderModifierButtons(widget.order),
              ],
            )),
      ),
    );
  }

  Widget _buildDetailItem(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(title),
          const Spacer(),
          Text(value ?? ''),
        ],
      ),
    );
  }

  Widget _buildOrderModifierButtons(Order order) {
    switch (order.orderStatus) {
      case Const.PENDING_ORDER_STATUS:
        return Row(children: [
          Expanded(
              child: ElevatedButton(
            onPressed: () async {
              await controller.updateOrderStatus(OrderStatus.approved);
              setState(() {});
            },
            child: const Text(
              'Accept',
              style: TextStyle(color: Colors.black),
            )
          )),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: ElevatedButton(
            onPressed: () {
              controller.updateOrderStatus(OrderStatus.rejected);
              setState(() {});
            },
            child: const Text(
              'Reject',
              style: TextStyle(color: Colors.black),
            ),
          ))
        ]);
      case Const.APPROVED_ORDER_STATUS:
        return Expanded(
            child: ElevatedButton(
          onPressed: () {
            controller.updateOrderStatus(OrderStatus.completed);
            setState(() {});
          },
          child: const Text(
            'Completed',
            style: TextStyle(color: Colors.black),
          )
        ));
      case Const.REJECTED_ORDER_STATUS:
      case Const.CANCELLED_ORDER_STATUS:
      case Const.COMPLETED_ORDER_STATUS:
      default:
        return const SizedBox();
    }
  }
}
