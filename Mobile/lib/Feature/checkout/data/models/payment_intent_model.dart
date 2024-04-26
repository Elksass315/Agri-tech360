class PaymentIntentModel {
  String? id;
  String? object;
  int? amount;
  int? amountCapturable;
  AmountDetails? amountDetails;
  int? amountReceived;
  AutomaticPaymentMethods? automaticPaymentMethods;
  String? captureMethod;
  String? clientSecret;
  String? confirmationMethod;
  int? created;
  String? currency;
  bool? livemode;
  Tip? metadata;

  PaymentMethodOptions? paymentMethodOptions;
  List<String>? paymentMethodTypes;

  String? status;

  PaymentIntentModel({
    this.id,
    this.object,
    this.amount,
    this.amountCapturable,
    this.amountDetails,
    this.amountReceived,
    this.automaticPaymentMethods,
    this.captureMethod,
    this.clientSecret,
    this.confirmationMethod,
    this.created,
    this.currency,
    this.livemode,
    this.metadata,
    this.paymentMethodOptions,
    this.paymentMethodTypes,
    this.status,
  });

  PaymentIntentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    amount = json['amount'];
    amountCapturable = json['amount_capturable'];
    amountDetails = json['amount_details'] != null
        ? AmountDetails.fromJson(json['amount_details'])
        : null;
    amountReceived = json['amount_received'];
    automaticPaymentMethods = json['automatic_payment_methods'] != null
        ? AutomaticPaymentMethods.fromJson(json['automatic_payment_methods'])
        : null;

    captureMethod = json['capture_method'];
    clientSecret = json['client_secret'];
    confirmationMethod = json['confirmation_method'];
    created = json['created'];
    currency = json['currency'];

    livemode = json['livemode'];
    metadata = json['metadata'] != null ? Tip.fromJson(json['metadata']) : null;

    paymentMethodOptions = json['payment_method_options'] != null
        ? PaymentMethodOptions.fromJson(json['payment_method_options'])
        : null;
    paymentMethodTypes = json['payment_method_types'].cast<String>();

    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['object'] = object;
    data['amount'] = amount;
    data['amount_capturable'] = amountCapturable;
    if (amountDetails != null) {
      data['amount_details'] = amountDetails!.toJson();
    }
    data['amount_received'] = amountReceived;

    if (automaticPaymentMethods != null) {
      data['automatic_payment_methods'] = automaticPaymentMethods!.toJson();
    }

    data['capture_method'] = captureMethod;
    data['client_secret'] = clientSecret;
    data['confirmation_method'] = confirmationMethod;
    data['created'] = created;
    data['currency'] = currency;

    data['livemode'] = livemode;
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }

    if (paymentMethodOptions != null) {
      data['payment_method_options'] = paymentMethodOptions!.toJson();
    }
    data['payment_method_types'] = paymentMethodTypes;

    data['status'] = status;

    return data;
  }
}

class AmountDetails {
  Tip? tip;

  AmountDetails({this.tip});

  AmountDetails.fromJson(Map<String, dynamic> json) {
    tip = json['tip'] != null ? Tip.fromJson(json['tip']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tip != null) {
      data['tip'] = tip!.toJson();
    }
    return data;
  }
}

class Tip {
  Tip();

  Tip.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}

class AutomaticPaymentMethods {
  bool? enabled;

  AutomaticPaymentMethods({this.enabled});

  AutomaticPaymentMethods.fromJson(Map<String, dynamic> json) {
    enabled = json['enabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['enabled'] = enabled;
    return data;
  }
}

class PaymentMethodOptions {
  Card? card;

  PaymentMethodOptions({
    this.card,
  });

  PaymentMethodOptions.fromJson(Map<String, dynamic> json) {
    card = json['card'] != null ? Card.fromJson(json['card']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (card != null) {
      data['card'] = card!.toJson();
    }

    return data;
  }
}

class Card {
  String? requestThreeDSecure;

  Card({this.requestThreeDSecure});

  Card.fromJson(Map<String, dynamic> json) {
    requestThreeDSecure = json['request_three_d_secure'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['request_three_d_secure'] = requestThreeDSecure;
    return data;
  }
}
