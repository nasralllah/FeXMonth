import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../Pay_ment/addAddress.dart';
import '../data/API_Backend/Provider/SendAddressProvider.dart';
import '../view/base_widget/Blue_Button.dart';

class Adress extends StatefulWidget {
  const Adress({Key? key}) : super(key: key);

  @override
  State<Adress> createState() => _AdressState();
}

TextEditingController textEditingController = TextEditingController();
TextEditingController textEditingControllerNumber = TextEditingController();
TextEditingController textEditingControllerDescreption = TextEditingController();
TextEditingController textEditingControllerTitle = TextEditingController();



double lat =0;
double lang = 0;
class _AdressState extends State<Adress> {
  /* final Map<String, Marker> _markers = {};
    Future<void> _onMapCreated(GoogleMapController controller) async {
      final googleOffices = await locations.getGoogleOffices();
      setState(() {
        _markers.clear();
        for (final office in googleOffices.offices) {
          final marker = Marker(
            markerId: MarkerId(office.name),
            position: LatLng(office.lat, office.lng),
            infoWindow: InfoWindow(
              title: office.name,
              snippet: office.address,
            ),
          );
          _markers[office.name] = marker;
        }
      });
    }*/
  Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGoogle = CameraPosition(
    target: LatLng(15.3694, 44.1910),
    zoom: 14.4746,
  );
  final List<Marker> _markers = <Marker>[
    const Marker(
        markerId: MarkerId('1'),
        position: LatLng(15.317772909510586, 44.23524247155234),
        infoWindow: InfoWindow(
          title: 'My Position',
        )),
  ];
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR$error");
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.blue),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(" AdDress", style: TextStyle(color: Colors.blue)),
        ),
        body: GoogleMap(
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          initialCameraPosition: _kGoogle,
          markers: Set<Marker>.of(_markers),
          mapType: MapType.normal,
          myLocationEnabled: true,
          compassEnabled: true,
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: 80),
          child: FloatingActionButton(
            onPressed: () async {
              getUserCurrentLocation().then((value) async {
                print("${value.latitude} ${value.longitude}");
                lat = value.latitude ;
                lang = value.longitude;
                print("$lat,,,,,,,,$lang");
                // marker added for current users location
                _markers.add(Marker(
                  markerId: MarkerId("2"),
                  position: LatLng(value.latitude, value.longitude),
                  infoWindow: const InfoWindow(
                    title: 'My Current Location',
                  ),
                ));

                // specified current users location
                CameraPosition cameraPosition = CameraPosition(
                  target: LatLng(value.latitude, value.longitude),
                  zoom: 14,
                );

                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(
                    CameraUpdate.newCameraPosition(cameraPosition));
                setState(() {});
              });
            },
            child: Icon(Icons.my_location),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: GestureDetector(
          onTap: () {},
          onVerticalDragStart: (details) => onnavgatortaped(context),
          child: Container(
              width: double.infinity,
              height: 60.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  border: Border.all(color: Colors.grey.shade400),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        //offset: Offset(0, -1),
                        spreadRadius: 4,
                        blurRadius: 30)
                  ]),
              child: Icon(
                CupertinoIcons.line_horizontal_3_decrease_circle,
                color: Colors.grey,
              )),
        ));
  }
}

void onnavgatortaped(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20))),
    context: context,
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        builder: (context, scrollController) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) =>
                  SingleChildScrollView(
                    controller: scrollController,
                    child: Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(children: [
                              Container(
                                width: 305,
                                height: 40,
                                margin: EdgeInsets.only(
                                    top: 15, bottom: 15, left: 20, right: 20),
                                child: TextField(
                                  controller: textEditingController,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.horizontal(
                                            right: Radius.circular(30.0),
                                            left: Radius.circular(30.0)),
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      labelText: "Your Address"),
                                ),
                              )
                            ]),
                            Row(
                              children: [
                                Container(
                                  width: 305,
                                  height: 40,
                                  margin: EdgeInsets.only(
                                      top: 15, bottom: 15, left: 20, right: 20),
                                  child: TextField(
                                    controller: textEditingControllerTitle,
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.horizontal(
                                              right: Radius.circular(30.0),
                                              left: Radius.circular(30.0)),
                                          borderSide:
                                          BorderSide(color: Colors.blue),
                                        ),
                                        labelText: "The Title"),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.horizontal(
                                          right: Radius.circular(30.0),
                                          left: Radius.circular(30.0)),
                                      border: Border.all(
                                          color: Colors.blue,
                                          style: BorderStyle.solid,
                                          width: 2)),
                                  height: 40,
                                  width: 60,
                                  margin: EdgeInsets.only(
                                      top: 5, bottom: 15, left: 20),
                                  child: Center(
                                      child: Text(
                                    "+967",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                    ),
                                  )),
                                ),
                                Container(
                                  height: 40,
                                  width: 240,
                                  margin: EdgeInsets.only(
                                      top: 5, bottom: 15, left: 5, right: 20),
                                  child:  TextField(
                                    controller:textEditingControllerNumber ,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.horizontal(
                                              right: Radius.circular(30.0),
                                              left: Radius.circular(30.0)),
                                          borderSide:
                                              BorderSide(color: Colors.blue),
                                        ),
                                        labelText: "Phone Number"),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 310,
                              margin: EdgeInsets.only(
                                  top: 5, bottom: 15, left: 5, right: 20),
                              child:  TextField(
                                controller: textEditingControllerDescreption,
                                maxLines: 5,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.horizontal(
                                        right: Radius.circular(30.0),
                                        left: Radius.circular(30.0)),
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                  labelText: "Description",
                                ),
                              ),
                            ),
                            Blue_Button(
                                ButtonText: "Send",
                                height: 40,
                                width: 80,
                                Margintop: 8,
                                Marginleft: 0,
                                textStyle: TextStyle(color: Colors.white),
                                buttonColor: MaterialStatePropertyAll<Color>(
                                    Colors.blue),
                                Marginbottom: 0,
                                MarginRight: 0,
                            onTap: (){
                              SendAddressProvider();
                              // texts.add(textEditingController.text);
                              textEditingController.clear();
                              textEditingControllerDescreption.clear();
                              textEditingControllerNumber.clear();
                              textEditingControllerTitle.clear();

                              setState((){
                                showDialogselect(context);
                              });
                            },)
                          ],
                        ),
                      ),
                    ),
                  ));
        },
      );
    },
  );
}
