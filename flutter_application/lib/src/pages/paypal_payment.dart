import 'package:flutter/material.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../generated/l10n.dart';
import '../controllers/paypal_controller.dart';
import '../models/route_argument.dart';

// ignore: must_be_immutable
class PayPalPaymentWidget extends StatefulWidget {
  RouteArgument routeArgument;
  PayPalPaymentWidget({Key key, this.routeArgument}) : super(key: key);
  @override
  _PayPalPaymentWidgetState createState() => _PayPalPaymentWidgetState();
}

class _PayPalPaymentWidgetState extends StateMVC<PayPalPaymentWidget> {
  PayPalController _con;
  _PayPalPaymentWidgetState() : super(PayPalController()) {
    _con = controller;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          S.of(context).paypal_payment,
          style: Theme.of(context).textTheme.headline6.merge(TextStyle(letterSpacing: 1.3)),
        ),
      ),
      body: Stack(
        children: <Widget>[
          InAppWebView(
            initialUrl: _con.url,
            initialHeaders: {},
            initialOptions: new InAppWebViewWidgetOptions(),
            onWebViewCreated: (InAppWebViewController controller) {
              _con.webView = controller;
            },
            onLoadStart: (InAppWebViewController controller, String url) {
              setState(() {
                _con.url = url;
              });
              if (url == "${GlobalConfiguration().getString('base_url')}payments/paypal") {
                Navigator.of(context).pushReplacementNamed('/Pages', arguments: 3);
              }
            },
            onProgressChanged: (InAppWebViewController controller, int progress) {
              setState(() {
                _con.progress = progress / 100;
              });
            },
          ),
          _con.progress < 1
              ? SizedBox(
                  height: 3,
                  child: LinearProgressIndicator(
                    value: _con.progress,
                    backgroundColor: Theme.of(context).accentColor.withOpacity(0.2),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
