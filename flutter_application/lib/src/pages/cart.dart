import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../generated/l10n.dart';
import '../controllers/cart_controller.dart';
import '../elements/CartItemWidget.dart';
import '../elements/EmptyCartWidget.dart';
import '../helpers/helper.dart';
import '../models/route_argument.dart';

class CartWidget extends StatefulWidget {
  final RouteArgument routeArgument;
  CartWidget({Key key, this.routeArgument}) : super(key: key);

  @override
  _CartWidgetState createState() => _CartWidgetState();
}

class _CartWidgetState extends StateMVC<CartWidget> {
  CartController _con;

  _CartWidgetState() : super(CartController()) {
    _con = controller;
  }

  @override
  void initState() {
    _con.listenForCarts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: _con.scaffoldKey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              if (widget.routeArgument.param == '/Product') {
                Navigator.of(context).pushReplacementNamed('/Product', arguments: RouteArgument(id: widget.routeArgument.id));
              } else {
                Navigator.of(context).pushReplacementNamed('/Pages', arguments: 2);
              }
            },
            icon: Icon(Icons.arrow_back),
            color: Theme.of(context).hintColor,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            S.of(context).cart,
            style: Theme.of(context).textTheme.headline6.merge(TextStyle(letterSpacing: 1.3)),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: _con.refreshCarts,
          child: _con.carts.isEmpty
              ? EmptyCartWidget()
              : Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 150),
                      padding: EdgeInsets.only(bottom: 15),
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 20, right: 10),
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(vertical: 0),
                                leading: Icon(
                                  Icons.shopping_cart,
                                  color: Theme.of(context).hintColor,
                                ),
                                title: Text(
                                  S.of(context).shopping_cart,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                subtitle: Text(
                                  S.of(context).verify_your_quantity_and_click_checkout,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ),
                            ),
                            ListView.separated(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              primary: false,
                              itemCount: _con.carts.length,
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 15);
                              },
                              itemBuilder: (context, index) {
                                return CartItemWidget(
                                  cart: _con.carts.elementAt(index),
                                  heroTag: 'cart',
                                  increment: () {
                                    _con.incrementQuantity(_con.carts.elementAt(index));
                                  },
                                  decrement: () {
                                    _con.decrementQuantity(_con.carts.elementAt(index));
                                  },
                                  onDismissed: () {
                                    _con.removeFromCart(_con.carts.elementAt(index));
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: 185,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                            boxShadow: [BoxShadow(color: Theme.of(context).focusColor.withOpacity(0.15), offset: Offset(0, -2), blurRadius: 5.0)]),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 40,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      S.of(context).subtotal,
                                      style: Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                  Helper.getPrice(_con.subTotal, context, style: Theme.of(context).textTheme.subtitle1)
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      S.of(context).delivery_fee,
                                      style: Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                  Helper.getPrice(_con.carts[0].product.market.deliveryFee, context, style: Theme.of(context).textTheme.subtitle1)
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      '${S.of(context).tax} (${_con.carts[0].product.market.defaultTax}%)',
                                      style: Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                  Helper.getPrice(_con.taxAmount, context, style: Theme.of(context).textTheme.subtitle1)
                                ],
                              ),
                              SizedBox(height: 10),
                              Stack(
                                fit: StackFit.loose,
                                alignment: AlignmentDirectional.centerEnd,
                                children: <Widget>[
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width - 40,
                                    child: FlatButton(
                                      onPressed: () {
                                        _con.goCheckout(context);
                                      },
                                      disabledColor: Theme.of(context).focusColor.withOpacity(0.5),
                                      padding: EdgeInsets.symmetric(vertical: 14),
                                      color:
                                          !_con.carts[0].product.market.closed ? Theme.of(context).accentColor : Theme.of(context).focusColor.withOpacity(0.5),
                                      shape: StadiumBorder(),
                                      child: Text(
                                        S.of(context).checkout,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(color: Theme.of(context).primaryColor),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Helper.getPrice(
                                      _con.total,
                                      context,
                                      style: Theme.of(context).textTheme.headline4.merge(TextStyle(color: Theme.of(context).primaryColor)),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
