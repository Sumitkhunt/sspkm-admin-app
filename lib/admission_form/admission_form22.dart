import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import '../common_widget/commen_textfiled.dart';
import '../rout/routing_page.dart';
import 'admission_confirm.dart';

class admission_form22 extends StatefulWidget {
  final String fname;
  final String mname;
  final String lname;
  final String dob;
  final String email;
  final String contact;
  final String adharno;
  final String address;
  final String pincode;
  final String city;
  final String taluka;
  final String district;
  final String ffname;
  final String fmname;
  final String flname;
  final String fphoneno;
  final String foccupation;
  final String fincome;

  const admission_form22(
      {Key? key,
      required this.fname,
      required this.mname,
      required this.lname,
      required this.dob,
      required this.email,
      required this.contact,
      required this.adharno,
      required this.address,
      required this.pincode,
      required this.city,
      required this.taluka,
      required this.district,
      required this.ffname,
      required this.fmname,
      required this.flname,
      required this.fphoneno,
      required this.foccupation,
      required this.fincome})
      : super(key: key);

  @override
  State<admission_form22> createState() => _admission_formState();
}

class _admission_formState extends State<admission_form22> {
  final gloablekey = GlobalKey<FormState>();
  TextEditingController add_controler = TextEditingController();
  TextEditingController _date = TextEditingController();
  TextEditingController edu_cat_controler = TextEditingController();
  TextEditingController edu_sub_cat_controler = TextEditingController();
  TextEditingController year_controler = TextEditingController();
  TextEditingController board_controler = TextEditingController();
  TextEditingController result_controler = TextEditingController();

  TextEditingController college_controler = TextEditingController();
  TextEditingController course_controler = TextEditingController();
  TextEditingController sem_controler = TextEditingController();
  TextEditingController Email_controler = TextEditingController();
  TextEditingController pass_controler = TextEditingController();
  TextEditingController fName_controler = TextEditingController();
  TextEditingController occupation_controler = TextEditingController();
  TextEditingController mName_controler = TextEditingController();
  TextEditingController lName_controler = TextEditingController();
  TextEditingController phone_controler = TextEditingController();
  TextEditingController fphone_controler = TextEditingController();
  TextEditingController income_controler = TextEditingController();
  TextEditingController adhar_controler = TextEditingController();
  TextEditingController pincode_controler = TextEditingController();
  TextEditingController ffname_controler = TextEditingController();
  TextEditingController fmname_controler = TextEditingController();
  TextEditingController flname_controler = TextEditingController();
  TextEditingController city_controler = TextEditingController();
  TextEditingController taluka_controler = TextEditingController();
  TextEditingController district_controler = TextEditingController();
  TextEditingController rphoto_controler = TextEditingController();
  String imageUrl = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Admission Form",
              style: TextStyle(fontSize: 25, color: Colors.black)),
        ),
        backgroundColor: Colors.blue[600],
        elevation: 0,
      ),
      body: Form(
        key: gloablekey,
        child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      Text("Study Information",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                      SizedBox(
                        height: 10,
                      ),
                      Text("* Last Year Study Information *",
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 15.sp,
                      ),
                      Commen_Textfiled(
                        hinttext: "Enter education category",

                        // filed: true,
                        obscure: false,
                        // fillcolor: Color(0xffFD683D),
                        labeltext: "Education category",
                        controller: edu_cat_controler,
                        validator: (value) {
                          final bool eduvalid =
                              RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%A-Z-a-z-]')
                                  .hasMatch(value!);
                          if (eduvalid) {
                            return null;
                          } else {
                            return "Please enter valid education category Name";
                          }
                          if (value!.isEmpty) {
                            return "Enter education category";
                          }
                        },
                        onchange: (value) {
                          gloablekey.currentState!.validate();
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Commen_Textfiled(
                        hinttext: "Education sub category",

                        maxlen: null,
                        // filed: true,
                        obscure: false,
                        // fillcolor: Color(0xffFD683D),
                        labeltext: "Education sub category",
                        controller: edu_sub_cat_controler,
                        validator: (value) {
                          final bool edusubValid = RegExp(
                                  r'[!@#<>?":_`~;[\]\\|=+)(*&^%A-Z-a-z-0-9-]')
                              .hasMatch(value!);
                          if (edusubValid) {
                            return null;
                          } else {
                            return "Please enter valid category";
                          }
                          if (value!.isEmpty) {
                            return "Enter education sub category";
                          }
                        },
                        onchange: (value) {
                          gloablekey.currentState!.validate();
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Commen_Textfiled(
                        hinttext: "Enter passing year",

                        maxlen: 1,
                        ktype: TextInputType.number,
                        msxlength: 4,
                        obscure: false,
                        // fillcolor: Color(0xffFD683D),
                        labeltext: "Year",
                        controller: year_controler,
                        validator: (value) {
                          final bool yearValid =
                              RegExp(r'(^(?:[+0]9)?[0-9]{4,4}$)')
                                  .hasMatch(value!);
                          if (yearValid) {
                            return null;
                          } else {
                            return "Please enter valid year";
                          }
                          if (value!.isEmpty) {
                            return "Enter year";
                          }
                        },
                        onchange: (value) {
                          gloablekey.currentState!.validate();
                        },
                      ),
                          SizedBox(
                            height: 15,
                          ),
                      Commen_Textfiled(
                        hinttext: "Enter board name",

                        maxlen: null,
                        // filed: true,
                        obscure: false,
                        // fillcolor: Color(0xffFD683D),
                        labeltext: "Board",
                        controller: board_controler,
                        validator: (value) {
                          final bool boardValid =
                              RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%A-Z-a-z-]')
                                  .hasMatch(value!);
                          if (boardValid) {
                            return null;
                          } else {
                            return "Please enter valid board name";
                          }
                          if (value!.isEmpty) {
                            return "Enter board name";
                          }
                        },
                        onchange: (value) {
                          gloablekey.currentState!.validate();
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Commen_Textfiled(
                        hinttext: "Enter last year result",

                        maxlen: 1,
                        ktype: TextInputType.number,
                        msxlength: 5,
                        obscure: false,
                        // fillcolor: Color(0xffFD683D),
                        labeltext: "Result",
                        controller: result_controler,
                        validator: (value) {
                          final bool resultValid = RegExp(
                                  r'(^100(\.0{0,2})? *%?$|^\d{1,2}(\.\d{1,2})? *%?$)')
                              .hasMatch(value!);
                          if (resultValid) {
                            return null;
                          } else {
                            return "Please enter valid result";
                          }
                          if (value!.isEmpty) {
                            return "Enter result";
                          }
                        },
                        onchange: (value) {
                          gloablekey.currentState!.validate();
                        },
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Center(
                        child: Text("* Current Exam Progress *",
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Commen_Textfiled(
                        hinttext: "Enter College Name",

                        maxlen: null,
                        // filed: true,
                        obscure: false,
                        // fillcolor: Color(0xffFD683D),
                        labeltext: "College Name",
                        controller: college_controler,
                        validator: (value) {
                          final bool collegeValid =
                              RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%A-Z-a-z-]')
                                  .hasMatch(value!);
                          if (collegeValid) {
                            return null;
                          } else {
                            return "Please enter valid college name";
                          }
                          if (value!.isEmpty) {
                            return "Enter college name";
                          }
                        },
                        onchange: (value) {
                          gloablekey.currentState!.validate();
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Commen_Textfiled(
                        hinttext: "Enter Course Name",

                        maxlen: null,
                        // filed: true,
                        obscure: false,
                        // fillcolor: Color(0xffFD683D),
                        labeltext: "Course name",
                        controller: course_controler,
                        validator: (value) {
                          final bool courseValid =
                              RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%A-Z-a-z-]')
                                  .hasMatch(value!);
                          if (courseValid) {
                            return null;
                          } else {
                            return "Please enter valid course name";
                          }
                          if (value!.isEmpty) {
                            return "Enter course name";
                          }
                        },
                        onchange: (value) {
                          gloablekey.currentState!.validate();
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Commen_Textfiled(
                        hinttext: "Enter semester/standard",

                        maxlen: null,
                        // filed: true,
                        obscure: false,
                        // fillcolor: Color(0xffFD683D),
                        labeltext: "Semester/Standard",
                        controller: sem_controler,
                        validator: (value) {
                          final bool semValid = RegExp(
                                  r'[!@#<>?":_`~;[\]\\|=+)(*&^%A-Z-a-z-0-9-]')
                              .hasMatch(value!);
                          if (semValid) {
                            return null;
                          } else {
                            return "Please enter valid category";
                          }
                          if (value!.isEmpty) {
                            return "Enter education sub category";
                          }
                        },
                        onchange: (value) {
                          gloablekey.currentState!.validate();
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(width: 1.5),
                        ),
                        child:TextButton(
                          onPressed: () async {
                            ImagePicker picker = ImagePicker();
                            XFile? file = await picker.pickImage(
                                source: ImageSource.gallery);
                            if (file == null) return;

                            String uniqueFilename =
                                widget.contact.toString();
                            Reference reference =
                                FirebaseStorage.instance.ref();
                            Reference refImg = reference.child("images");
                            Reference refUploadImage =
                                refImg.child(uniqueFilename);

                            try {
                              await refUploadImage.putFile(File(file.path));
                              String imageUrl =
                                  await refUploadImage.getDownloadURL();
                              print('Image URL: $imageUrl');

                               await FirebaseFirestore.instance
                                  .collection("admission_form")
                                  .doc(widget.contact)
                                  .update({
                                "Student photo": imageUrl,
                              });
                              print('User data updated successfully');
                              // Navigator.pop(context);
                            } catch (e) {
                              print('Error updating user data: $e');
                            }
                          },
                          child: Text(
                            "Student Photo",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(width: 1.5),
                              color: Colors.white10,
                            ),
                            child:TextButton(
                              onPressed: () async {
                                ImagePicker picker = ImagePicker();
                                XFile? file = await picker.pickImage(
                                    source: ImageSource.gallery);
                                if (file == null) return;

                                String uniqueFilename =
                                    FirebaseAuth.instance.currentUser!.uid;
                                Reference reference =
                                FirebaseStorage.instance.ref();
                                Reference refImg = reference.child("results");
                                Reference refUploadImage =
                                refImg.child(uniqueFilename);

                                try {
                                  await refUploadImage.putFile(File(file.path));
                                  String resulturl =
                                  await refUploadImage.getDownloadURL();
                                  print('Image URL: $resulturl');

                                  await FirebaseFirestore.instance
                                      .collection("admission_form")
                                      .doc(FirebaseAuth.instance.currentUser!.uid)
                                      .update({
                                    "Result photo": resulturl,
                                  });
                                  print('User data updated successfully');
                                  // Navigator.pop(context);
                                } catch (e) {
                                  print('Error updating user data: $e');
                                }
                              },
                              child: Text(
                                "Result Photo",
                                style: TextStyle(color: Colors.black,fontSize: 20),
                              ),

                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                      SizedBox(
                        height: 30.sp,
                        width: 250.sp,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (gloablekey.currentState!.validate()){
                            Routingpage.gotonext(
                                context: context,
                                navigateto: confirm_admission(
                                  educat: edu_cat_controler.text,
                                  board: board_controler.text,
                                  cname: college_controler.text,
                                  coursename: course_controler.text,
                                  edusubcat: edu_sub_cat_controler.text,
                                  semester: sem_controler.text,
                                  year: year_controler.text,
                                  result: result_controler.text,
                                  fname: widget.fname,
                                  mname: widget.mname,
                                  lname: widget.lname,
                                  dob: widget.dob,
                                  email: widget.email,
                                  address: widget.address,
                                  adharno: widget.adharno,
                                  city: widget.city.toString(),
                                  contact: widget.contact.toString(),
                                  pincode: widget.pincode.toString(),
                                  taluka: widget.taluka.toString(),
                                  district: widget.district.toString(),
                                  ffname: widget.ffname.toString(),
                                  fmname: widget.fmname.toString(),
                                  flname: widget.flname.toString(),
                                  fincome: widget.fincome.toString(),
                                  foccupation: widget.foccupation.toString(),
                                  fphoneno: widget.fphoneno.toString(),
                                  // imageurl: pdffile,
                                  // stdphoto: imageUrl,
                                ));
                            }
                          },
                          child: Text(
                            "NEXT",
                            style: TextStyle(fontSize: 20.sp),
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
    );
  }
}
