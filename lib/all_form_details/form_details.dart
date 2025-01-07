import 'dart:io';

import 'package:admin/all_form_details/all_form.dart';
import 'package:admin/idproof_photo.dart';
import 'package:admin/update_data/update_student_detailes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

import '../accept_reject/accept_reject_form.dart';
import '../common_widget/comman_button.dart';
import '../rout/routing_page.dart';

class view_form extends StatefulWidget {
  final String educat;
  final String edusubcat;
  final String year;
  final String board;
  final String result;
  final String cname;
  final String coursename;
  final String semester;
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
  final String? stdphoto;
  final String? resultphoto;
  final String? idproof;
  final String date_time;
  final String fees_status;
  final String id;
  final String user_id;
  final String conformation;

  const view_form({
    Key? key,
    required this.educat,
    required this.edusubcat,
    required this.year,
    required this.board,
    required this.result,
    required this.cname,
    required this.coursename,
    required this.semester,
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
    required this.fincome,
    this.stdphoto,
    required this.date_time,
    required this.fees_status,
    required this.id,
    required this.user_id,
    required this.conformation,
    this.resultphoto,
    this.idproof,
  }) : super(key: key);

  @override
  State<view_form> createState() => _view_formState();
}

class _view_formState extends State<view_form> {
  // File? resultphoto1;
  TextEditingController _date = TextEditingController();
  final gloablekey = GlobalKey<FormState>();

  @override
  UserCredential? userCredential;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Student Details"),
        ),
        backgroundColor: Colors.blue[600],
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Routingpage.gotonext(
                    context: context,
                    navigateto: update_std_detailes(
                      educat: widget.educat,
                      edusubcat: widget.edusubcat,
                      year: widget.year,
                      board: widget.board,
                      result: widget.result,
                      cname: widget.cname,
                      coursename: widget.coursename,
                      semester: widget.semester,
                      fname: widget.fname,
                      mname: widget.mname,
                      lname: widget.lname,
                      dob: widget.dob,
                      email: widget.email,
                      contact: widget.contact,
                      adharno: widget.adharno,
                      address: widget.address,
                      pincode: widget.pincode,
                      city: widget.city,
                      taluka: widget.taluka,
                      district: widget.district,
                      ffname: widget.ffname,
                      fmname: widget.fmname,
                      flname: widget.flname,
                      fphoneno: widget.fphoneno,
                      foccupation: widget.foccupation,
                      fincome: widget.fincome,
                      stdphoto: widget.stdphoto.toString(),
                      resultphoto: widget.resultphoto.toString(),
                      idproof: widget.idproof.toString(),
                      date_time: widget.date_time,
                      fees_status: widget.fees_status,
                      id: widget.id,
                      user_id: widget.user_id,
                      conformation: widget.conformation,
                    ));
              },
              icon: Icon(Icons.edit))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                  radius: 80,
                  // backgroundColor: Colors.grey[400],
                  child: ClipOval(
                      child: widget.stdphoto == null
                          ? Image.network(
                              "https://i.pinimg.com/736x/de/59/4e/de594ec09881da3fa66d98384a3c72ff.jpg",
                              fit: BoxFit.cover,
                              height: 200,
                              width: 200,
                            )
                          : Image.network(
                              widget.stdphoto.toString(),
                              fit: BoxFit.cover,
                              height: 200,
                              width: 200,
                            ))),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Your Registration Id : " + widget.id,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 1,
            ),
            Text(
              "   First  Name : " + widget.fname,
              style: TextStyle(fontSize: 15),
            ),
            Divider(
              height: 10,
              thickness: 1,
            ),
            Text(
              "   Middle Name : " + widget.mname,
              style: TextStyle(fontSize: 15),
            ),
            Divider(
              height: 10,
              thickness: 1,
            ),
            Text(
              "   Last Name : " + widget.lname,
              style: TextStyle(fontSize: 15),
            ),
            Divider(
              height: 10,
              thickness: 1,
            ),
            Text(
              "   Date Of Birth : " + widget.dob,
              style: TextStyle(fontSize: 15),
            ),
            Divider(
              height: 10,
              thickness: 1,
            ),
            Text(
              "   Email Id : " + widget.email,
              style: TextStyle(fontSize: 15),
            ),
            Divider(
              height: 10,
              thickness: 1,
            ),
            Text(
              "   Contact No : " + widget.contact,
              style: TextStyle(fontSize: 15),
            ),
            Divider(
              height: 10,
              thickness: 1,
            ),
            Text(
              "   Aadhar No : " + widget.adharno,
              style: TextStyle(fontSize: 15),
            ),
            Divider(
              height: 10,
              thickness: 1,
            ),
            Text(
              "   Address No : " + widget.address,
              style: TextStyle(fontSize: 15),
            ),
            Divider(
              height: 10,
              thickness: 1,
            ),
            Text(
              "   Pincode No : " + widget.pincode,
              style: TextStyle(fontSize: 15),
            ),
            Divider(
              height: 10,
              thickness: 1,
            ),
            Text(
              "   City : " + widget.city,
              style: TextStyle(fontSize: 15),
            ),
            Divider(
              height: 10,
              thickness: 1,
            ),
            Text(
              "   Taluka : " + widget.taluka,
              style: TextStyle(fontSize: 15),
            ),
            Divider(
              height: 10,
              thickness: 1,
            ),
            Text(
              "   District : " + widget.district,
              style: TextStyle(fontSize: 15),
            ),
            Divider(
              height: 10,
              thickness: 1,
            ),
            Text(
              "   Father first name : " + widget.ffname,
              style: TextStyle(fontSize: 15),
            ),
            Divider(
              height: 10,
              thickness: 1,
            ),
            Text(
              "   Father middle name : " + widget.fmname,
              style: TextStyle(fontSize: 15),
            ),
            Divider(
              height: 10,
              thickness: 1,
            ),
            Text(
              "   Father last name : " + widget.flname,
              style: TextStyle(fontSize: 15),
            ),
            Divider(
              height: 10,
              thickness: 1,
            ),
            Text(
              "   Father contact no : " + widget.fphoneno,
              style: TextStyle(fontSize: 15),
            ),
            Divider(
              height: 10,
              thickness: 1,
            ),
            Text(
              "   Father occupatioin : " + widget.foccupation,
              style: TextStyle(fontSize: 15),
            ),
            Divider(
              height: 10,
              thickness: 1,
            ),
            Text(
              "   Father income : " + widget.fincome,
              style: TextStyle(fontSize: 15),
            ),
            Divider(
              height: 10,
              thickness: 1,
            ),
            Text(
              "   Education category : " + widget.educat,
              style: TextStyle(fontSize: 15),
            ),
            Divider(
              height: 10,
              thickness: 1,
            ),
            Text(
              "   Education sub category : " + widget.edusubcat,
              style: TextStyle(fontSize: 15),
            ),
            Divider(
              height: 10,
              thickness: 1,
            ),
            Text(
              "   Passing year : " + widget.year,
              style: TextStyle(fontSize: 15),
            ),
            Divider(
              height: 10,
              thickness: 1,
            ),
            Text(
              "   Board : " + widget.board,
              style: TextStyle(fontSize: 15),
            ),
            Divider(
              height: 10,
              thickness: 1,
            ),
            Text(
              "   Result : " + widget.result,
              style: TextStyle(fontSize: 15),
            ),
            Divider(
              height: 10,
              thickness: 1,
            ),
            Text(
              "   College school name : " + widget.cname,
              style: TextStyle(fontSize: 15),
            ),
            Divider(
              height: 10,
              thickness: 1,
            ),
            Text(
              "   Course name : " + widget.coursename,
              style: TextStyle(fontSize: 15),
            ),
            Divider(
              height: 10,
              thickness: 1,
            ),
            Text(
              "   Semester Standard : " + widget.semester,
              style: TextStyle(fontSize: 15),
            ),
            Divider(
              height: 20,
              thickness: 1,
            ),
            Container(
              child: widget.resultphoto == ""
                  ? Center(
                      child: Text(
                        "    No Result Uploaded !!",
                        style: TextStyle(fontSize: 25.sp),
                      ),
                    )
                  : GestureDetector(
                      child: Center(
                          child: Column(
                        children: [
                          Text(
                            "  * Result Photo *",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Image.network(
                            widget.resultphoto.toString(),
                            fit: BoxFit.cover,
                            height: 300,
                            width: 300,
                          ),
                        ],
                      )),
                      onTap: () {
                        Routingpage.gotonext(
                            context: context,
                            navigateto: photo(
                              wphoto: widget.resultphoto.toString(),
                              title: "Result Photo",
                            ));
                      },
                    ),
            ),
            Divider(
              height: 30,
              thickness: 1,
            ),
            Container(
              child: widget.idproof == ""
                  ? Center(
                      child: Text("    No Id-Proof Uploaded !!",
                          style: TextStyle(fontSize: 25.sp)),
                    )
                  : GestureDetector(
                      child: Center(
                          child: Column(
                        children: [
                          Text(
                            "  * Id Proof Photo *",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Image.network(
                            widget.idproof.toString(),
                            fit: BoxFit.cover,
                            height: 300,
                            width: 300,
                          ),
                        ],
                      )),
                      onTap: () {
                        Routingpage.gotonext(
                            context: context,
                            navigateto: photo(
                              wphoto: widget.idproof.toString(),
                              title: "Id Photo",
                            ));
                      },
                    ),
            ),
            Divider(
              height: 30,
              thickness: 1,
            ),
            widget.fees_status != ""
                ? Text(
                    "  Payment Status : " + widget.fees_status,
                    style: TextStyle(
                        fontSize: 20,
                        color: widget.fees_status == 'pending'
                            ? Colors.orange
                            : widget.fees_status == 'cancel'
                                ? Colors.red[900]
                                : Colors.green),
                  )
                : SizedBox(
                    height: 0,
                  ),
            SizedBox(
              height: 10,
            ),
            Text(
              "  Date : " + widget.date_time,
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 20,
            ),
            widget.fees_status == ""
                ? Center(
                    child: Container(
                        child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          comman_button(
                            ontap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                      "Accept Form",
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    content: Text(
                                      "Are you sure you want to Accept ${widget.fname} Student Form?",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text(
                                          "Cancle",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 20),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: Text(
                                          "Accept",
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 24),
                                        ),
                                        onPressed: () {
                                          FirebaseFirestore.instance
                                              .collection("admission_form")
                                              .doc(widget.user_id)
                                              .update({
                                            "conformation":
                                                "Your profile has been approved",
                                            "Payment_status": "pending",
                                          });
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            color: Colors.green,
                            text: "Accept Form",
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          comman_button(
                            ontap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                      "Reject Form",
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    content: Text(
                                      "Are you sure you want to Reject ${widget.fname} Student Form?",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text(
                                          "NO",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 20),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: Text(
                                          "Reject",
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 24),
                                        ),
                                        onPressed: () {
                                          FirebaseFirestore.instance
                                              .collection("admission_form")
                                              .doc(widget.user_id)
                                              .update({
                                            "conformation":
                                                "Your profile has been rejected",
                                            "Payment_status": "cancel",
                                          });
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            color: Colors.red,
                            text: "Reject Form",
                          ),
                        ],
                      ),
                    )),
                  )
                : widget.fees_status == "pending"
                    ? Container(
                        child: Center(
                        child: comman_button(
                          ontap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    "Mark As Payment",
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  content: Text(
                                    "Are you sure you want to Mark As Payment Done?",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text(
                                        "NO",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: Text(
                                        "YES",
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 24),
                                      ),
                                      onPressed: () {
                                        FirebaseFirestore.instance
                                            .collection("sspkmid")
                                            .doc("sspkmlastid")
                                            .get()
                                            .then((document) {
                                          int lastregId = document.exists
                                              ? document.data()!["lastid"]
                                              : 0;
                                          String newsspkmId =
                                              "SP2023/0${lastregId + 1}";
                                          FirebaseFirestore.instance
                                              .collection("admission_form")
                                              .doc(widget.user_id)
                                              .update({
                                                "Payment_status": "Done",
                                                "Id": newsspkmId
                                              })
                                              .then((value) =>
                                                  Fluttertoast.showToast(
                                                    msg:
                                                        "Fees Paid Successfully!!!",
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 3,
                                                    fontSize: 13.sp,
                                                  ))
                                              .then((value) => FirebaseFirestore
                                                      .instance
                                                      .collection("sspkmid")
                                                      .doc("sspkmlastid")
                                                      .update({
                                                    "lastid": lastregId + 1
                                                  }));
                                          Routingpage.pushreplase(
                                              context: context,
                                              navigateto: all_form());
                                        });
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          color: Colors.blue,
                          text: "Mark As Payment",
                        ),
                      ))
                    : SizedBox(),
            SizedBox(
              height: 20,
            ),
            widget.fees_status == "Done" || widget.fees_status == "pending"
                ? Center(
                    child: Container(
                        child: Padding(
                      padding: EdgeInsets.all(10),
                      child: comman_button(
                        ontap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  "Remove Admission",
                                  style: TextStyle(fontSize: 24),
                                ),
                                content: Text(
                                  "Are you sure you want to Remove ${widget.fname} Admission?",
                                  style: TextStyle(fontSize: 18),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text(
                                      "Cancle",
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 20),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: Text(
                                      "Remove",
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 24),
                                    ),
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection("admission_form")
                                          .doc(widget.user_id)
                                          .update({
                                        "conformation":
                                            "Your Admission has been Canceled",
                                        "Payment_status": "cancel",
                                      });
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        color: Colors.red,
                        text: "Cancel Admission",
                      ),
                    )),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
// Container(
// child:data["Student photo"]==""?
// Image.network("https://i.pinimg.com/736x/de/59/4e/de594ec09881da3fa66d98384a3c72ff.jpg",fit: BoxFit.cover,)
// :Image.network(data["Student photo"],fit: BoxFit.cover) ,
// height: 200,
// width: 200,
// // fit: BoxFit.cover,
// ))
