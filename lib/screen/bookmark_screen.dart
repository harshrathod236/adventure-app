import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../main.dart';
import '../sqflite/database.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({Key? key}) : super(key: key);

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  late Database database;
  Future<List<Map?>?> getData() async {
    await DataClass.createData().then((value) async {
      database = value;
      await DataClass.getData(database).then((value) {
        setState(() {
          GlobalVariable.dataList = value;
        });
      });
    });
    return GlobalVariable.dataList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: GlobalVariable.dataList!.isEmpty
            ? const Center(
                child: Text(
                  "No place added to Bookmark",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              )
            : Column(
                children: [
                  Column(
                    children: List.generate(
                      GlobalVariable.dataList!.length,
                      (index) => Padding(
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
                                      image: NetworkImage("${GlobalVariable.dataList![index]!["url"]}"),
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
                                      "${GlobalVariable.dataList![index]!["name"]}",
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
                                            "${GlobalVariable.dataList![index]!["locationName"]}",
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
                ],
              ),
      ),
    );
  }
}
