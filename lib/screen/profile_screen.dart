import 'dart:io';
import 'package:adventure_ui_demo/model/prefrence_utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List details = [];
  String? firstName;
  String? email;
  String? password;
  getValue() {
    setState(() {
      details = PreferenceUtils.getListOfString("information");
      firstName = details[1];
      email = details[2];
      password = details[3];
    });
  }

  File? _image;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PreferenceUtils.init();
    getValue();
    //print("Home Page");
  }

  Future bottomSheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      openGallery();
                    },
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: const Text(
                        "From Gallery",
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.black12,
                  ),
                  InkWell(
                    onTap: () {
                      openCamera();
                    },
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: const Text(
                        "Camera",
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void openCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
    });
    Navigator.of(context).pop();
  }

  void openGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image!.path);
    });
    Navigator.of(context).pop();
  }

  void saveImage(path) async {
    SharedPreferences saveImage = await SharedPreferences.getInstance();
    saveImage.setString("image_path", path);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF6F6F6),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.040),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.020),
                child: Text(
                  "Edit Profile",
                  style: TextStyle(
                      fontSize: size.width * 0.070,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: size.height * 0.028,
              ),
              Center(
                child: SizedBox(
                  height: size.height * 0.20,
                  width: size.width / 2.5,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: _image != null
                            ? Container(
                                height: size.height * 0.20,
                                width: size.width / 3,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: FileImage(_image!),
                                      fit: BoxFit.cover),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 10,
                                      offset: Offset(0, 4),
                                    )
                                  ],
                                  shape: BoxShape.circle,
                                ),
                              )
                            : Container(
                                height: size.height * 0.20,
                                width: size.width / 3,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage("assets/image/person.png"),
                                  ),
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //     color: Colors.grey,
                                  //     blurRadius: 10,
                                  //     offset: Offset(0, 4),
                                  //   )
                                  // ],
                                  shape: BoxShape.circle,
                                ),
                              ),
                      ),
                      Align(
                        alignment: const Alignment(0.8, 0.7),
                        child: CircleAvatar(
                          radius: size.height * 0.025,
                          backgroundColor: Colors.orange,
                          child: InkWell(
                            onTap: () {
                              bottomSheet(context);
                            },
                            child: const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.1, bottom: size.height * 0.020),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Username",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: size.width * 0.050,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      firstName ?? "N/A",
                      style: TextStyle(
                          fontSize: size.width * 0.050,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.020, bottom: size.height * 0.020),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: size.width * 0.050,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      email ?? "N/A",
                      style: TextStyle(
                          fontSize: size.width * 0.050,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.020, bottom: size.height * 0.020),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Phone",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: size.width * 0.050,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "+91 93754 40311",
                      style: TextStyle(
                          fontSize: size.width * 0.050,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.020, bottom: size.height * 0.020),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Password",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: size.width * 0.050,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      password ?? "N/A",
                      style: TextStyle(
                          fontSize: size.width * 0.050,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.020, bottom: size.height * 0.020),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Address",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: size.width * 0.050,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "236, Hans Society, Opp ",
                      style: TextStyle(
                          fontSize: size.width * 0.050,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
