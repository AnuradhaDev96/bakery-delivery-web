class DeliveryVehicle {
  String displayName, plateNumber, vehicleColor, vehicleType;
  DeliveryVehicle(
      {required this.displayName,
      required this.plateNumber,
      required this.vehicleColor,
      required this.vehicleType});

  DeliveryVehicle.fromMap(Map<String, dynamic> map)
      : displayName = map["displayName"],
        plateNumber = map["plateNumber"],
        vehicleColor = map["vehicleColor"],
        vehicleType = map["vehicleType"];

  Map<String, dynamic> toMap() {
    return {
      'displayName': displayName,
      'plateNumber': plateNumber,
      'vehicleColor': vehicleColor,
      'vehicleType': vehicleType
    };
  }
}
