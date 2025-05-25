import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/utils/styles.dart' show Styles;
import 'card_info_widget.dart';
import 'payment_item_info.dart';
import 'total_price.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xFFEDEDED),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50 + 16, left: 22, right: 22),
        child: Column(
          children: [
            const Text(
              'Thank you!',
              textAlign: TextAlign.center,
              style: Styles.style25,
            ),
            const SizedBox(height: 2),
            Text(
              'Your transaction was successful',
              textAlign: TextAlign.center,
              style: Styles.style20.copyWith(
                color: Colors.black.withValues(alpha: 204),
              ),
            ),
            const SizedBox(height: 42),
            const PaymentItemInfo(text: 'Date', value: '01/24/2023'),
            const SizedBox(height: 20),
            const PaymentItemInfo(text: 'Time', value: '10:15 AM'),
            const SizedBox(height: 20),
            const PaymentItemInfo(text: 'To', value: 'Sam Louis'),
            const Divider(color: Color(0xFFC6C6C6), thickness: 2, height: 60),
            const TotalPrice(title: 'Total', value: '\$ 100.00'),
            const SizedBox(height: 30),
            const CardInfoWidget(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(FontAwesomeIcons.barcode, size: 64),
                const SizedBox(width: 10),
                Container(
                  width: 113,
                  height: 58,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 1.50,
                        color: Color(0xFF34A853),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'PAID',
                      textAlign: TextAlign.center,
                      style: Styles.style24.copyWith(
                        color: const Color(0xFF34A853),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ((MediaQuery.sizeOf(context).height * 0.2 + 20) / 2) - 29,
            ),
          ],
        ),
      ),
    );
  }
}
