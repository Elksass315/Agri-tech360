class InitPaymentSheetInputMode {
  final String paymentIntentClientSecret;
  final String ephemeralKey;
  final String customerId;

  InitPaymentSheetInputMode(
      {required this.paymentIntentClientSecret,
      required this.ephemeralKey,
      required this.customerId});
}
