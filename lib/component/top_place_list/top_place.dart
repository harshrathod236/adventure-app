import 'package:adventure_ui_demo/screen/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class TopPlace extends StatelessWidget {
  const TopPlace({
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
        physics: const NeverScrollableScrollPhysics(),
        itemCount: categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 2000),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                // curve: Curves.easeInOutCubicEmphasized,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                            id: "${categoryList[index]["id"]}",
                            url: "${categoryList[index]["TopUrl"]}",
                            name: "${categoryList[index]["TopPlaceName"]}",
                            locationName: "${categoryList[index]["ToplocationName"]}"),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.040, vertical: size.height * 0.009),
                    child: Container(
                      height: size.height * 0.115,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              height: size.height * 0.1,
                              width: size.width / 4.8,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    "${categoryList[index]["TopUrl"]}",
                                  ),
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.020,
                          ),
                          SizedBox(
                            height: size.height * 0.100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "${categoryList[index]["TopPlaceName"]}",
                                  style: TextStyle(fontSize: size.width * 0.050, fontWeight: FontWeight.w800),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: size.width * 0.005),
                                      child: Icon(
                                        Icons.location_on,
                                        color: Colors.orange,
                                        size: size.height * 0.025,
                                      ),
                                    ),
                                    Text(
                                      "${categoryList[index]["ToplocationName"]}",
                                      style: TextStyle(fontSize: size.width * 0.040),
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: size.height * 0.025,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "4.8",
                                      style: TextStyle(fontSize: size.width * 0.040),
                                    ),
                                  ],
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
            ),
          );
        },
      ),
    );
  }
}
