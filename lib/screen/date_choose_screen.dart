import 'package:adventure_ui_demo/model/store_data.dart';
import 'package:adventure_ui_demo/screen/payment_screen.dart';
import 'package:flutter/material.dart';

class DateChooseScreen extends StatefulWidget {
  const DateChooseScreen({Key? key}) : super(key: key);

  @override
  State<DateChooseScreen> createState() => _DateChooseScreenState();
}

class _DateChooseScreenState extends State<DateChooseScreen> {
  List dateList = [
    "Apr 28, 2022 to May 9, 2022",
    "Apr 30, 2022 to May 11, 2022",
    "May 2, 2022 to May 13, 2022",
    "May 4, 2022 to May 15, 2022",
    "May 6, 2022 to May 17, 2022"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xffF6F6F6),
          title: const Text("Select Your Trip Date", style: TextStyle(color: Colors.orange)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: dateList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        DateController.date = dateList[index];

                        FurtherData.date = dateList[index];
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PaymentScreen(),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            "${dateList[index]}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DateController {
  static String? date;
}
