import 'package:check_out_app/core/utils/api_service.dart';
import 'package:check_out_app/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';

import '../../features/checkout/data/models/payment_intent_input_model.dart';
import 'api_keys.dart';

class StripeService {
  final ApiService apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKey,
    );

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }
}
