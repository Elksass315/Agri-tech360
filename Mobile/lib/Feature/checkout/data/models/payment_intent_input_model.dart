class PaymentIntentInputModel {
  final String amount;
  final String currency;

  final String customerId;

  PaymentIntentInputModel(
      {required this.customerId, required this.amount, required this.currency});

  Map<String, dynamic> toJson() {
    // Parse the amount string to double, multiply by 100, and then convert back to string
    final int multipliedAmount = (double.parse(amount) * 100).toInt();

    return {
      "amount": multipliedAmount.toString(),
      "currency": currency,
      "customer": customerId
    };
  }
}
// Create User Id When Login or signup
