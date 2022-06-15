import 'dart:typed_data';

import 'package:demo_blnk/users.dart';
import 'dart:async';
import 'dart:io';
import 'package:demo_blnk/users_reg.dart';
import 'package:edge_detection/edge_detection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'users.dart';
import 'api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirstNameController = TextEditingController();
  final LastNameController = TextEditingController();
  final AddressController = TextEditingController();
  final LandlineController = TextEditingController();
  final MobileController = TextEditingController();
  String initialCountry = 'EG';
  PhoneNumber number = PhoneNumber(isoCode: 'EG');
  String name = '';
  double padding = 10.0;
  String area = 'Select Area';
  int id = 0;
  File? _image;
  String? _imagePath;
  Uint8List? _imagebytes;
  Color colorBeforeF = Colors.white;
  Color colorBeforeB = Colors.white;
  Color colorAfter = Color.fromRGBO(93, 206, 95, 1);
  File? _image2;
  String? _imagePath2;
  Uint8List? _imagebytes2;
  String? _imageName = '1';
  String? _imageName2 = '2';
  late CloudApi api;
  String downloadlink1 = '';
  String downloadlink2 = '';
  var upload = Colors.white;

  @override
  void initState() {
    super.initState();
    rootBundle
        .loadString('assets/credentials.json')
        .then((json) => {api = CloudApi(json)});
  }

  void getImage() {
    setState(() {});
  }

  void _saveImage() async {
    final response = await api.save(_imageName!, _imagebytes!);
    downloadlink1 = response.downloadLink.toString();
    print(response.downloadLink);
  }

  void _saveImage2() async {
    final response2 = await api.save(_imageName2!, _imagebytes2!);
    downloadlink2 = response2.downloadLink.toString();
    print(response2.downloadLink);
  }

  void detectObject() async {
    _imagePath = await EdgeDetection.detectEdge;
    _image = File(_imagePath.toString());
    _imagebytes = _image!.readAsBytesSync();
    _imageName = _image!.path.split('/').last;
    _imageName = '1' + _imageName!;
    print(_image);
    setState(() {
      colorBeforeF = colorAfter;
    });
  }

  void detectObject2() async {
    _imagePath2 = await EdgeDetection.detectEdge;
    _image2 = File(_imagePath2.toString());
    _imagebytes2 = _image2!.readAsBytesSync();
    _imageName2 = _image!.path.split('/').last;
    _imageName2 = '2' + _imageName2!;
    setState(() {
      colorBeforeB = colorAfter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 35, 102, 1),
      body: Visibility(
        visible: true,
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Text field First Name
                Padding(
                  padding: EdgeInsets.all(padding),
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: FirstNameController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: () {
                              FirstNameController.clear();
                            },
                            icon: Icon(Icons.clear)),
                        hintText: 'Enter Your First Name',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(35, 35, 102, 1))),
                  ),
                ),

                //TextField last Name
                Padding(
                  padding: EdgeInsets.all(padding),
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: LastNameController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide:
                                BorderSide(width: 3, color: Colors.white)),
                        suffixIcon: IconButton(
                            onPressed: () {
                              LastNameController.clear();
                            },
                            icon: Icon(Icons.clear)),
                        hintText: 'Enter Your Last Name',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(35, 35, 102, 1))),
                  ),
                ),

                //TextField Address
                Padding(
                  padding: EdgeInsets.all(padding),
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: AddressController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: Colors.grey.shade700)),
                        suffixIcon: IconButton(
                            onPressed: () {
                              AddressController.clear();
                            },
                            icon: Icon(Icons.clear)),
                        hintText: 'Enter Your Address',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(35, 35, 102, 1))),
                  ),
                ),

                //Area
                Padding(
                  padding: EdgeInsets.all(padding),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                                width: 1, color: Colors.grey.shade700))),
                    value: area,
                    icon: const Icon(Icons.arrow_drop_down),
                    elevation: 16,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(35, 35, 102, 1)),
                    onChanged: (String? newValue) {
                      setState(() {
                        area = newValue!;
                      });
                    },
                    isExpanded: true,
                    items: <String>[
                      'Select Area',
                      '5th Settlement',
                      'Nasr City',
                      'Sheikh Zayed',
                      '6th of October',
                      'Zamalek'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Center(
                          child: Text(
                            value,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                /////

                //TextField Landline
                Padding(
                  padding: EdgeInsets.all(padding),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    controller: LandlineController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: () {
                              LandlineController.clear();
                            },
                            icon: Icon(Icons.clear)),
                        hintText: '          Enter Your Landline',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(35, 35, 102, 1))),
                  ),
                ),

                //Mobile Number
                Padding(
                  padding: EdgeInsets.fromLTRB(10, padding, 10, padding),
                  child: InternationalPhoneNumberInput(
                    textAlign: TextAlign.center,
                    maxLength: 11,
                    inputDecoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          onPressed: () {
                            MobileController.clear();
                          },
                          icon: Icon(Icons.clear),
                        ),
                        border: OutlineInputBorder(),
                        hintText: 'Enter Your Mobile',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(35, 35, 102, 1))),
                    onInputChanged: (PhoneNumber number) {
                      print(number.phoneNumber);
                    },
                    onInputValidated: (bool value) {
                      print(value);
                    },
                    selectorConfig: SelectorConfig(
                      setSelectorButtonAsPrefixIcon: true,
                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                      showFlags: false,
                    ),
                    ignoreBlank: false,
                    hintText: 'Enter Phone',
                    autoValidateMode: AutovalidateMode.disabled,
                    selectorTextStyle:
                        TextStyle(color: Color.fromRGBO(35, 35, 102, 1)),
                    initialValue: number,
                    textFieldController: MobileController,
                    formatInput: false,
                    keyboardType: TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    inputBorder: OutlineInputBorder(),
                    onSaved: (PhoneNumber number) {
                      print('On Saved: $number');
                    },
                  ),
                ),

                //Scanning
                Center(
                  child: Wrap(
                    children: [
                      //Scan front id
                      SizedBox(
                        width: 110,
                        child: MaterialButton(
                          onPressed: detectObject,
                          child: Text(
                            'Scan Id Frond Side',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(35, 35, 102, 1)),
                            textAlign: TextAlign.center,
                          ),
                          color: colorBeforeF,
                        ),
                      ),
                      SizedBox(width: 40),
                      //Scan back id
                      SizedBox(
                        width: 110,
                        child: MaterialButton(
                          onPressed: detectObject2,
                          child: Text(
                            'Scan Id Back Side',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(35, 35, 102, 1)),
                            textAlign: TextAlign.center,
                          ),
                          color: colorBeforeB,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2),
                MaterialButton(
                  onPressed: () async {
                    _saveImage();
                    _saveImage2();
                    setState(() {
                      upload = Color.fromRGBO(93, 206, 95, 1);
                    });
                  },
                  child: Text(
                    'Upload',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(35, 35, 102, 1)),
                    textAlign: TextAlign.center,
                  ),
                  color: upload,
                )
                //save button
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          width: double.infinity,
          height: 60,
          child: MaterialButton(
            onPressed: () async {
              id++;
              final user = User(
                  id: id,
                  first_name: FirstNameController.text,
                  last_name: LastNameController.text,
                  address: AddressController.text,
                  area: area,
                  landline: LandlineController.text,
                  mobile: MobileController.text,
                  frontId: downloadlink1.toString(),
                  backId: downloadlink2.toString());

              await UserReg.insert([user.toJson()]);

              setState(() {
                Navigator.pushNamed(context, 'exitpage');
              });
            },
            child: Text(
              'Save',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color.fromRGBO(35, 35, 102, 1)),
              textAlign: TextAlign.center,
            ),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
