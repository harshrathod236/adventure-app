import 'package:adventure_ui_demo/core/Firebase/collection_refrence.dart';
import 'package:flutter/material.dart';

class AddPlaceScreen extends StatelessWidget {
  const AddPlaceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Column(
              children: [
                MaterialButton(
                  onPressed: () {
                    collectionReference(collectionName: 'camp').add(
                      {
                        "id": "2",
                        "category": "Tour",
                        "TourPlaceName": "Amritsar",
                        "TourUrl": "https://cdn.audleytravel.com/3987/2848/79/1340503-amritsars-golden-temple.jpg",
                        "TourlocationName": "Amritsar, Panjab",
                        "AdventureUrl": "https://resources.thomascook.in/images/holidays/sightSeeing/49245_Baga_Beach_Goa_India_960.jpg",
                        "PlaceName": "Baga Beach",
                        "locationName": "Baga Beach, Goa",
                        "CampPlaceName": "Snow Trekking",
                        "CampUrl": "https://img.traveltriangle.com/blog/wp-content/uploads/2017/11/cover-for-Trekking-In-Manali.jpg",
                        "CamplocationName": "Manali, Himachal Pradesh",
                        "TopPlaceName": "Baga Beach",
                        "TopUrl": "https://images.news18.com/ibnlive/uploads/2021/12/goa-16403222104x3.jpg",
                        "ToplocationName": "Baga Beach, Goa",
                      },
                    );
                  },
                  color: Colors.teal,
                  child: const Text('Add Place'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
