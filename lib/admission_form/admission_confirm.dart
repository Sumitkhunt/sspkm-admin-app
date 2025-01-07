import 'dart:io';

import 'package:admin/screen/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../rout/routing_page.dart';

class confirm_admission extends StatefulWidget {
  final String educat;
  final String edusubcat;
  final String year;
  final String board;
  final String result;
  final String cname;
  final String coursename;
  final String semester;
  final String? fname;
  final String? mname;
  final String? lname;
  final String? dob;
  final String? email;
  final String? contact;
  final String? adharno;
  final String? address;
  final String? pincode;
  final String? city;
  final String? taluka;
  final String? district;
  final String? ffname;
  final String? fmname;
  final String? flname;
  final String? fphoneno;
  final String? foccupation;
  final String? fincome;
  final String? stdphoto;

  const confirm_admission(
      {Key? key,
      required this.educat,
      required this.edusubcat,
      required this.year,
      required this.board,
      required this.cname,
      required this.coursename,
      required this.semester,
      required this.result,
      this.fname,
      this.mname,
      this.lname,
      this.dob,
      this.email,
      this.contact,
      this.adharno,
      this.address,
      this.pincode,
      this.city,
      this.taluka,
      this.district,
      this.ffname,
      this.fmname,
      this.flname,
      this.fphoneno,
      this.foccupation,
      this.fincome,  this.stdphoto,
      })
      : super(key: key);

  @override
  State<confirm_admission> createState() => _confirm_admissionState();
}

class _confirm_admissionState extends State<confirm_admission> {
  // File? resultphoto1;
  TextEditingController _date = TextEditingController();
  final gloablekey = GlobalKey<FormState>();



  @override
  UserCredential? userCredential;
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
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //   mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('First Name :  ${widget.fname.toString()}',
                    style: TextStyle(fontSize: 15.sp)),
                Text('Middle Name : ${widget.mname.toString()}',
                    style: TextStyle(fontSize: 15.sp)),
                Text('Last Name : ${widget.lname.toString()}',
                    style: TextStyle(fontSize: 15.sp)),
                Text('DOB : ${widget.dob.toString()}',
                    style: TextStyle(fontSize: 15.sp)),
                Text('Email Id : ${widget.email.toString()}',
                    style: TextStyle(fontSize: 15.sp)),
                Text('Contact No : ${widget.contact.toString()}',
                    style: TextStyle(fontSize: 15.sp)),
                Text('Aadhar Card No : ${widget.adharno.toString()}',
                    style: TextStyle(fontSize: 15.sp)),
                Text('Address : ${widget.address.toString()}',
                    style: TextStyle(fontSize: 15.sp)),
                Text('Pincode : ${widget.pincode.toString()}',
                    style: TextStyle(fontSize: 15.sp)),
                Text('City : ${widget.city.toString()}',
                    style: TextStyle(fontSize: 15.sp)),
                Text('Taluka : ${widget.taluka.toString()}',
                    style: TextStyle(fontSize: 15.sp)),
                Text('District : ${widget.district.toString()}',
                    style: TextStyle(fontSize: 15.sp)),
                Text('Father First Name : ${widget.ffname.toString()}',
                    style: TextStyle(fontSize: 15.sp)),
                Text('Father Middle Name : ${widget.fmname.toString()}',
                    style: TextStyle(fontSize: 15.sp)),
                Text('Father Last Name : ${widget.flname.toString()}',
                    style: TextStyle(fontSize: 15.sp)),
                Text('Father Contact No : ${widget.fphoneno.toString()}',
                    style: TextStyle(fontSize: 15.sp)),
                Text('Father Occupation : ${widget.foccupation.toString()}',
                    style: TextStyle(fontSize: 15.sp)),
                Text('Father Income : ${widget.fincome.toString()}',
                    style: TextStyle(fontSize: 15.sp)),
                Text('Education Category  : ${widget.educat.toString()}',
                    style: TextStyle(fontSize: 15.sp)),
                Text('Education Sub Category  : ${widget.edusubcat.toString()}',
                    style: TextStyle(fontSize: 15.sp)),
                Text('Passing Year  : ${widget.year.toString()}',
                    style: TextStyle(fontSize: 15.sp)),
                Text('Board : ${widget.board.toString()}',
                    style: TextStyle(fontSize: 15.sp)),
                Text('Result : ${widget.result.toString()}',
                    style: TextStyle(fontSize: 15.sp)),
                Text('College/School Name : ${widget.cname.toString()}',
                    style: TextStyle(fontSize: 15.sp)),
                Text('Course Name : ${widget.coursename.toString()}',
                    style: TextStyle(fontSize: 15.sp)),
                Text('Semester/Standard Name : ${widget.semester.toString()}',
                    style: TextStyle(fontSize: 15.sp)),
               // Image.file(),

                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                      FirebaseFirestore.instance
                          .collection("regId")
                          .doc("lastregId")
                          .get()
                          .then((document) {
                        int lastregId =
                            document.exists ? document.data()!["reg_Id"] : 0;
                        String newOrderId = "regId${lastregId + 1}";
                        FirebaseFirestore.instance
                            .collection("admission_form")
                            .doc(widget.contact)
                            .set({
                          "Payment_status":"",
                          "Id": newOrderId,
                          "first name": widget.fname,
                          "middle name": widget.mname,
                          "last name": widget.lname,
                          "DOB": widget.dob,
                          "email": widget.email,
                          "contact no": widget.contact,
                          "aadhar no": widget.adharno,
                          "address no": widget.address,
                          "pincode no": widget.pincode,
                          "city": widget.city,
                          "taluka": widget.taluka,
                          "district": widget.district,
                          "father first name": widget.ffname,
                          "father middle name": widget.fmname,
                          "father last name": widget.flname,
                          "father contact no": widget.fphoneno,
                          "father occupatioin": widget.foccupation,
                          "father income": widget.fincome,
                          "education category": widget.educat,
                          "education sub category": widget.edusubcat,
                          "passing year": widget.year,
                          "board": widget.board,
                          "result": widget.result,
                          "college school name": widget.cname,
                          "course name": widget.coursename,
                          "semester standard": widget.semester,
                          "Form_Submit_date_time":
                          '${DateFormat.yMMMEd().format(DateTime.now())} ${DateFormat.jm().format(DateTime.now())}',
                          "utc_time":DateTime.now(),
                          "conformation":"Your profile has been under process",
                          "user_id":widget.contact
                        }).then((value) => FirebaseFirestore.instance
                                .collection("regId")
                                .doc("lastregId")
                                .update({"reg_Id": lastregId + 1}));
                      }).then((value) => Routingpage.pushreplase(
                              context: context, navigateto: admin_home())).then((value) =>  Fluttertoast.showToast(
                        msg: "Admission Form Successfully Submitted !!!",
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 3,
                        fontSize: 13.sp,
                      ));


                  },
                  child: Text("Confirm"),
                )
              ]),
        ),
      ),
    );
  }
}
