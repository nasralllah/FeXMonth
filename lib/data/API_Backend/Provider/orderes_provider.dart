import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../../utils/app_constants.dart';
import 'package:http/http.dart' as http;

import '../Models/order_model.dart';



class OrderProvider extends ChangeNotifier{

  Future<List<Order>> fetchOrders(String api) async {
    final response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      // Successful GET request
      final jsonData = json.decode(response.body);
      List<Order> orders = [];

      for (var item in jsonData['data']) {
        orders.add(Order.fromJson(item));
      }

      return orders;
    } else {
      // Failed to fetch data
      throw Exception('Failed to fetch orders');
    }
  }
  void getOrderData() async {
    try {
      List<Order> orders = await fetchOrders('http://10.0.1.1:8000/api/orders');
      // Process the retrieved orders here
      for (var order in orders) {
        print('Order Code: ${order.code}');
        print('Order Status: ${order.status}');
        print('Shipping Type: ${order.shippingType}');
        print('Cost: ${order.cost}');
        print('Shipping Cost: ${order.shippingCost}');
        print('Discount: ${order.discount}');
        print('Total Cost: ${order.totalCost}');
        print('Created At: ${order.createdAt}');
        print('---');
      }
    } catch (e) {
      // Handle any errors that occur during the GET request
      print('Error: $e');
    }
  }

  Future<dynamic> fetchData(String apiUrl) async {
final response = await http.get(Uri.parse(apiUrl));

if (response.statusCode == 200) {
// Successful GET request
final jsonData = json.decode(response.body);
return jsonData;
} else {
// Failed to fetch data
throw Exception('Failed to fetch data');
}
}

}