import 'dart:convert';
import 'dart:io';
import 'package:bakery_delivery_web/api/configuration/api_config.dart';
import 'package:http/http.dart';
import 'package:bakery_delivery_web/api/models/responses/vehicle.dart';

class VehicleService {
  Future<List<DeliveryVehicle>> getDeliveryVehicles(String token) async {
    List<DeliveryVehicle> list = [];
    var response =
        await get(Uri.parse(ApiConfig.baseUrl + 'vehicle'), headers: {
      'Content-Type': 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token'
    });
    if (response.statusCode == 200) {
      final vehicles = json.decode(response.body);
      print(vehicles["data"]);
      // final sing = json
      // if (vehicles == null){
      //   return list;
      // }
      vehicles["data"].forEach((vehicle) {
        list.add(DeliveryVehicle(
            displayName: vehicle["displayName"],
            plateNumber: vehicle["plateNumber"],
            vehicleColor: vehicle["vehicleColor"],
            vehicleType: vehicle["vehicleType"]));
      });
      return list;
    } else {
      throw Exception('Failed to get');
    }
  }
}
