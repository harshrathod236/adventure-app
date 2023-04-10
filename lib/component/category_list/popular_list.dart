import 'package:adventure_ui_demo/screen/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class PopularCategory extends StatelessWidget {
  const PopularCategory({
    Key? key,
    required this.categoryList,
    required this.size,
  }) : super(key: key);

  final List<Map<dynamic, String>> categoryList;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 1000),
            child: SlideAnimation(
              horizontalOffset: 50.0,
              child: FadeInAnimation(
                // curve: Curves.easeInOutCubicEmphasized,
                child: Padding(
                  padding: EdgeInsets.only(
                    right: size.width * 0.010,
                    left: size.width * 0.040,
                  ),
                  child: Container(
                    height: size.height * 0.210,
                    width: size.width / 1.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  id: "${categoryList[index]["id"]}",
                                  name: "${categoryList[index]["TopPlaceName"]}",
                                  locationName: "${categoryList[index]["ToplocationName"]}",
                                  url: '${categoryList[index]["TopUrl"]}',
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: size.height * 0.155,
                            width: size.width / 1.6,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage("${categoryList[index]["TopUrl"]}"),
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width * 0.020),
                              child: Text(
                                "${categoryList[index]["TopPlaceName"]}",
                                style: TextStyle(fontWeight: FontWeight.w800, fontSize: size.width * 0.045),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.020,
                              width: size.width / 6.5,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: size.height * 0.025,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.005,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: size.height * 0.002),
                                    child: Text(
                                      "4.8",
                                      style: TextStyle(fontSize: size.width * 0.035),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: size.width * 0.008),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.orange,
                                size: 17,
                              ),
                              Text(
                                "${categoryList[index]["ToplocationName"]}",
                                style: TextStyle(fontSize: size.width * 0.040, fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
