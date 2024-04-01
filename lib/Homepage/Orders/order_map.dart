import 'dart:async';
import 'dart:convert';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:olivehealth_delivery/constant/Api/Api_constant.dart';
import 'package:olivehealth_delivery/constant/button/custom_button.dart';
import 'package:olivehealth_delivery/constant/styles.dart';


class AddAdressMap extends StatefulWidget {
  // final String locationType;

  @override
  State<AddAdressMap> createState() => _AddAdressMapState();
}

class _AddAdressMapState extends State<AddAdressMap> {
  String radius = "30";

  double latitude = 31.5111093;
  double longitude = 74.279664;
  var lat = "0.000";
  var long = "0.000";
  var latt;
  var longg;

  Completer<GoogleMapController> _controller = Completer();
  String _draggedAddress = "";
  CameraPosition? _cameraPosition;
  late LatLng _defaultLatLng;
  late LatLng _draggedLatlng;
  _init() {
    _defaultLatLng = const LatLng(20.5937, 78.9629);
    _draggedLatlng = _defaultLatLng;
    _cameraPosition = CameraPosition(target: _defaultLatLng, zoom: 10.5);
    _gotoUserCurrentPosition();
  }

  Uint8List? marketimages;
  final List<Marker> _markers = [];
  Future<Uint8List> getImages(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  Future<Uint8List?> loadNetWorkImage(String path) async {
    final completer = Completer<ImageInfo>();
    var image = NetworkImage(path);
    image.resolve(const ImageConfiguration()).addListener(
        ImageStreamListener((info, _) => completer.complete(info)));
    final imageInfo = await completer.future;
    final byteData =
    await imageInfo.image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  var totallen;
  Widget _getMap() {
    return GoogleMap(
        myLocationEnabled: true,
        zoomControlsEnabled: false,
        zoomGesturesEnabled: true,
        myLocationButtonEnabled: false,
        markers: Set<Marker>.of(_markers),
        initialCameraPosition: _cameraPosition!,
        mapType: MapType.terrain,
        onCameraIdle: () {
          _getAddress(_draggedLatlng);
        },
        onCameraMove: (cameraPosition) {
          _draggedLatlng = cameraPosition.target;
        },
        onMapCreated: (GoogleMapController controller) {
          if (!_controller.isCompleted) {
            _controller.complete(controller);
          }
        });
  }

  Future _gotoUserCurrentPosition() async {
    Position currentPosition = await _determineUserCurrentPosition();
    _gotoSpecificPosition(
        LatLng(currentPosition.latitude, currentPosition.longitude));
    final Uint8List locationIcon = await getImages('assets/googleicon.png', 70);
    setState(() async {
      lat = currentPosition.latitude.toString();
      long = currentPosition.longitude.toString();
      var lats = double.parse(lat);
      var longs = double.parse(long);
      _markers.add(Marker(
        markerId: const MarkerId('0'),
        icon: BitmapDescriptor.fromBytes(locationIcon),
        position: LatLng(lats, longs),
        infoWindow: const InfoWindow(
          title: "userName",
        ),
        draggable: true,
        onDragEnd: ((newPosition) {
          print('rrrrrrrrrrrr');
          print(newPosition.latitude);
          print(newPosition.longitude);
        }),
      ));
    });
  }

  Future _gotoSpecificPosition(LatLng position) async {
    GoogleMapController mapController = await _controller.future;
    mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: position, zoom: 13.5)));
    await _getAddress(position);
  }

  Future _getAddress(LatLng position) async {
    // _suggestions.clear();
    List<Placemark> placemarks =
    await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark address = placemarks[0];
    String addresStr =
        "${address.street}, ${address.locality}, ${address.administrativeArea}, ${address.country}";
    setState(() {
      latt = position.latitude;
      longg = position.longitude;
      _draggedAddress = addresStr;
    });
  }

  Future _determineUserCurrentPosition() async {
    LocationPermission locationPermission;
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    //check if user enable service for location permission
    if (!isLocationServiceEnabled) {
      print("user don't enable location permission");
    }
    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        print("user denied location permission");
      }
    }

    if (locationPermission == LocationPermission.deniedForever) {
      print("user denied permission forever");
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  }

// fetch live location from the map
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _suggestions = [];

  Future<void> _getSuggestions(String input) async {
    const apiKey = Apiconst.mapkey; // Replace with your API key
    final endpoint = Uri.parse(
      Apiconst.mapSuggetion+'$input&key=$apiKey',
      // 'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=$apiKey',
    );

    final response = await http.get(endpoint);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
      print("data");
      final predictions = data['predictions'];
      if (kDebugMode) {
        print("saaaaaaaaaaaaaaaaaa");
      }
      if (kDebugMode) {
        print(predictions);
      }
      setState(() {
        _suggestions = predictions.map((prediction) {
          final description = prediction['description'] as String;
          final placeId = prediction['place_id'] as String;
          return {'description': description, 'place_id': placeId};
        }).toList();
      });
    }
  }

  Future<Map<String, double>> getLatLngFromPlaceId(
      String placeId, String address) async {
    const apiKey = Apiconst.mapkey;
    final response = await http.get(Uri.parse(
        Apiconst.map_get_lat_long+'$placeId&key=$apiKey'));
    // 'https://maps.googleapis.com/maps/api/place/details/json?placeid=$placeId&key=$apiKey'));
    final decodedResponse = json.decode(response.body);

    print(response);
    print('MMMMMMMMMMMMMMMMMMMMMMMMMMMMM');
    print(decodedResponse);
    if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body);

      if (decodedResponse['status'] == 'OK') {
        final location = decodedResponse['result']['geometry']['location'];
        searchedLocationLatitude = location['lat'];
        searchedLocationLongitude = location['lng'];
        if (searchedLocationLongitude != null &&
            searchedLocationLatitude != null) {
          print("aaaaaaaaaaaaaa");
          print("TTTTTTTTTTTTTTTTTTTTTTTTTTT");
          print(address);
          print(searchedLocationLatitude);
          print(searchedLocationLongitude);
          _suggestions.clear();
          final searchlatlan =
          LatLng(searchedLocationLatitude, searchedLocationLongitude);
          // showDialog(context: context, builder: (BuildContext, context))
          // Navigator.pop(
          //   context,
          //   {
          //     'locationName': address,
          //     'latitude': searchedLocationLatitude,
          //     'longitude': searchedLocationLongitude,
          //   },
          // );
          _gotoSpecificPosition(searchlatlan);
        }

        return {
          'latitude': searchedLocationLatitude,
          'longitude': searchedLocationLongitude
        };
      } else {
        throw Exception(
            'Failed to fetch location details: ${decodedResponse['error_message']}');
      }
    } else {
      throw Exception(
          'Failed to fetch location details: ${response.statusCode}');
    }
  }

  Widget _getLoctionButton() {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Positioned(
      bottom: height*0.25,
      right: width*0.04,
      child: InkWell(
        onTap: () {
          _gotoUserCurrentPosition();
        },
        child: Container(
          width: width*0.50,
          height: height*0.05,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              const BoxShadow(color: Color.fromRGBO(0, 0, 0, .25), blurRadius: 16.0)
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(Icons.my_location,color: Colors.red,),
              Text("Use Current Location",style: TextStyle(fontSize: width*0.034,fontWeight: FontWeight.w500),)
            ],
          ),
        ),
      ),
    );
  }


  Widget Serchbutton() {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Positioned(
      top: height*0.01,
      left: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            width: width*0.90,
            height: height*0.06,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: TextFormField(
              controller: _searchController,
              //readOnly: true,
              onChanged: (v) {
                _getSuggestions(v);
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 8, top: 10),
                hintText: 'Search for area, pincode..',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: (){
                    setState(() {
                      _searchController.clear();
                      _suggestions.clear();

                    });
                  },
                ),
                border: InputBorder.none,
                hintStyle: TextStyle(fontSize: width*0.04, color: Colors.grey.shade400),
              ),

              style: TextStyle(
                fontSize: width*0.04,
                fontWeight: FontWeight.w600,
                color: const Color(0xffA7A7A7),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getCustomPin() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Positioned(
      top: height / 2.8,
      left: width / 2.3,
      child: InkWell(
        onTap: () async {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                title: Text(
                  _draggedAddress,
                ),
                content: Container(
                  height: height*0.20,
                  width: width*0.40,

                  child: Column(
                    children: [
                      Text(
                        'Latitude ' + latt.toString(),
                      ),
                      Text(
                        'longitude ' + longg.toString(),
                      ),
                      Text(
                        'Adress ' + _draggedAddress,
                      ),
                    ],
                  ),
                  // child:Alerts(
                  //     lats:latt.toString(),
                  //     longs:longg.toString(),
                  //     address:_draggedAddress
                  // )
                )),
          );
        },
        child: Container(
          width: width*0.09,
          height: height*0.09,
          child: const Icon(Icons.location_on_outlined),
        ),
      ),
    );
  }


  Widget _buildBody() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(children: [
      _getMap(),
      Serchbutton(),
      _getCustomPin(),
      _getLoctionButton(),

      _suggestions.isNotEmpty
          ? Column(
        children: [
          SizedBox(height: height*0.052,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              margin: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.white),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: _suggestions.length,
                  itemBuilder: (context, index) {
                    location = _suggestions[index]['description'];
                    final placeId = _suggestions[index]['place_id'];
                    print(placeId);
                    return ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      leading: const Icon(Icons.location_on_outlined),
                      title: Text(
                        location.toString(),
                      ),
                      onTap: () {
                        print(location);
                        FocusScope.of(context).requestFocus(FocusNode());
                        getLatLngFromPlaceId(placeId, location.toString());
                        print('aaaaaaaaaaaaaaa');
                        // print(latt.toString()+long.toString()+_draggedAddress);
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      )
          : const SizedBox(),

    ]);
  }

  String SearchAddress = "";

  String? location;
  var liveLocation;
  var searchedLocationLatitude;
  var searchedLocationLongitude;

  void initState() {
    // DateTime selectedDate = DateTime.now();
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    var main_add = _suggestions.isNotEmpty
        ? location.toString()
        : _draggedAddress.toString();
    var main_latt = _suggestions.isNotEmpty
        ? searchedLocationLatitude.toString()
        : latt.toString();
    var main_longg = _suggestions.isNotEmpty
        ? searchedLocationLongitude.toString()
        : longg.toString();
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: _buildBody(),
          bottomSheet: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(left: 15, right: 15, top: 12, bottom: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text("Select Pick Up Location",style: robotoRegular.copyWith(fontSize: width*0.04,fontWeight: FontWeight.bold),)),
                SizedBox(height: height*0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.location_on,color: Colors.red,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: width*0.80,
                            child: Text(main_add,maxLines: 3,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: width*0.04,fontWeight: FontWeight.w500),)),
                        // Text(main_latt),
                        // Text(main_longg),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: height*0.02,
                ),

                CustomButton(
                  onTap: () {
                    // Navigator.pop(context,
                    //   {
                    //     'locationName': main_add,
                    //     'latitude': main_latt,
                    //     'longitude': main_longg,
                    //   },
                    // );
                    Map<String, String> locationData = {
                      'locationName': main_add.toString(),
                    };
                    Navigator.pop(context, locationData);
                    // showModalBottomSheet(
                    //     isScrollControlled: true,
                    //     shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
                    //         topLeft: Radius.circular(10),
                    //         topRight: Radius.circular(10))),
                    //     context: context,
                    //     builder: (context)=>Completeaddress(locationname: main_add,latitude: main_latt,longitude: main_longg));
                  },
                  text: 'Start',
                  size: width*0.06,
                  height: height*0.06,
                ),

              ],
            ),
          )),
    );
  }


}