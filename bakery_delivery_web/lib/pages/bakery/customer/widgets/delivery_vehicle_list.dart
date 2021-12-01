import 'package:bakery_delivery_web/api/models/responses/vehicle.dart';
import 'package:bakery_delivery_web/api/services/vehicle.dart';
import 'package:bakery_delivery_web/pages/authentication/widgets/custome_raised_button.dart';
import 'package:bakery_delivery_web/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeliveryVehiclesList extends StatefulWidget {
  const DeliveryVehiclesList({Key? key}) : super(key: key);

  @override
  _DeliveryVehiclesListState createState() => _DeliveryVehiclesListState();
}

class _DeliveryVehiclesListState extends State<DeliveryVehiclesList> {
  VehicleService vehicleService = VehicleService();
  List<DeliveryVehicle> list = [];
  static bool isLoading = true;

  @override
  void initState() {
    getDeliveryVehicles();
    super.initState();
  }

  Future<void> getDeliveryVehicles() async {
    // final userProvider = Provider.of<UserProvider>(context);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await vehicleService
        .getDeliveryVehicles(prefs.getString('token'))
        .then((value) {
      setState(() {
        list = List.from(value);
        isLoading = false;
      });
    });
    print(list[0].displayName);
  }

  Widget vehicleDetailsBuilder(BuildContext context, int index) {
    final vehicle = list[index];
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(width: 2, color: Colors.white),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            vehicle.displayName,
            style: GoogleFonts.ubuntu(fontSize: 15, color: Colors.white),
          ),
          Text(
            vehicle.plateNumber,
            style: GoogleFonts.ubuntu(fontSize: 15, color: Colors.white),
          ),
          Text(
            vehicle.vehicleColor,
            style: GoogleFonts.ubuntu(fontSize: 15, color: Colors.white),
          ),
          Text(
            vehicle.vehicleType,
            style: GoogleFonts.ubuntu(fontSize: 15, color: Colors.white),
          ),
          const SizedBox(height:2.0,),
           CustomRaisedButton(
            buttonTitle: 'Request',
            width: 0.08,
            height: 0.05,
            borderColor: Colors.black,
            borderRadius: 10,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontColor: Colors.white, 
            onPressedAction: (){},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 0.4,
      width: screenSize.width * 0.4,
      // constraints: BoxConstraints(maxHeight: screenSize.height),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.blueGrey[700],
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Online Delivery Vehicles",
            style: GoogleFonts.ubuntu(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 10),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Expanded(
                  child: ListView.builder(
                      itemCount: list.length,
                      shrinkWrap: true,
                      // padding: const EdgeInsets.all(4),
                      itemBuilder: vehicleDetailsBuilder))
        ],
      ),
    );
  }
}
