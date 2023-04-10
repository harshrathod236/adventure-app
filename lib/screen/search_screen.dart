import 'package:adventure_ui_demo/model/search_model.dart';
import 'package:adventure_ui_demo/screen/details_screen.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Place> places = allPlace;
  List<Place> rePlaces = recentPlace;
  void searchPlace(String query) {
    final suggestionList = query.isEmpty
        ? rePlaces
        : allPlace.where(
            (element) {
              final placeTitle = element.name!.toLowerCase();
              final input = query.toLowerCase();
              return placeTitle.contains(input);
            },
          ).toList();
    setState(() {
      places = suggestionList;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: size.height * 0.02),
              child: Container(
                height: size.height * 0.073,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: size.height * 0.008),
                  child: TextField(
                    onChanged: (query) {
                      searchPlace(query);
                    },
                    decoration: InputDecoration(
                      prefixIcon: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          size: 20,
                        ),
                      ),
                      suffixIcon: const Icon(Icons.search),
                      border: InputBorder.none,
                      hintText: "Search",
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.056),
              child: Text(
                rePlaces.isNotEmpty ? "Recent place" : "",
                style: const TextStyle(fontSize: 17, color: Colors.grey),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: List.generate(
                    places.length,
                    (index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                                id: "${places[index].id}",
                                url: "${places[index].url}",
                                name: "${places[index].name}",
                                locationName: "${places[index].locationName}"),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.040,
                          vertical: size.height * 0.010,
                        ),
                        child: Card(
                          elevation: 5,
                          color: Colors.white,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: size.height * 0.1,
                                  width: size.width / 4.5,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage("${places[index].url}"),
                                    ),
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: size.width * 0.010),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${places[index].name}",
                                      style: TextStyle(fontSize: size.width * 0.050, fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.005,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                          size: size.height * 0.025,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: size.height * 0.004),
                                          child: Text(
                                            "4.8",
                                            style: TextStyle(fontSize: size.width * 0.036),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height * 0.005,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color: Colors.orange,
                                          size: size.height * 0.025,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: size.height * 0.004),
                                          child: Text(
                                            "${places[index].locationName}",
                                            style: TextStyle(fontSize: size.width * 0.036),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
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
