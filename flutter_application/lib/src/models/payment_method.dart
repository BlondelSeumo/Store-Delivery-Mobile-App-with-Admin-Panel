import 'package:flutter/widgets.dart';

import '../../generated/l10n.dart';

class PaymentMethod {
  String id;
  String name;
  String description;
  String logo;
  String route;
  bool isDefault;

  PaymentMethod(this.id, this.name, this.description, this.route, this.logo, {this.isDefault = false});
}

class PaymentMethodList {
  List<PaymentMethod> _paymentsList;
  List<PaymentMethod> _cashList;
  List<PaymentMethod> _pickupList;

  PaymentMethodList(BuildContext context) {
    this._paymentsList = [
      new PaymentMethod("visacard", S.of(context).visa_card, S.of(context).click_to_pay_with_your_visa_card, "/Checkout", "assets/img/visacard.png",
          isDefault: true),
      new PaymentMethod("mastercard", S.of(context).mastercard, S.of(context).click_to_pay_with_your_mastercard, "/Checkout", "assets/img/mastercard.png"),
      new PaymentMethod("paypal", S.of(context).paypal, S.of(context).click_to_pay_with_your_paypal_account, "/PayPal", "assets/img/paypal.png"),
    ];
    this._cashList = [
      new PaymentMethod("cod", S.of(context).cash_on_delivery, S.of(context).click_to_pay_cash_on_delivery, "/CashOnDelivery", "assets/img/cash.png"),
    ];
    this._pickupList = [
      new PaymentMethod("pop", S.of(context).pay_on_pickup, S.of(context).click_to_pay_on_pickup, "/PayOnPickup", "assets/img/pay_pickup.png"),
    ];
  }

  List<PaymentMethod> get paymentsList => _paymentsList;
  List<PaymentMethod> get cashList => _cashList;
  List<PaymentMethod> get pickupList => _pickupList;
}
