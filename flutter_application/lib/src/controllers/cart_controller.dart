import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../generated/l10n.dart';
import '../models/cart.dart';
import '../repository/cart_repository.dart';
import '../repository/user_repository.dart';

class CartController extends ControllerMVC {
  List<Cart> carts = <Cart>[];
  double taxAmount = 0.0;
  double deliveryFee = 0.0;
  int cartCount = 0;
  double subTotal = 0.0;
  double total = 0.0;
  GlobalKey<ScaffoldState> scaffoldKey;

  CartController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }

  void listenForCarts({String message}) async {
    final Stream<Cart> stream = await getCart();
    stream.listen((Cart _cart) {
      if (!carts.contains(_cart)) {
        setState(() {
          carts.add(_cart);
        });
      }
    }, onError: (a) {
      print(a);
      scaffoldKey?.currentState?.showSnackBar(SnackBar(
        content: Text(S.of(context).verify_your_internet_connection),
      ));
    }, onDone: () {
      if (carts.isNotEmpty) {
        calculateSubtotal();
      }
      if (message != null) {
        scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(message),
        ));
      }
    });
  }

  void listenForCartsCount({String message}) async {
    final Stream<int> stream = await getCartCount();
    stream.listen((int _count) {
      setState(() {
        this.cartCount = _count;
      });
    }, onError: (a) {
      print(a);
      scaffoldKey?.currentState?.showSnackBar(SnackBar(
        content: Text(S.of(context).verify_your_internet_connection),
      ));
    });
  }

  Future<void> refreshCarts() async {
    listenForCarts(message: S.of(context).carts_refreshed_successfuly);
  }

  void removeFromCart(Cart _cart) async {
    setState(() {
      this.carts.remove(_cart);
    });
    removeCart(_cart).then((value) {
      calculateSubtotal();
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(S.of(context).the_product_was_removed_from_your_cart(_cart.product.name)),
      ));
    });
  }

  void calculateSubtotal() async {
    subTotal = 0;
    carts.forEach((cart) {
      subTotal += cart.product.price;
      cart.options.forEach((element) {
        subTotal += element.price;
      });
      subTotal *= cart.quantity;
    });
    deliveryFee = carts[0].product.market.deliveryFee;
    taxAmount = (subTotal + deliveryFee) * carts[0].product.market.defaultTax / 100;
    total = subTotal + taxAmount + deliveryFee;
    setState(() {});
  }

  incrementQuantity(Cart cart) {
    if (cart.quantity <= 99) {
      ++cart.quantity;
      updateCart(cart);
      calculateSubtotal();
    }
  }

  decrementQuantity(Cart cart) {
    if (cart.quantity > 1) {
      --cart.quantity;
      updateCart(cart);
      calculateSubtotal();
    }
  }

  void goCheckout(BuildContext context) {
    if (!currentUser.value.profileCompleted()) {
      scaffoldKey?.currentState?.showSnackBar(SnackBar(
        content: Text(S.of(context).completeYourProfileDetailsToContinue),
        action: SnackBarAction(
          label: S.of(context).settings,
          textColor: Theme.of(context).accentColor,
          onPressed: () {
            Navigator.of(context).pushNamed('/Settings');
          },
        ),
      ));
    } else {
      if (carts[0].product.market.closed) {
        scaffoldKey?.currentState?.showSnackBar(SnackBar(
          content: Text(S.of(context).this_market_is_closed_),
        ));
      } else {
        Navigator.of(context).pushNamed('/DeliveryPickup');
      }
    }
  }
}
