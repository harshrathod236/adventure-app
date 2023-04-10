import 'package:adventure_ui_demo/screen/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final Set<Marker> _marker = {};
  late BitmapDescriptor mapMarker;

  void setCostumeMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      "assets/image/logo2.png",
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setCostumeMarker();
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(
      () {
        _marker.add(
          Marker(
            markerId: const MarkerId("id-1"),
            icon: mapMarker,
            position: const LatLng(21.238898047613525, 72.87931762181555),
            infoWindow: const InfoWindow(
              title: "InfyOm Technology",
              snippet: "Life for Developers",
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              mapType: MapType.hybrid,
              markers: _marker,
              onMapCreated: _onMapCreated,
              initialCameraPosition: const CameraPosition(
                target: LatLng(
                  21.238898047613525,
                  72.87931762181555,
                ),
                zoom: 17.5,
              ),
            ),
            Positioned(
              top: size.height * 0.030,
              left: size.width * 0.035,
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BottomBar(),
                    ),
                  );
                },
                child: CircleAvatar(
                  radius: size.height * 0.020,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 7),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: size.height * 0.025,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
