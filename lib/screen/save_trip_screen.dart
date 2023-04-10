import 'package:adventure_ui_demo/model/store_data.dart';
import 'package:adventure_ui_demo/screen/bottom_bar.dart';
import 'package:flutter/material.dart';

class SaveTripScreen extends StatefulWidget {
  const SaveTripScreen({Key? key}) : super(key: key);

  @override
  State<SaveTripScreen> createState() => _SaveTripScreenState();
}

class _SaveTripScreenState extends State<SaveTripScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BottomBar(),
                ),
              );
            },
            icon: const Icon(Icons.arrow_back),
          ),
          backgroundColor: Colors.white,
          title: const Text("Your Trip", style: TextStyle(color: Colors.orange)),
        ),
        body: ListOfStoredData.listOfData.isEmpty
            ? const Center(
                child: Text(
                "Your Trip is Empty",
                style: TextStyle(fontSize: 20),
              ))
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: ListOfStoredData.listOfData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(image: NetworkImage("${ListOfStoredData.listOfData[index].photoUrl}"), fit: BoxFit.cover),
                                  ),
                                  height: 100,
                                  width: 100,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${ListOfStoredData.listOfData[index].placeName}",
                                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "${ListOfStoredData.listOfData[index].locationName}",
                                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: const [
                                          Text(
                                            "₹ 6,351 / person",
                                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Full name :- ",
                                        style: TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                      Text(
                                        "${ListOfStoredData.listOfData[index].fullName}",
                                        style: const TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "From Address :- ",
                                        style: TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                      Text(
                                        "${ListOfStoredData.listOfData[index].fromAddress}",
                                        style: const TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "To Address :- ",
                                        style: TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                      Text(
                                        "${ListOfStoredData.listOfData[index].toAddress}",
                                        style: const TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Center(
                              child: Card(
                                elevation: 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Text(
                                    "${ListOfStoredData.listOfData[index].date}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
