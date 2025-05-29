import 'dart:developer';

import 'package:check_out_app/features/checkout/data/models/amount_model/amount_model.dart';
import 'package:check_out_app/features/checkout/data/models/amount_model/details.dart';
import 'package:check_out_app/features/checkout/data/models/item_list_model/item.dart';
import 'package:check_out_app/features/checkout/data/models/item_list_model/item_list_model.dart';
import 'package:check_out_app/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:check_out_app/features/checkout/presentation/views/thank_you_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

import '../../../../../core/utils/api_keys.dart';
import '../../../../../core/widgets/custom_button.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return const ThankYouView();
              },
            ),
          );
        }
        if (state is PaymentFailure) {
          Navigator.of(context).pop(); // Close the bottom sheet
          SnackBar snackBar = SnackBar(content: Text(state.errMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
          onTap: () {
            // PaymentIntentInputModel paymentIntentInputModel =
            //     PaymentIntentInputModel(
            //       amount:
            //           '100', // Amount in cents (e.g., 1050 EGP = 105000 cents)
            //       currency: 'USD',
            //       customerId: 'cus_SNsA0bmLFA6K3n',
            //     );
            // BlocProvider.of<PaymentCubit>(
            //   context,
            // ).makePayment(paymentIntentInputModel: paymentIntentInputModel);
            var transactionsData = getTransctionsData();
            executePaypalPayment(context, transactionsData);
          },
          isLoading: state is PaymentLoading ? true : false,
          text: 'Continue',
        );
      },
    );
  }

  void executePaypalPayment(
    BuildContext context,
    ({AmountModel amount, ItemListModel itemList}) transactionsData,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: ApiKeys.clientId,
          secretKey: ApiKeys.paypalSecretKey,
          transactions: [
            {
              "amount": transactionsData.amount.toJson(),
              "description": "The payment transaction description.",

              "item_list": transactionsData.itemList.toJson(),
            },
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            log("onSuccess: $params");
            Navigator.pop(context);
          },
          onError: (error) {
            log("onError: $error");
            Navigator.pop(context);
          },
          onCancel: () {
            print('cancelled:');
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  ({AmountModel amount, ItemListModel itemList}) getTransctionsData() {
    var amount = AmountModel(
      currency: 'USD',
      total: '100.00',
      details: Details(
        subtotal: '100.00',
        shipping: '0.00',
        shippingDiscount: 0,
      ),
    );
    List<OrderItemModel> orders = [
      OrderItemModel(
        name: 'Apple',
        quantity: 4,
        price: '10.00',
        currency: 'USD',
      ),
      OrderItemModel(
        name: 'Pineapple',
        quantity: 5,
        price: '12.00',
        currency: 'USD',
      ),
    ];
    var itemList = ItemListModel(orders: orders);
    return (amount: amount, itemList: itemList);
  }
}
