import 'package:dartz/dartz.dart';

import '../../../../core/errors/failuers.dart';
import '../models/payment_intent_input_model.dart';

abstract class CheckOutRepo {
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  });
}
