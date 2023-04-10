import 'package:adventure_ui_demo/Component/detail_screen_tab/all_tab.dart';
import 'package:adventure_ui_demo/Component/detail_screen_tab/photo_tab.dart';
import 'package:adventure_ui_demo/Component/detail_screen_tab/review_tab.dart';
import 'package:adventure_ui_demo/model/store_data.dart';
import 'package:adventure_ui_demo/screen/date_choose_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sqflite/sqflite.dart';

import '../sqflite/database.dart';

class DetailScreen extends StatefulWidget {
  final String id;
  final String url;
  final String name;
  final String locationName;

  const DetailScreen({
    Key? key,
    required this.id,
    required this.url,
    required this.name,
    required this.locationName,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  bool bookmarkSelected = false;
  late Database database;
  double _rating = 0;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    DataClass.createData().then((value) async {
      database = value;
      bookmarkSelected = await DataClass.checkFavourite(database, widget.id);
      setState(() {});
    });
    super.initState();
  }

  List photoList = [
    "https://www.peakadventuretour.com/images/02.jpg",
    "https://elahoadventures.com/wp-content/uploads/2019/03/Adventure-Tourism.jpg",
    "https://www.outlookindia.com/outlooktraveller/public/uploads/files/2015/07/270415171141-mercury-himalayan.jpg",
    "https://admin.freetour.com/images/tours/17874/phuket-hanuman-world-zipline-adventure-tour-01.jpg",
    "https://cdn.ceoworld.biz/wp-content/uploads/2020/05/water-sports.jpg",
    "https://www.peakadventuretour.com/content/47.jpg",
    "https://www.lumiereholidays.com/designs/package_images/lmr_650_450.jpg",
    "https://admissions.sdsu.edu/_resources/images/image-list/tours_admitted.jpg",
    "https://5.imimg.com/data5/XQ/MD/MY-11252598/outdoor-camping-tent-500x500.png",
    "https://cdn-content.adventuretravel.biz/uploads/2022/03/6504622298779c422-hero.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // var bookmarkBloc = Provider.of<BookmarkBlock>(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    widget.url,
                  ),
                ),
              ),
              height: size.height / 2.8,
              width: double.infinity,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size.height / 1.47,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(45),
                    topLeft: Radius.circular(45),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          widget.name,
                          style: TextStyle(fontSize: size.width * 0.050, fontWeight: FontWeight.w800),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.orange,
                          ),
                          SizedBox(
                            width: size.width * 0.010,
                          ),
                          Text(widget.locationName),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.012,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.height * 0.005,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Text(
                                '$_rating',
                                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 6),
                              child: RatingBar(
                                minRating: 2.5,

                                initialRating: 0,
                                itemSize: 20,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                onRatingUpdate: (rating) {
                                  setState(() {
                                    _rating = rating;
                                  });
                                },
                                ratingWidget: RatingWidget(
                                  empty: const Icon(
                                    Icons.star_border,
                                    color: Colors.orange,
                                  ),
                                  full: const Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                  ),
                                  half: const Icon(
                                    Icons.star_half,
                                    color: Colors.orange,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.030,
                      ),
                      SizedBox(
                        height: size.height * 0.030,
                        child: TabBar(
                          isScrollable: true,
                          automaticIndicatorColorAdjustment: true,
                          indicatorColor: Colors.red,
                          controller: _tabController,
                          tabs: const [
                            Text(
                              "All",
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              "Review",
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              "Photo",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ), //tab bar
                      SizedBox(
                        height: size.height * 0.020,
                      ),
                      SizedBox(
                        height: size.height / 3,
                        // color: Colors.red,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            DetailScreenAllTab(size: size),
                            const DetailScreenReviewTab(),
                            DetailScreenPhotoTab(photoList: photoList),
                          ],
                        ),
                      ), //t
                      SizedBox(
                        height: size.height * 0.02,
                      ), // abBarView
                      ElevatedButton(
                        child: const Text('Save a Trip'),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('₹ 6321 /person', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                              content: SizedBox(
                                height: 180,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Includes", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: const [
                                                  CircleAvatar(
                                                      radius: 18,
                                                      child: Icon(
                                                        Icons.emoji_food_beverage,
                                                        color: Colors.orange,
                                                        size: 15,
                                                      ),
                                                      backgroundColor: Color(0xffdfdfdf)),
                                                  Padding(
                                                    padding: EdgeInsets.only(left: 10),
                                                    child: Text("Food"),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Row(
                                                children: const [
                                                  CircleAvatar(
                                                      radius: 18,
                                                      child: Icon(
                                                        Icons.drive_eta,
                                                        color: Colors.orange,
                                                        size: 15,
                                                      ),
                                                      backgroundColor: Color(0xffdfdfdf)),
                                                  Padding(
                                                    padding: EdgeInsets.only(left: 10),
                                                    child: Text("Instructors"),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Row(
                                                children: const [
                                                  CircleAvatar(
                                                      radius: 18,
                                                      child: Icon(
                                                        Icons.train,
                                                        color: Colors.orange,
                                                        size: 15,
                                                      ),
                                                      backgroundColor: Color(0xffdfdfdf)),
                                                  Padding(
                                                    padding: EdgeInsets.only(left: 10),
                                                    child: Text("Travelling"),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: const [
                                                  CircleAvatar(
                                                      radius: 18,
                                                      child: Icon(
                                                        Icons.access_time,
                                                        color: Colors.orange,
                                                        size: 15,
                                                      ),
                                                      backgroundColor: Color(0xffdfdfdf)),
                                                  Padding(
                                                    padding: EdgeInsets.only(left: 10),
                                                    child: Text("Activities"),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Row(
                                                children: const [
                                                  CircleAvatar(
                                                      radius: 18,
                                                      child: Icon(
                                                        Icons.medical_services_outlined,
                                                        color: Colors.orange,
                                                        size: 15,
                                                      ),
                                                      backgroundColor: Color(0xffdfdfdf)),
                                                  Padding(padding: EdgeInsets.only(left: 10), child: Text("First Aid")),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Row(
                                                children: const [
                                                  CircleAvatar(
                                                      radius: 18,
                                                      child: Icon(
                                                        Icons.handyman_rounded,
                                                        color: Colors.orange,
                                                        size: 15,
                                                      ),
                                                      backgroundColor: Color(0xffdfdfdf)),
                                                  Padding(
                                                    padding: EdgeInsets.only(left: 10),
                                                    child: Text("Difficulty"),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                ElevatedButton(
                                  child: const Text('Book Now'),
                                  onPressed: () {
                                    FurtherData.photoUrl = widget.url;
                                    FurtherData.placeName = widget.name;
                                    FurtherData.locationName = widget.locationName;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const DateChooseScreen(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    primary: Colors.orange,
                                    fixedSize: Size(size.width, size.height * 0.070),
                                    textStyle: TextStyle(
                                      fontSize: size.width * 0.050,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          primary: Colors.orange,
                          fixedSize: Size(size.width, size.height * 0.080),
                          textStyle: TextStyle(
                            fontSize: size.width * 0.050,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.030,
              left: size.width * 0.035,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
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
            Positioned(
              top: size.height * 0.020,
              right: size.width * 0.035,
              child: GestureDetector(
                onTap: () {
                  bookmarkSelected = !bookmarkSelected;
                  if (bookmarkSelected) {
                    DataClass.createData().then(
                      (value) {
                        database = value;
                        DataClass.insertData(database, widget.url, widget.name, widget.locationName, widget.id);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(seconds: 2),
                            content: Text(
                              "Added to Bookmarks successfully",
                            ),
                          ),
                        );
                      },
                    );
                  } else if (bookmarkSelected == false) {
                    DataClass.createData().then((value) {
                      database = value;
                      DataClass.deleteData(database, widget.id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(seconds: 2),
                          content: Text(
                            "Removed from Bookmarks",
                          ),
                        ),
                      );
                    });
                  }
                  setState(() {});
                },
                child: Container(
                  height: size.height * 0.050,
                  width: size.width / 12,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: bookmarkSelected == false
                      ? Center(
                          child: Icon(
                            Icons.star_border,
                            size: size.height * 0.028,
                            color: Colors.orange,
                          ),
                        )
                      : Center(
                          child: Icon(
                            Icons.star,
                            size: size.height * 0.028,
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
