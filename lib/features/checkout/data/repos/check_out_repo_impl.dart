import 'package:check_out_app/core/errors/failuers.dart';
import 'package:check_out_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/utils/stripe_service.dart';
import 'check_out_repo.dart';

class CheckOutRepoImpl extends CheckOutRepo {
  final StripeService stripeService = StripeService();

  @override
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      await stripeService.makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
