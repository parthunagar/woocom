import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:woocom/Components/appbar.dart';
import 'package:woocom/Components/commonwidget.dart';
import 'package:woocom/Components/emtryfield.dart';
import 'package:woocom/Validator/validator.dart';
import 'package:woocom/const/constant.dart';
import 'package:woocom/const/fontFamily_list.dart';
import 'package:woocom/utils/app_icon_utils.dart';
import 'package:woocom/theme/colors.dart';
import 'dart:async';
import 'package:woocom/utils/toast_utils.dart';

class EditProfileScreen extends StatefulWidget {
  // const SettingScreen({Key key}) : super(key: key);

  @override
  _EditProfileScreenScreenState createState() =>
      _EditProfileScreenScreenState();
}

class _EditProfileScreenScreenState extends State<EditProfileScreen> {
  //TODO: Variable

  // Image Related Variable
  var _image;
  final picker = ImagePicker();

  //DropDown for City and Area
  String? _dropDownCityValue, _dropDownSicietyValue;

  //TextFiled Controller
  TextEditingController fullNameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  TextEditingController addressC = TextEditingController();

  //TODO: Method

  // get Image from Gallery
  Future getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        print('ImageSource.gallery : ' + _image.toString());
      } else {
        print('No image selected.');
      }
    });
  }

  // get Image from Camera
  Future getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        print('ImageSource.camera : ' + _image.toString());
      } else {
        print('No image selected.');
      }
    });
  }

  // Upload image with select like camera or gallery
  sheet(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: h * 0.03),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pop(context);
                    getImageFromCamera();
                  });
                },
                child: Text(
                  "Camera",
                  style: TextStyle(
                    fontFamily: futuraMediumBt,
                    fontSize: 17,
                  ),
                ),
              ),
              SizedBox(height: h * 0.03),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pop(context);
                    getImageFromGallery();
                  });
                },
                child: Text(
                  "Gallery",
                  style: TextStyle(
                    fontFamily: futuraMediumBt,
                    fontSize: 17,
                  ),
                ),
              ),
              SizedBox(height: h * 0.03),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    fontFamily: futuraMediumBt,
                    fontSize: 17,
                  ),
                ),
              ),
              SizedBox(height: h * 0.03),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(title: "Edit Profile"),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: h * 0.02),
                  Center(
                    child: Stack(
                      // alignment: Alignment.center,
                      children: <Widget>[
                        // Container(
                        //     height: h * 0.19,
                        //     width: w * 0.37,
                        //     decoration: BoxDecoration(
                        //         color: grey, shape: BoxShape.circle),
                        //     child: ClipOval(
                        //         child: _image == null
                        //             ? Image.asset(bag, fit: BoxFit.cover,)
                        //             : Image.file(_image, fit: BoxFit.cover))),
                        Center(
                          child: CircleAvatar(
                            radius: 72.0,
                            backgroundColor: Colors.transparent,
                            backgroundImage: _image == null
                                ? AssetImage(AppIcon.bagImg1) as ImageProvider
                                : FileImage(_image),
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: h * 0.14, left: w * 0.22),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    sheet(context);
                                  });
                                },
                                child: Image.asset(
                                  AppIcon.editIcon,
                                  height: h * 0.043,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Positioned(
                        //     bottom: 0.5,
                        //     right: 10,
                        //     child: Container(
                        //         height: h * 0.043,
                        //         child: GestureDetector(
                        //             onTap: () {
                        //               setState(() {
                        //                 // getImage();
                        //                 sheet(context);
                        //               });
                        //             },
                        //             child: Image.asset(editIcon))))
                      ],
                    ),
                  ),
                  SizedBox(height: h * 0.02),
                  EntryField(
                    label: "Full Name",
                    labelFontSize: 18,
                    inputTextFamily: futuraHeavyFont,
                    controller: fullNameC,
                  ),
                  SizedBox(height: h * 0.01),
                  EntryField(
                      label: "Email Address",
                      labelFontSize: 18,
                      inputTextFamily: futuraHeavyFont,
                      controller: emailC),
                  SizedBox(height: h * 0.01),
                  // Text('Select City',
                  //     style: TextStyle(
                  //         fontFamily: futuraBookFont,
                  //         color: grey,
                  //         fontSize: 18)),
                  // SizedBox(height: h * 0.007),
                  // Container(
                  //   height: h * 0.035,
                  //   decoration: BoxDecoration(
                  //       border: Border(
                  //     bottom: BorderSide(
                  //       color: greyLight3,
                  //       width: 1,
                  //     ),
                  //   )),
                  //   child: DropdownButtonHideUnderline(
                  //     child: DropdownButton(
                  //       hint: _dropDownCityValue == null
                  //           ? Text(
                  //               '-- Select your city --',
                  //               style: TextStyle(
                  //                   fontFamily: futura, fontSize: 15.0),
                  //             )
                  //           : Text(
                  //               _dropDownCityValue.toString(),
                  //               style: TextStyle(
                  //                   fontFamily: futuraHeavyFont,
                  //                   fontSize: 16.0,
                  //                   color: darkBlue),
                  //             ),
                  //       isExpanded: true,
                  //       icon: Icon(
                  //         Icons.keyboard_arrow_down_outlined,
                  //         color: darkBlue,
                  //       ),
                  //       iconSize: h * 0.037,
                  //       style: TextStyle(
                  //           color: darkBlue,
                  //           fontFamily: futura,
                  //           fontSize: 15.0),
                  //       onChanged: (val) {
                  //         setState(
                  //           () {
                  //             _dropDownCityValue = val.toString();
                  //           },
                  //         );
                  //       },
                  //       items: [
                  //         'Surat',
                  //         'Gandhinagar',
                  //         'Rajkot',
                  //         "Bardoli",
                  //         "Navasari",
                  //         "Daman",
                  //         ""
                  //       ].map(
                  //         (val) {
                  //           return DropdownMenuItem<String>(
                  //             value: val,
                  //             child: Text(val),
                  //           );
                  //         },
                  //       ).toList(),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: h * 0.035),
                  // Text('Select Society / Area',
                  //     style: TextStyle(
                  //         fontFamily: futuraBookFont,
                  //         color: grey,
                  //         fontSize: 18)),
                  // SizedBox( height: h * 0.007 ),
                  // Container(
                  //   height: h * 0.035,
                  //   decoration: BoxDecoration(
                  //       border: Border(
                  //     bottom: BorderSide(
                  //       color: greyLight3,
                  //       width: 1,
                  //     ),
                  //   )),
                  //   child: DropdownButtonHideUnderline(
                  //     child: DropdownButton(
                  //       hint: _dropDownSicietyValue == null
                  //           ? Text(
                  //               '-- Select your society / area --',
                  //               style: TextStyle(
                  //                   fontFamily: futura, fontSize: 15.0),
                  //             )
                  //           : Text(
                  //               _dropDownSicietyValue.toString(),
                  //               style: TextStyle(
                  //                   fontFamily: futuraHeavyFont,
                  //                   fontSize: 16.0,
                  //                   color: darkBlue),
                  //             ),
                  //       isExpanded: true,
                  //       icon: Icon(
                  //         Icons.keyboard_arrow_down_outlined,
                  //         color: darkBlue,
                  //       ),
                  //       iconSize: h * 0.037,
                  //       style: TextStyle(
                  //           color: darkBlue,
                  //           fontFamily: futura,
                  //           fontSize: 15.0),
                  //       onChanged: (val) {
                  //         setState(
                  //           () {
                  //             _dropDownSicietyValue = val.toString();
                  //           },
                  //         );
                  //       },
                  //       items: [
                  //         'Surat',
                  //         'Gandhinagar',
                  //         'Rajkot',
                  //         "Bardoli",
                  //         "Navasari",
                  //         "Daman",
                  //         ""
                  //       ].map(
                  //         (val) {
                  //           return DropdownMenuItem<String>(
                  //             value: val,
                  //             child: Text(val),
                  //           );
                  //         },
                  //       ).toList(),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: h * 0.035),
                  EntryField(
                      label: "Address",
                      controller: addressC,
                      keyboardType: TextInputType.streetAddress,
                      maxLines: 2,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            // if(FocusScope.of(context).hasFocus){
                            //   FocusScope.of(context).unfocus();
                            // }

                          });
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyAppSearch()));
                        },
                        icon: Icon(
                          Icons.location_on,
                          color: greyLight4,
                          size: h * 0.04,
                        ),
                      ),
                      suffixIconConstraints: BoxConstraints(
                        maxHeight: h * 0.05,
                        maxWidth: w * 0.1,
                      ),
                      minLines: 2),
                  SizedBox(height: h * 0.01),
                  EntryField(
                    label: "Phone Number",
                    labelFontSize: 18,
                    inputTextFamily: futuraHeavyFont,
                    controller: phoneC,
                    maxLength: 10,
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: h * 0.07),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // showProgress == false ?
                CustomButton(
                  label: "Save",
                  lableSize: 19,
                  width: w * 0.55,
                  height: h * 0.06,
                  fontWeight: FontWeight.normal,
                  onTap: () {
                    RegExp regexEmail = new RegExp(emailPattern);
                    RegExp regexName = new RegExp(namePattern);
                    if (fullNameC.text.isEmpty) {
                      ToastUtils().showToast("Full name is required.");
                    } else if (emailC.text.isEmpty) {
                      ToastUtils().showToast("Email is required.");
                    }
                    // else if (_dropDownCityValue == null) {
                    //   ToastUtils().showToast("Please select the city.", context,
                    //       duration: Toast.LENGTH_SHORT,
                    //       gravity: Toast.LENGTH_SHORT);
                    // }
                    // else if (_dropDownSicietyValue == null) {
                    //   ToastUtils().showToast("Please select the society or area.", context,
                    //       duration: Toast.LENGTH_SHORT,
                    //       gravity: Toast.LENGTH_SHORT);
                    // }
                    else if (phoneC.text.isEmpty) {
                      ToastUtils().showToast("Phone number is required.");
                    } else if (!regexEmail.hasMatch(emailC.text.toString())) {
                      ToastUtils().showToast("Please enter a valid email address.");
                    } else if (!regexName.hasMatch(fullNameC.text.toString())) {
                      ToastUtils().showToast("Numeric value not allowed in full name.");
                    } else if (phoneC.text.length < 10) {
                      ToastUtils().showToast("Phone number length must be 10 digits.");
                    } else {
                      ToastUtils().showToast("DONE.");
                    }
                    // Navigator.pushNamed( context, PageRoutes.checkOutPaymentScreen);
                  },
                ),
                // : ProgressBarIndicator(),
                SizedBox(height: h * 0.02)
              ],
            ),
            // ),
          ),
        ],
      ),
    );
  }
}
