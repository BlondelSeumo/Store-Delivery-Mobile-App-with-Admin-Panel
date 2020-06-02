import 'dart:convert';
import 'dart:io';

import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;

import '../helpers/custom_trace.dart';
import '../helpers/helper.dart';
import '../models/credit_card.dart';
import '../models/order.dart';
import '../models/order_status.dart';
import '../models/payment.dart';
import '../models/user.dart';
import '../repository/user_repository.dart' as userRepo;

Future<Stream<Order>> getOrders() async {
  User _user = userRepo.currentUser.value;
  if (_user.apiToken == null) {
    return new Stream.value(null);
  }
  final String _apiToken = 'api_token=${_user.apiToken}&';
  final String url =
      '${GlobalConfiguration().getString('api_base_url')}orders?${_apiToken}with=user;productOrders;productOrders.product;productOrders.options;orderStatus&search=user.id:${_user.id}&searchFields=user.id:=&orderBy=id&sortedBy=desc';
  try {
    final client = new http.Client();
    final streamedRest = await client.send(http.Request('get', Uri.parse(url)));

    return streamedRest.stream.transform(utf8.decoder).transform(json.decoder).map((data) => Helper.getData(data)).expand((data) => (data as List)).map((data) {
      return Order.fromJSON(data);
    });
  } catch (e) {
    print(CustomTrace(StackTrace.current, message: url).toString());
    return new Stream.value(new Order.fromJSON({}));
  }
}

Future<Stream<Order>> getOrder(orderId) async {
  User _user = userRepo.currentUser.value;
  if (_user.apiToken == null) {
    return new Stream.value(null);
  }
  final String _apiToken = 'api_token=${_user.apiToken}&';
  final String url =
      '${GlobalConfiguration().getString('api_base_url')}orders/$orderId?${_apiToken}with=user;productOrders;productOrders.product;orderStatus;deliveryAddress';
  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', Uri.parse(url)));

  return streamedRest.stream.transform(utf8.decoder).transform(json.decoder).map((data) => Helper.getData(data)).map((data) {
    return Order.fromJSON(data);
  });
}

Future<Stream<Order>> getRecentOrders() async {
  User _user = userRepo.currentUser.value;
  if (_user.apiToken == null) {
    return new Stream.value(null);
  }
  final String _apiToken = 'api_token=${_user.apiToken}&';
  final String url =
      '${GlobalConfiguration().getString('api_base_url')}orders?${_apiToken}with=user;productOrders;productOrders.product;orderStatus&search=user.id:${_user.id}&searchFields=user.id:=&orderBy=updated_at&sortedBy=desc&limit=3';

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', Uri.parse(url)));

  return streamedRest.stream.transform(utf8.decoder).transform(json.decoder).map((data) => Helper.getData(data)).expand((data) => (data as List)).map((data) {
    return Order.fromJSON(data);
  });
}

Future<Stream<OrderStatus>> getOrderStatus() async {
  User _user = userRepo.currentUser.value;
  if (_user.apiToken == null) {
    return new Stream.value(null);
  }
  final String _apiToken = 'api_token=${_user.apiToken}';
  final String url = '${GlobalConfiguration().getString('api_base_url')}order_statuses?$_apiToken';

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', Uri.parse(url)));

  return streamedRest.stream.transform(utf8.decoder).transform(json.decoder).map((data) => Helper.getData(data)).expand((data) => (data as List)).map((data) {
    return OrderStatus.fromJSON(data);
  });
}

Future<Order> addOrder(Order order, Payment payment) async {
  User _user = userRepo.currentUser.value;
  if (_user.apiToken == null) {
    return new Order();
  }
  CreditCard _creditCard = await userRepo.getCreditCard();
  order.user = _user;
  order.payment = payment;
  final String _apiToken = 'api_token=${_user.apiToken}';
  final String url = '${GlobalConfiguration().getString('api_base_url')}orders?$_apiToken';
  final client = new http.Client();
  Map params = order.toMap();
  params.addAll(_creditCard.toMap());
  final response = await client.post(
    url,
    headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    body: json.encode(params),
  );
  return Order.fromJSON(json.decode(response.body)['data']);
}
