import 'package:adventure_ui_demo/screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'details_screen.dart';

class ViewAllScreen extends StatefulWidget {
  const ViewAllScreen({Key? key}) : super(key: key);

  @override
  State<ViewAllScreen> createState() => _ViewAllScreenState();
}

class _ViewAllScreenState extends State<ViewAllScreen> {
  List<Map<dynamic, String>> searchCategoryList = [
    {
      "id": "1",
      "url":
          "https://media.istockphoto.com/photos/snowcapped-k2-peak-picture-id1288385045?b=1&k=20&m=1288385045&s=170667a&w=0&h=3M3ZRl1bxOGxcvmYZ-TOtuJ3idm0psm4c7GFba1TA5g=",
      "category": "Mount",
    },
    {
      "id": "2",
      "url":
          "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dHJvcGljYWwlMjBiZWFjaHxlbnwwfHwwfHw%3D&w=1000&q=80",
      "category": "Beach",
    },
    {
      "id": "3",
      "url": "https://upload.wikimedia.org/wikipedia/commons/thumb/0/07/Tenoumer_Krater.jpg/1200px-Tenoumer_Krater.jpg",
      "category": "Crater",
    },
    {
      "id": "4",
      "url": "https://media.kidadl.com/60121f5f107018646b4b4b08_we_have_all_the_beautiful_waterfall_quotes_c66afe1a97.jpeg",
      "category": "Waterfall",
    },
    {
      "id": "5",
      "url":
          "https://images.unsplash.com/photo-1455577380025-4321f1e1dca7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8cml2ZXJ8ZW58MHx8MHx8&w=1000&q=80",
      "category": "River",
    }
  ];
  List<Map<dynamic, String>> recommendList = [
    {
      "id": "1",
      "url": "https://static.toiimg.com/photo/msid-78100845,width-96,height-65.cms",
      "name": "Kerala",
      "location name": "Kerala, southwestern coastal",
      "TopPlaceName": "Gangtok Tourism",
      "TopUrl": "https://www.steppestravel.com/app/uploads/2019/07/yak-tsomgo-lake-gangtok-sikkim-india-1024x768.jpg",
      "ToplocationName": "Gangtok Tourism, Sikkim",
    },
    {
      "id": "2",
      "url": "https://media-cdn.tripadvisor.com/media/photo-s/1b/f4/64/09/aerial-view.jpg",
      "name": "Maldives",
      "location name": "Maldives Beach Hotel, Maldives",
      "TopPlaceName": "Baga Beach",
      "TopUrl": "https://images.news18.com/ibnlive/uploads/2021/12/goa-16403222104x3.jpg",
      "ToplocationName": "Baga Beach, Goa",
    },
    {
      "id": "3",
      "url":
          "https://images.thrillophilia.com/image/upload/s--HE5j90NV--/c_fill,h_600,q_auto,w_975/f_auto,fl_strip_profile/v1/images/photos/000/106/722/original/1601744848_shutterstock_1152541583.jpg.jpg?1601744848",
      "name": "Leh Ladakh",
      "location name": "Leh Ladakh Tours, Fort Road, Leh",
      "TopPlaceName": "Spiti Valley",
      "TopUrl": "https://www.adotrip.com/public/images/blogs/master_images/60e6e5507394b-Spiti_valley_blog.jpg",
      "ToplocationName": "Spiti Valley, Marango Rangarik",
    },
    {
      "id": "4",
      "url": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/12/f2/0b/7c/golden-hopes-group-of.jpg?w=900&h=-1&s=1",
      "name": "Jammu and kashmir",
      "location name": "Jammu, Bemina, Srinagar",
      "TopPlaceName": "Kovalam beach",
      "TopUrl":
          "https://v1.nitrocdn.com/kcwwJJSocHaPinWIYLxLdviqKhvKvkNF/assets/static/optimized/rev-1764627/wp-content/uploads/2019/11/11-3-1024x683.jpg",
      "ToplocationName": "Kovalam, Kerala",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF6F6F6),
        // appBar: AppBar(
        //   centerTitle: true,
        //   backgroundColor: const Color(0xffF6F6F6),
        //   leading: Padding(
        //     padding: EdgeInsets.only(left: size.width * 0.040),
        //     child: IconButton(
        //       color: const Color(0xff6F7789),
        //       icon: const Icon(
        //         Icons.arrow_back_ios,
        //       ),
        //       onPressed: () {
        //         Navigator.pop(context);
        //       },
        //     ),
        //   ),
        //   actions: [
        //     Padding(
        //       padding: EdgeInsets.only(right: size.height * 0.022),
        //       child: const CircleAvatar(
        //         backgroundImage: NetworkImage(
        //             "https://iide.co/wp-content/uploads/2017/11/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"),
        //         backgroundColor: Color(0xffFFFFFF),
        //       ),
        //     ),
        //   ],
        //   title: Text(
        //     "Search",
        //     style: TextStyle(
        //       fontSize: size.width * 0.055,
        //       color: const Color(0xff6F7789),
        //     ),
        //   ),
        //   elevation: 0,
        // ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.020, top: size.height * 0.015, right: size.width * 0.060, left: size.width * 0.060),
              child: Container(
                height: size.height * 0.070,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: size.height * 0.007),
                  child: TextField(
                    readOnly: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SearchScreen(),
                        ),
                      );
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      hintText: "Search",
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.060),
                      child: Text(
                        "Category",
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: size.width * 0.055),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    SizedBox(
                      height: size.height * 0.12,
                      width: size.width,
                      child: AnimationLimiter(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: searchCategoryList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 1000),
                              child: SlideAnimation(
                                horizontalOffset: 50.0,
                                child: FadeInAnimation(
                                  // curve: Curves.easeInOutCubicEmphasized,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: size.width * 0.070),
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          radius: size.height * 0.035,
                                          backgroundImage: NetworkImage("${searchCategoryList[index]["url"]}"),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: size.height * 0.010),
                                          child: Text("${searchCategoryList[index]["category"]}"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: size.height * 0.015, horizontal: size.width * 0.060),
                      child: Text(
                        "Recommend",
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: size.width * 0.055),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.010,
                    ),
                    SizedBox(
                      height: size.height / 4.2,
                      width: size.width,
                      child: AnimationLimiter(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: recommendList.length,
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
                                                    id: "${recommendList[index]["id"]}",
                                                    name: "${recommendList[index]["name"]}",
                                                    locationName: "${recommendList[index]["location name"]}",
                                                    url: '${recommendList[index]["url"]}',
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
                                                    image: NetworkImage("${recommendList[index]["url"]}"),
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
                                                  "${recommendList[index]["name"]}",
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
                                                  "${recommendList[index]["location name"]}",
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
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: size.height * 0.025, horizontal: size.width * 0.060),
                      child: Text(
                        "Popular",
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: size.width * 0.055),
                      ),
                    ),
                    SizedBox(
                      height: size.height / 4.2,
                      width: double.infinity,
                      child: AnimationLimiter(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: recommendList.length,
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
                                                    id: "${recommendList[index]["id"]}",
                                                    name: "${recommendList[index]["TopPlaceName"]}",
                                                    locationName: "${recommendList[index]["ToplocationName"]}",
                                                    url: '${recommendList[index]["TopUrl"]}',
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
                                                    image: NetworkImage("${recommendList[index]["TopUrl"]}"),
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
                                                  "${recommendList[index]["TopPlaceName"]}",
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
                                                  "${recommendList[index]["ToplocationName"]}",
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
                      ),
                    ), //popular
                    SizedBox(
                      height: size.height * 0.020,
                    ),
                    SizedBox(
                      height: size.height * 0.12,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
