import 'package:adventure_ui_demo/model/store_data.dart';
import 'package:adventure_ui_demo/screen/date_choose_screen.dart';
import 'package:adventure_ui_demo/screen/save_trip_screen.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TextEditingController fullName = TextEditingController();
  TextEditingController mobileNo = TextEditingController();
  TextEditingController fromAdd = TextEditingController();
  TextEditingController toAdd = TextEditingController();
  TextEditingController yourAdd = TextEditingController();
  TextEditingController cardHolName = TextEditingController();
  TextEditingController cardNo = TextEditingController();

  int currentStep = 0;
  List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>()
  ];

  List<Step> getSteps() {
    final size = MediaQuery.of(context).size;
    return [
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        title: const Text("Account"),
        content: Form(
          key: formKeys[0],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your full name',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.orange),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.015),
                child: Container(
                  height: size.height * 0.07,
                  decoration: BoxDecoration(
                    color: const Color(0xffe7e7e7),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: fullName,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "Name",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              const Text(
                'Username',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.orange),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.015),
                child: Container(
                  height: size.height * 0.07,
                  decoration: BoxDecoration(
                    color: const Color(0xffe7e7e7),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter location';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "username",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              const Text(
                'Number we can call',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.orange),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.015),
                child: Container(
                  height: size.height * 0.07,
                  decoration: BoxDecoration(
                    color: const Color(0xffe7e7e7),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: mobileNo,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "* Required";
                        } else if (value.length < 10) {
                          return "Mobile no should be at least 6 characters";
                        } else if (value.length > 10) {
                          return "Mobile no should not be greater than 10 characters";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: "Mobile no",
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.phone),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              )
            ],
          ),
        ),
        isActive: currentStep >= 0,
      ),
      Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        title: const Text("Address"),
        content: Form(
          key: formKeys[1],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'From',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.orange),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.015),
                child: Container(
                  height: size.height * 0.07,
                  decoration: BoxDecoration(
                    color: const Color(0xffe7e7e7),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: fromAdd,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter location';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "To Location",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              const Text(
                'To',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.orange),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.015),
                child: Container(
                  height: size.height * 0.07,
                  decoration: BoxDecoration(
                    color: const Color(0xffe7e7e7),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: toAdd,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter location';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "To Location",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              const Text(
                'Your address',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.orange),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.015),
                child: Container(
                  height: size.height * 0.07,
                  decoration: BoxDecoration(
                    color: const Color(0xffe7e7e7),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: yourAdd,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Your location';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "Your Location",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        isActive: currentStep >= 1,
      ),
      Step(
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        title: const Text("Card"),
        content: Form(
          key: formKeys[2],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Card holder’s name',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.orange),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.015),
                child: Container(
                  height: size.height * 0.07,
                  decoration: BoxDecoration(
                    color: const Color(0xffe7e7e7),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: cardHolName,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter card holder name';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "Account holder name",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              const Text(
                'Card number',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.orange),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.015),
                child: Container(
                  height: size.height * 0.07,
                  decoration: BoxDecoration(
                    color: const Color(0xffe7e7e7),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: cardNo,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter valid card number';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "0908090009999",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Date',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.orange),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.01,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe7e7e7),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          height: size.height * 0.06,
                          width: size.width / 2.8,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter expiry date';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                hintText: "MM/YY",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'CVV',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.orange),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: size.height * 0.01),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe7e7e7),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          height: size.height * 0.06,
                          width: size.width / 2.8,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter card number';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                hintText: "123",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        isActive: currentStep >= 2,
      ),
      Step(
        state: currentStep > 3 ? StepState.complete : StepState.indexed,
        title: const Text("Info"),
        content: Form(
          key: formKeys[3],
          child: Column(
            children: [
              const Text(
                "Your Trip Information",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.green,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Your Date:- ${DateController.date}",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.brown,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Your name",
                          style: TextStyle(color: Colors.orange, fontSize: 17)),
                      Text(
                        fullName.text,
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Divider(thickness: 1),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text("Mobile No",
                            style:
                                TextStyle(color: Colors.orange, fontSize: 17)),
                      ),
                      Text(
                        mobileNo.text,
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Divider(thickness: 1),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text("From Address",
                            style:
                                TextStyle(color: Colors.orange, fontSize: 17)),
                      ),
                      Text(
                        fromAdd.text,
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Divider(thickness: 1),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text("To Address",
                            style:
                                TextStyle(color: Colors.orange, fontSize: 17)),
                      ),
                      Text(
                        toAdd.text,
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Divider(thickness: 1),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text("Your Address",
                            style:
                                TextStyle(color: Colors.orange, fontSize: 17)),
                      ),
                      Text(
                        yourAdd.text,
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Divider(thickness: 1),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text("Card holder name",
                            style:
                                TextStyle(color: Colors.orange, fontSize: 17)),
                      ),
                      Text(
                        cardHolName.text,
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Divider(thickness: 1),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text("Card No",
                            style:
                                TextStyle(color: Colors.orange, fontSize: 17)),
                      ),
                      Text(
                        cardNo.text,
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Divider(thickness: 1),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ],
          ),
        ),
        isActive: currentStep >= 3,
      ),
    ];
  }

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
          title: const Text("Save Your Trip",
              style: TextStyle(color: Colors.orange)),
        ),
        resizeToAvoidBottomInset: true,
        body: Theme(
          data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(primary: Colors.orange)),
          child: Stepper(
            physics: const BouncingScrollPhysics(),
            elevation: 0,
            currentStep: currentStep,
            onStepTapped: (value) {},
            type: StepperType.horizontal,
            steps: getSteps(),
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              final size = MediaQuery.of(context).size;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  currentStep != 0
                      ? Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                fixedSize:
                                    Size(size.width / 2.5, size.height * 0.067),
                                primary: const Color(0xffFCF6F0),
                              ),
                              onPressed: () {
                                currentStep == 0
                                    ? null
                                    : setState(() => currentStep -= 1);
                              },
                              child: const Text(
                                "Back",
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 18),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  Expanded(
                    child: currentStep == 3
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: currentStep != 0
                                  ? const EdgeInsets.all(8.0)
                                  : const EdgeInsets.all(0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              fixedSize:
                                  Size(size.width / 2.5, size.height * 0.067),
                              primary: const Color(0xffFCF6F0),
                              // primary: Colors.red,
                            ),
                            onPressed: () {
                              if (currentStep == 3) {
                                // StoreData(fullName: fullName.text);
                                // StoreData(fromAddress: fromAdd.text);
                                // StoreData(toAddress: toAdd.text);
                                ListOfStoredData.listOfData.add(
                                  StoreData(
                                    photoUrl: FurtherData.photoUrl,
                                    placeName: FurtherData.placeName,
                                    locationName: FurtherData.locationName,
                                    date: FurtherData.date,
                                    fullName: fullName.text,
                                    fromAddress: fromAdd.text,
                                    toAddress: toAdd.text,
                                  ),
                                );
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const SaveTripScreen(),
                                  ),
                                  (route) => false,
                                );
                              }
                            },
                            child: const Text(
                              "Confirm",
                              style:
                                  TextStyle(color: Colors.orange, fontSize: 18),
                            ),
                          )
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: currentStep != 0
                                  ? const EdgeInsets.all(8.0)
                                  : const EdgeInsets.all(0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              fixedSize:
                                  Size(size.width / 2.5, size.height * 0.067),
                              primary: const Color(0xffFCF6F0),
                              // primary: Colors.red,
                            ),
                            onPressed: () {
                              currentStep == getSteps().length - 1;

                              if (formKeys[currentStep]
                                  .currentState!
                                  .validate()) {
                                if (currentStep < getSteps().length - 1) {
                                  setState(() {
                                    currentStep = currentStep += 1;
                                  });
                                } else {
                                  currentStep = 0;
                                }
                              }
                            },
                            child: Text(
                              "Next",
                              style: const TextStyle(
                                  color: Colors.orange, fontSize: 18),
                            ),
                          ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
