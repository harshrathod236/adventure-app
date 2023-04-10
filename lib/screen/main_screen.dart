import 'package:adventure_ui_demo/add_place_screen.dart';
import 'package:adventure_ui_demo/Component/alert_dialog/common_dialog.dart';
import 'package:adventure_ui_demo/Component/category_list/adventure_list.dart';
import 'package:adventure_ui_demo/Component/category_list/camp_list.dart';
import 'package:adventure_ui_demo/Component/category_list/popular_list.dart';
import 'package:adventure_ui_demo/Component/category_list/tour_list.dart';
import 'package:adventure_ui_demo/Component/top_place_list/top_place.dart';
import 'package:adventure_ui_demo/screen/google_map_screen.dart';
import 'package:adventure_ui_demo/screen/login_screen.dart';
import 'package:adventure_ui_demo/screen/save_trip_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  final Location location = Location();
  final number = "9375440311";

  permission() async {
    final status = await location.requestPermission();
    if (status == PermissionStatus.granted) {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return const GoogleMapScreen();
        },
      ));
    } else if (status == PermissionStatus.deniedForever) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainScreen(),
        ),
      );
    }
  }

  List<Map<dynamic, String>> categoryList = [
    {
      "id": "1",
      "category": "Adventure",
      "AdventureUrl": "https://www.weekendthrill.com/wp-content/uploads/2017/06/delhi-min.jpg",
      "PlaceName": "Damdama Lake",
      "locationName": "Damdama Lake, Haryana",
      "TourPlaceName": "Taj Mahal",
      "TourUrl": "https://irlentwincities.com/wp-content/uploads/2021/12/tourist-top-attractions.jpg",
      "TourlocationName": "Taj Mahal, Aagra",
      "CampPlaceName": "Polo Forest",
      "CampUrl": "https://www.wildlifetourpackages.net/pages/745324701.jpg",
      "CamplocationName": "Polo Forest, Ahmedabad",
      "TopPlaceName": "Gangtok Tourism",
      "TopUrl": "https://www.steppestravel.com/app/uploads/2019/07/yak-tsomgo-lake-gangtok-sikkim-india-1024x768.jpg",
      "ToplocationName": "Gangtok Tourism, Sikkim",
    },
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
    {
      "id": "3",
      "category": "Camp",
      "TourPlaceName": "India Get",
      "TourUrl": "https://www.transindiatravels.com/wp-content/uploads/gateway-of-india-mumbai.jpg",
      "TourlocationName": "India Get, Mumbai",
      "AdventureUrl":
          "https://images.thrillophilia.com/image/upload/s--HE5j90NV--/c_fill,h_600,q_auto,w_975/f_auto,fl_strip_profile/v1/images/photos/000/106/722/original/1601744848_shutterstock_1152541583.jpg.jpg?1601744848",
      "PlaceName": "Leh Ladakh",
      "locationName": "Leh Ladakh Tours, Fort Road",
      "CampPlaceName": "Kedarnath Trek",
      "CampUrl": "https://www.himalayanhikers.in/wp-content/uploads/2021/08/kedarnath.jpg",
      "CamplocationName": "Kedarnath, Uttarakhand",
      "TopPlaceName": "Spiti Valley",
      "TopUrl": "https://www.adotrip.com/public/images/blogs/master_images/60e6e5507394b-Spiti_valley_blog.jpg",
      "ToplocationName": "Spiti Valley, Marango Rangarik",
    },
    {
      "id": "4",
      "category": "Popular",
      "TourPlaceName": "Hawa Mahal",
      "TourUrl": "https://www.japjitravel.com/blog/wp-content/uploads/2015/10/hawa-mahal-jaipur.jpg",
      "TourlocationName": "Hawa Mahal, Jaipur, Rajasthan",
      "AdventureUrl": "https://img.traveltriangle.com/blog/wp-content/uploads/2020/03/Picnic-Spots-Near-Rishikesh.jpg",
      "PlaceName": "Rishikesh",
      "locationName": "Rishikesh, Uttarakhand",
      "CampPlaceName": "Trekking in Dalhousie",
      "CampUrl": "https://www.thegreatnext.com/uploads/trip_media/Gallery_2-262.jpg",
      "CamplocationName": "Dalhousie, Himachal Pradesh",
      "TopPlaceName": "Kovalam beach",
      "TopUrl":
          "https://v1.nitrocdn.com/kcwwJJSocHaPinWIYLxLdviqKhvKvkNF/assets/static/optimized/rev-1764627/wp-content/uploads/2019/11/11-3-1024x683.jpg",
      "ToplocationName": "Kovalam, Kerala",
    },
  ];

  TabController? _tabController;
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: AdvancedDrawer(
        backdropColor: Colors.blueGrey,
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 450),
        animateChildDecoration: true,
        rtlOpening: false,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        drawer: SafeArea(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 128.0,
                  height: 128.0,
                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 64.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/image/person.png',
                  ),
                ),
                ListTile(
                  onTap: () {
                    Get.to(() => const AddPlaceScreen());
                  },
                  leading: const Icon(Icons.add),
                  title: const Text('Add Place'),
                ),
                ListTile(
                  onTap: () {
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) {
                          return const CustomAlert();
                        });
                  },
                  leading: const Icon(Icons.star),
                  title: const Text('Review'),
                ),
                ListTile(
                  onTap: () {
                    launch("tel://$number");
                  },
                  leading: const Icon(Icons.phone),
                  title: const Text('Contact'),
                ),
                ListTile(
                  onTap: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text(
                          'Privacy Policy',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        content: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Information Collection and Use',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                    'For a better experience while using our Service, we may require you to provide us with certain personally identifiable information, including but not limited to your name, phone number, and postal address. The information that we collect will be used to contact or identify you.'),
                              ),
                              Text(
                                'Cookies',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                    "Cookies are files with small amount of data that is commonly used an anonymous unique identifier. These are sent to your browser from the website that you visit and are stored on your computers hard drive."),
                              ),
                              Text(
                                'Service Providers',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                    "We want to inform our Service users that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose."),
                              ),
                              Text(
                                'Contact Us',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text("If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us."),
                              ),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('Agree'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  leading: const Icon(Icons.privacy_tip),
                  title: const Text('Privacy Policy'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  leading: const Icon(Icons.logout),
                  title: const Text('Log out'),
                ),
              ],
            ),
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color(0xffF6F6F6),
            leading: InkWell(
              onTap: () => _advancedDrawerController.showDrawer(),
              child: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: _advancedDrawerController,
                builder: (_, value, __) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: Icon(
                      value.visible ? Icons.clear : Icons.menu,
                      key: ValueKey<bool>(value.visible),
                      color: const Color(0xff6F7789),
                    ),
                  );
                },
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: size.height * 0.01),
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart, color: Colors.orange),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SaveTripScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
            title: Text(
              "Home",
              style: TextStyle(
                fontSize: size.width * 0.055,
                color: const Color(0xff6F7789),
              ),
            ),
            elevation: 0,
          ),
          backgroundColor: const Color(0xffF6F6F6),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.020,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.040),
                  child: Text(
                    "Wonderful India's Adventure",
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: size.width * 0.065),
                  ),
                ),
                SizedBox(
                  height: size.width * 0.009,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.040),
                  child: Text(
                    "Let’s Explore Together",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: size.width * 0.055,
                      color: const Color(0xff6F7789),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.030, horizontal: size.width * 0.010),
                  child: TabBar(
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    automaticIndicatorColorAdjustment: true,
                    indicatorColor: Colors.red,
                    unselectedLabelColor: Colors.black,
                    controller: _tabController,
                    tabs: [
                      Text(
                        "Adventure",
                        style: TextStyle(color: Colors.black, fontSize: size.width * 0.043),
                      ),
                      Text(
                        "Tour",
                        style: TextStyle(color: Colors.black, fontSize: size.width * 0.043),
                      ),
                      Text(
                        "Camp",
                        style: TextStyle(color: Colors.black, fontSize: size.width * 0.043),
                      ),
                      Text(
                        "Popular",
                        style: TextStyle(color: Colors.black, fontSize: size.width * 0.041),
                      ),
                    ],
                  ),
                ), //Adventure
                SizedBox(
                  height: size.height / 4.2,
                  // color: Colors.red,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      AdventureCategoryList(categoryList: categoryList, size: size),
                      TourCategory(categoryList: categoryList, size: size),
                      CampCategory(categoryList: categoryList, size: size),
                      PopularCategory(categoryList: categoryList, size: size),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.040, vertical: size.height * 0.025),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Top Place",
                        style: TextStyle(fontSize: size.width * 0.055, fontWeight: FontWeight.w700),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: InkWell(
                          splashColor: Colors.white,
                          child: Row(
                            children: const [
                              Icon(
                                Icons.location_on,
                                color: Colors.orange,
                              ),
                              Text(
                                "Find Place",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          onTap: () {
                            permission();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height / 1.9,
                  width: size.width,
                  child: TopPlace(categoryList: categoryList, size: size),
                ),
                SizedBox(
                  height: size.height * 0.12,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
