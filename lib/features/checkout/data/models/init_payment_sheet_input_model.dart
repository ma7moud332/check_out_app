// ignore_for_file: public_member_api_docs, sort_constructors_first
class InitPaymentSheetInputModel {
  String ephemeralKeySecret;
  String clientSecret;
  String customerId;

  InitPaymentSheetInputModel({
    required this.ephemeralKeySecret,
    required this.clientSecret,
    required this.customerId,
  });
}
