import 'package:adventure_ui_demo/screen/view_all_screen.dart';
import 'package:flutter/material.dart';

import 'bookmark_screen.dart';
import 'main_screen.dart';
import 'profile_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int pageIndex = 0;

  final pages = [
    const MainScreen(),
    const ViewAllScreen(),
    const BookMarkScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          pages[pageIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.020,
                vertical: size.height * 0.010,
              ),
              child: Container(
                height: size.height * 0.095,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.090),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.01),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: pageIndex == 0
                                  ? const Icon(
                                      Icons.home,
                                      color: Colors.white,
                                      size: 32,
                                    )
                                  : const Icon(
                                      Icons.home_outlined,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                              onPressed: () {
                                setState(() {
                                  pageIndex = 0;
                                });
                              },
                            ),
                            pageIndex == 0
                                ? Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    width: size.width / 14,
                                    height: size.height * 0.0050,
                                  )
                                : Container()
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.01),
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  pageIndex = 1;
                                });
                              },
                              icon: pageIndex == 1
                                  ? const Icon(
                                      Icons.search,
                                      color: Colors.white,
                                      size: 32,
                                    )
                                  : const Icon(
                                      Icons.search,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                            ),
                            pageIndex == 1
                                ? Padding(
                                    padding: EdgeInsets.only(top: size.height * 0.005),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      width: size.width / 14,
                                      height: size.height * 0.0050,
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.01),
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  pageIndex = 2;
                                });
                              },
                              icon: pageIndex == 2
                                  ? const Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 32,
                                    )
                                  : const Icon(
                                      Icons.star_border,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                            ),
                            pageIndex == 2
                                ? Padding(
                                    padding: EdgeInsets.only(top: size.height * 0.005),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      width: size.width / 14,
                                      height: size.height * 0.0050,
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.01),
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  pageIndex = 3;
                                });
                              },
                              icon: pageIndex == 3
                                  ? const Icon(
                                      Icons.person_rounded,
                                      color: Colors.white,
                                      size: 32,
                                    )
                                  : const Icon(
                                      Icons.person_outline,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                            ),
                            pageIndex == 3
                                ? Padding(
                                    padding: EdgeInsets.only(top: size.height * 0.005),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      width: size.width / 14,
                                      height: size.height * 0.0050,
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
