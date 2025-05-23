import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'order_info_item.dart';
import 'payment_method_list_view.dart';
import 'total_price.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 25),
          Expanded(child: Image.asset('assets/images/basket_image.png')),
          const SizedBox(height: 25),
          const OrderInfoItem(title: 'Order Subtotal', value: '1000 EGP'),
          const SizedBox(height: 3),
          const OrderInfoItem(title: 'Discount', value: '0 EGP'),
          const SizedBox(height: 3),
          const OrderInfoItem(title: 'Shipping', value: '50 EGP'),
          const Divider(height: 34, color: Colors.grey, thickness: 2),
          const TotalPrice(title: 'Total', value: '1050 EGP'),
          const SizedBox(height: 16),
          CustomButton(
            text: ' Proceed to Payment',
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const PaymentDetailsView(),
              //   ),
              // );
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const PaymentMethodsButtomSheet();
                },
              );
            },
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class PaymentMethodsButtomSheet extends StatelessWidget {
  const PaymentMethodsButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16),
          PaymentMethodsListView(),
          SizedBox(height: 32),
          CustomButton(text: 'Continue'),
        ],
      ),
    );
  }
}
