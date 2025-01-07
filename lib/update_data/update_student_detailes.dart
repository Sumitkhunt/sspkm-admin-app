import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../screen/home.dart';

class update_std_detailes extends StatefulWidget {
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
  final String stdphoto;
  final String resultphoto;
  final String idproof;
  final String date_time;
  final String fees_status;
  final String id;
  final String user_id;
  final String conformation;

  update_std_detailes({
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
    required this.stdphoto,
    required this.date_time,
    required this.fees_status,
    required this.id,
    required this.user_id,
    required this.conformation,
    required this.resultphoto,
    required this.idproof,
  }) : super(key: key);

  @override
  State<update_std_detailes> createState() => _update_std_detailesState();
}

class _update_std_detailesState extends State<update_std_detailes> {
  bool loading = false;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController _date = TextEditingController();
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
  TextEditingController add_controler = TextEditingController();
  TextEditingController edu_cat_controler = TextEditingController();
  TextEditingController edu_sub_cat_controler = TextEditingController();
  TextEditingController year_controler = TextEditingController();
  TextEditingController board_controler = TextEditingController();
  TextEditingController result_controler = TextEditingController();
  TextEditingController college_controler = TextEditingController();
  TextEditingController course_controler = TextEditingController();
  TextEditingController sem_controler = TextEditingController();

  void _AlertMessage({
    required controller,
    required text,
    Keyboardtype,
    required Function()? onpressed,
    required maxLines,
  }) {
    var _alert = AlertDialog(
      content: Form(
        key: _formkey,
        child: TextFormField(
          maxLines: maxLines,
          controller: controller,
          decoration: InputDecoration(
            hintText: text,
          ),
          keyboardType: Keyboardtype,
          validator: (v) {
            if (v!.isEmpty) {
              return "Please Enter Value";
            }
          },
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Cancel',
            style: TextStyle(color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: onpressed,
          child: Text('Update', style: TextStyle(color: Colors.black)),
        ),
      ],
    );
    showDialog(context: context, builder: (_) => _alert);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(
          widget.id,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20, right: 10, left: 10),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Text(
                "Select Which Data ",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
              SizedBox(
                height: 0,
              ),
              Center(
                  child: Text(
                "You Want To Be Update",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
              SizedBox(
                height: 20,
              ),
              MyListTile(
                icon: Icon(Icons.image, color: Colors.black),
                name: 'Change Student Photo',
                onTap: () async {
                  ImagePicker picker = ImagePicker();
                  XFile? file =
                      await picker.pickImage(source: ImageSource.gallery);
                  if (file == null) return;

                  String uniqueFilename = widget.user_id;
                  Reference reference = FirebaseStorage.instance.ref();
                  Reference refImg = reference.child("images");
                  Reference refUploadImage = refImg.child(uniqueFilename);

                  try {
                    await refUploadImage.putFile(File(file.path));
                    String imageUrl = await refUploadImage.getDownloadURL();
                    print('Image URL: $imageUrl');

                    loading = true;
                    FirebaseFirestore.instance
                        .collection("admission_form")
                        .doc(widget.user_id)
                        .update({
                      "Student photo": imageUrl,
                    }).then((value) => setState(() {
                              loading = false;
                              // Navigator.pop(context);
                              Fluttertoast.showToast(
                                  msg: "Student Photo Updated!");
                            }));
                  } catch (e) {
                    print('Error updating Student photo: $e');
                  }
                  loading == true
                      ? setState(() {
                          Center(
                            child: CircularProgressIndicator(),
                          );
                        })
                      : Text("");
                },
              ),
              SizedBox(
                height: 10,
              ),
              MyListTile(
                icon: Icon(Icons.image, color: Colors.black),
                name: 'Change Result Photo',
                onTap: () async {
                  ImagePicker picker = ImagePicker();
                  XFile? file =
                      await picker.pickImage(source: ImageSource.gallery);
                  if (file == null) return;

                  String uniqueFilename = widget.user_id;
                  Reference reference = FirebaseStorage.instance.ref();
                  Reference refImg = reference.child("results");
                  Reference refUploadImage = refImg.child(uniqueFilename);

                  try {
                    await refUploadImage.putFile(File(file.path));
                    String resulturl = await refUploadImage.getDownloadURL();
                    print('Image URL: $resulturl');

                    loading = true;
                    FirebaseFirestore.instance
                        .collection("admission_form")
                        .doc(widget.user_id)
                        .update({
                      "Result photo": resulturl,
                    }).then((value) => setState(() {
                              loading = false;
                              // Navigator.pop(context);
                              Fluttertoast.showToast(
                                  msg: "Result Photo Updated!");
                            }));
                  } catch (e) {
                    print('Error updating Student photo: $e');
                  }
                  loading == true
                      ? setState(() {
                          Center(
                            child: CircularProgressIndicator(),
                          );
                        })
                      : Text("");
                },
              ),
              SizedBox(
                height: 10,
              ),
              MyListTile(
                icon: Icon(Icons.image, color: Colors.black),
                name: 'Change Id-Proof',
                onTap: () async {
                  ImagePicker picker = ImagePicker();
                  XFile? file =
                      await picker.pickImage(source: ImageSource.gallery);
                  if (file == null) return;

                  String uniqueFilename = widget.user_id;
                  Reference reference = FirebaseStorage.instance.ref();
                  Reference refImg = reference.child("idproof");
                  Reference refUploadImage = refImg.child(uniqueFilename);

                  try {
                    await refUploadImage.putFile(File(file.path));
                    String idproof = await refUploadImage.getDownloadURL();
                    print('Image URL: $idproof');

                    loading = true;
                    FirebaseFirestore.instance
                        .collection("admission_form")
                        .doc(widget.user_id)
                        .update({
                      "Id proof": idproof,
                    }).then((value) => setState(() {
                              loading = false;
                              // Navigator.pop(context);
                              Fluttertoast.showToast(msg: "Id Proof Updated!");
                            }));
                  } catch (e) {
                    print('Error updating Id Proof photo: $e');
                  }
                  loading == true
                      ? setState(() {
                          Center(
                            child: CircularProgressIndicator(),
                          );
                        })
                      : Text("");
                },
              ),
              SizedBox(
                height: 10,
              ),
              MyListTile(
                icon: Icon(Icons.drive_file_rename_outline_rounded,
                    color: Colors.black),
                name: 'First Name',
                onTap: () {
                  _AlertMessage(
                      controller: fName_controler,
                      text: widget.fname,
                      maxLines: 1,
                      onpressed: () {
                        setState(() {
                          if (_formkey.currentState!.validate()) {
                            loading = true;
                            FirebaseFirestore.instance
                                .collection("admission_form")
                                .doc(widget.user_id)
                                .update({
                              "first name": fName_controler.text,
                            }).then((value) => setState(() {
                                      loading = false;
                                      Navigator.pop(context);
                                      Fluttertoast.showToast(
                                          msg: "Student Data Updated!");
                                    }));
                          } else {
                            Text("Invalid Value!");
                          }
                        });
                      });
                },
              ),
              SizedBox(
                height: 10,
              ),
              MyListTile(
                icon: Icon(Icons.drive_file_rename_outline_rounded,
                    color: Colors.black),
                name: 'Middle Name',
                onTap: () {
                  _AlertMessage(
                    controller: mName_controler,
                    text: widget.mname,
                    maxLines: 1,
                    onpressed: () {
                      setState(() {
                        if (_formkey.currentState!.validate()) {
                          loading = true;
                          FirebaseFirestore.instance
                              .collection("admission_form")
                              .doc(widget.user_id)
                              .update({
                            "middle name": mName_controler.text,
                          }).then((value) => setState(() {
                                    loading = false;
                                    Navigator.pop(context);
                                    Fluttertoast.showToast(
                                        msg: "Student Data Updated!");
                                  }));
                        } else {
                          Text("Invalid Value!");
                        }
                      });
                    },
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
              MyListTile(
                icon: Icon(Icons.drive_file_rename_outline_rounded,
                    color: Colors.black),
                name: 'Last Name',
                onTap: () {
                  _AlertMessage(
                      controller: lName_controler,
                      text: widget.lname,
                      maxLines: 1,
                      onpressed: () {
                        setState(() {
                          if (_formkey.currentState!.validate()) {
                            loading = true;
                            FirebaseFirestore.instance
                                .collection("admission_form")
                                .doc(widget.user_id)
                                .update({
                              "last name": lName_controler.text,
                            }).then((value) => setState(() {
                                      loading = false;
                                      Navigator.pop(context);
                                      Fluttertoast.showToast(
                                          msg: "Student Data Updated!");
                                    }));
                          } else {
                            Text("Invalid Value!");
                          }
                        });
                      });
                },
              ),
              SizedBox(
                height: 10,
              ),
              MyListTile(
                icon: Icon(Icons.drive_file_rename_outline_rounded,
                    color: Colors.black),
                name: 'Date Of Birth',
                onTap: () {
                  _AlertMessage(
                      controller: _date,
                      text: widget.dob,
                      maxLines: 1,
                      onpressed: () {
                        setState(() {
                          if (_formkey.currentState!.validate()) {
                            loading = true;
                            FirebaseFirestore.instance
                                .collection("admission_form")
                                .doc(widget.user_id)
                                .update({
                              "DOB": _date.text,
                            }).then((value) => setState(() {
                                      loading = false;
                                      Navigator.pop(context);
                                      Fluttertoast.showToast(
                                          msg: "Student Data Updated!");
                                    }));
                          } else {
                            Text("Invalid Value!");
                          }
                        });
                      });
                },
              ),
              SizedBox(
                height: 10,
              ),
              MyListTile(
                icon: Icon(Icons.drive_file_rename_outline_rounded,
                    color: Colors.black),
                name: 'Email Id',
                onTap: () {
                  _AlertMessage(
                      controller: Email_controler,
                      text: widget.email,
                      maxLines: 1,
                      onpressed: () {
                        setState(() {
                          if (_formkey.currentState!.validate()) {
                            loading = true;
                            FirebaseFirestore.instance
                                .collection("admission_form")
                                .doc(widget.user_id)
                                .update({
                              "email": Email_controler.text,
                            }).then((value) => setState(() {
                                      loading = false;
                                      Navigator.pop(context);
                                      Fluttertoast.showToast(
                                          msg: "Student Data Updated!");
                                    }));
                          } else {
                            Text("Invalid Value!");
                          }
                        });
                      });
                },
              ),
              SizedBox(
                height: 10,
              ),
              MyListTile(
                icon: Icon(Icons.drive_file_rename_outline_rounded,
                    color: Colors.black),
                name: 'Contact no',
                onTap: () {
                  _AlertMessage(
                      controller: phone_controler,
                      text: widget.contact,
                      maxLines: 1,
                      onpressed: () {
                        setState(() {
                          if (_formkey.currentState!.validate()) {
                            loading = true;
                            FirebaseFirestore.instance
                                .collection("admission_form")
                                .doc(widget.user_id)
                                .update({
                              "contact no": phone_controler.text,
                            }).then((value) => setState(() {
                                      loading = false;
                                      Navigator.pop(context);
                                      Fluttertoast.showToast(
                                          msg: "Student Data Updated!");
                                    }));
                          } else {
                            Text("Invalid Value!");
                          }
                        });
                      });
                },
              ),
              SizedBox(
                height: 10,
              ),
              MyListTile(
                icon: Icon(Icons.drive_file_rename_outline_rounded,
                    color: Colors.black),
                name: 'Aadhar',
                onTap: () {
                  _AlertMessage(
                      controller: adhar_controler,
                      text: widget.adharno,
                      maxLines: 1,
                      onpressed: () {
                        setState(() {
                          if (_formkey.currentState!.validate()) {
                            loading = true;
                            FirebaseFirestore.instance
                                .collection("admission_form")
                                .doc(widget.user_id)
                                .update({
                              "aadhar no": adhar_controler.text,
                            }).then((value) => setState(() {
                                      loading = false;
                                      Navigator.pop(context);
                                      Fluttertoast.showToast(
                                          msg: "Student Data Updated!");
                                    }));
                          } else {
                            Text("Invalid Value!");
                          }
                        });
                      });
                },
              ),
              SizedBox(
                height: 10,
              ),
              MyListTile(
                icon: Icon(Icons.drive_file_rename_outline_rounded,
                    color: Colors.black),
                name: 'Change Address',
                onTap: () {
                  _AlertMessage(
                      controller: add_controler,
                      text: widget.address,
                      maxLines: 1,
                      onpressed: () {
                        setState(() {
                          if (_formkey.currentState!.validate()) {
                            loading = true;
                            FirebaseFirestore.instance
                                .collection("admission_form")
                                .doc(widget.user_id)
                                .update({
                              "address no": add_controler.text,
                            }).then((value) => setState(() {
                                      loading = false;
                                      Navigator.pop(context);
                                      Fluttertoast.showToast(
                                          msg: "Student Data Updated!");
                                    }));
                          } else {
                            Text("Invalid Value!");
                          }
                        });
                      });
                },
              ),
              SizedBox(
                height: 10,
              ),
              MyListTile(
                icon: Icon(Icons.drive_file_rename_outline_rounded,
                    color: Colors.black),
                name: 'Pincode',
                onTap: () {
                  _AlertMessage(
                      controller: pincode_controler,
                      text: widget.pincode,
                      maxLines: 1,
                      onpressed: () {
                        setState(() {
                          if (_formkey.currentState!.validate()) {
                            loading = true;
                            FirebaseFirestore.instance
                                .collection("admission_form")
                                .doc(widget.user_id)
                                .update({
                              "pincode no": pincode_controler.text,
                            }).then((value) => setState(() {
                                      loading = false;
                                      Navigator.pop(context);
                                      Fluttertoast.showToast(
                                          msg: "Student Data Updated!");
                                    }));
                          } else {
                            Text("Invalid Value!");
                          }
                        });
                      });
                },
              ),
              SizedBox(
                height: 10,
              ),
              MyListTile(
                icon: Icon(Icons.drive_file_rename_outline_rounded,
                    color: Colors.black),
                name: 'City',
                onTap: () {
                  _AlertMessage(
                      controller: city_controler,
                      text: widget.city,
                      maxLines: 1,
                      onpressed: () {
                        setState(() {
                          if (_formkey.currentState!.validate()) {
                            loading = true;
                            FirebaseFirestore.instance
                                .collection("admission_form")
                                .doc(widget.user_id)
                                .update({
                              "city": city_controler.text,
                            }).then((value) => setState(() {
                                      loading = false;
                                      Navigator.pop(context);
                                      Fluttertoast.showToast(
                                          msg: "Student Data Updated!");
                                    }));
                          } else {
                            Text("Invalid Value!");
                          }
                        });
                      });
                },
              ),
              SizedBox(
                height: 10,
              ),
              MyListTile(
                icon: Icon(Icons.drive_file_rename_outline_rounded,
                    color: Colors.black),
                name: 'Taluka',
                onTap: () {
                  _AlertMessage(
                      controller: taluka_controler,
                      text: widget.taluka,
                      maxLines: 1,
                      onpressed: () {
                        setState(() {
                          if (_formkey.currentState!.validate()) {
                            loading = true;
                            FirebaseFirestore.instance
                                .collection("admission_form")
                                .doc(widget.user_id)
                                .update({
                              "taluka": taluka_controler.text,
                            }).then((value) => setState(() {
                                      loading = false;
                                      Navigator.pop(context);
                                      Fluttertoast.showToast(
                                          msg: "Student Data Updated!");
                                    }));
                          } else {
                            Text("Invalid Value!");
                          }
                        });
                      });
                },
              ),
              SizedBox(
                height: 10,
              ),
              MyListTile(
                icon: Icon(Icons.drive_file_rename_outline_rounded,
                    color: Colors.black),
                name: 'District',
                onTap: () {
                  _AlertMessage(
                      controller: district_controler,
                      text: widget.district,
                      maxLines: 1,
                      onpressed: () {
                        setState(() {
                          if (_formkey.currentState!.validate()) {
                            loading = true;
                            FirebaseFirestore.instance
                                .collection("admission_form")
                                .doc(widget.user_id)
                                .update({
                              "district": district_controler.text,
                            }).then((value) => setState(() {
                                      loading = false;
                                      Navigator.pop(context);
                                      Fluttertoast.showToast(
                                          msg: "Student Data Updated!");
                                    }));
                          } else {
                            Text("Invalid Value!");
                          }
                        });
                      });
                },
              ),
              SizedBox(
                height: 10,
              ),
              MyListTile(
                icon: Icon(Icons.drive_file_rename_outline_rounded,
                    color: Colors.black),
                name: 'Change Father First Name',
                onTap: () {
                  _AlertMessage(
                      controller: ffname_controler,
                      text: widget.ffname,
                      maxLines: 1,
                      onpressed: () {
                        setState(() {
                          if (_formkey.currentState!.validate()) {
                            loading = true;
                            FirebaseFirestore.instance
                                .collection("admission_form")
                                .doc(widget.user_id)
                                .update({
                              "father first name": ffname_controler.text,
                            }).then((value) => setState(() {
                                      loading = false;
                                      Navigator.pop(context);
                                      Fluttertoast.showToast(
                                          msg: "Student Data Updated!");
                                    }));
                          } else {
                            Text("Invalid Value!");
                          }
                        });
                      });
                },
              ),
              SizedBox(
                height: 10,
              ),
              MyListTile(
                icon: Icon(Icons.drive_file_rename_outline_rounded,
                    color: Colors.black),
                name: 'Change Father Middle Name',
                onTap: () {
                  _AlertMessage(
                      controller: fmname_controler,
                      text: widget.fmname,
                      maxLines: 1,
                      onpressed: () {
                        setState(() {
                          if (_formkey.currentState!.validate()) {
                            loading = true;
                            FirebaseFirestore.instance
                                .collection("admission_form")
                                .doc(widget.user_id)
                                .update({
                              "father middle name": fmname_controler.text,
                            }).then((value) => setState(() {
                                      loading = false;
                                      Navigator.pop(context);
                                      Fluttertoast.showToast(
                                          msg: "Student Data Updated!");
                                    }));
                          } else {
                            Text("Invalid Value!");
                          }
                        });
                      });
                },
              ),
              SizedBox(
                height: 10,
              ),
              MyListTile(
                icon: Icon(Icons.drive_file_rename_outline_rounded,
                    color: Colors.black),
                name: 'Change Father Last Name',
                onTap: () {
                  _AlertMessage(
                      controller: flname_controler,
                      text: widget.flname,
                      maxLines: 1,
                      onpressed: () {
                        setState(() {
                          if (_formkey.currentState!.validate()) {
                            loading = true;
                            FirebaseFirestore.instance
                                .collection("admission_form")
                                .doc(widget.user_id)
                                .update({
                              "father last name": flname_controler.text,
                            }).then((value) => setState(() {
                                      loading = false;
                                      Navigator.pop(context);
                                      Fluttertoast.showToast(
                                          msg: "Student Data Updated!");
                                    }));
                          } else {
                            Text("Invalid Value!");
                          }
                        });
                      });
                },
              ),
              SizedBox(
                height: 10,
              ),
              MyListTile(
                icon: Icon(Icons.drive_file_rename_outline_rounded,
                    color: Colors.black),
                name: 'Change Father Contact',
                onTap: () {
                  _AlertMessage(
                      controller: fphone_controler,
                      text: widget.fphoneno,
                      maxLines: 1,
                      onpressed: () {
                        setState(() {
                          if (_formkey.currentState!.validate()) {
                            loading = true;
                            FirebaseFirestore.instance
                                .collection("admission_form")
                                .doc(widget.user_id)
                                .update({
                              "father contact no": fphone_controler.text,
                            }).then((value) => setState(() {
                                      loading = false;
                                      Navigator.pop(context);
                                      Fluttertoast.showToast(
                                          msg: "Student Data Updated!");
                                    }));
                          } else {
                            Text("Invalid Value!");
                          }
                        });
                      });
                },
              ),
              SizedBox(
                height: 10,
              ),
              MyListTile(
                icon: Icon(Icons.drive_file_rename_outline_rounded,
                    color: Colors.black),
                name: 'Change Father occupation',
                onTap: () {
                  _AlertMessage(
                      controller: occupation_controler,
                      text: widget.foccupation,
                      maxLines: 1,
                      onpressed: () {
                        setState(() {
                          if (_formkey.currentState!.validate()) {
                            loading = true;
                            FirebaseFirestore.instance
                                .collection("admission_form")
                                .doc(widget.user_id)
                                .update({
                              "father occupatioin": occupation_controler.text,
                            }).then((value) => setState(() {
                                      loading = false;
                                      Navigator.pop(context);
                                      Fluttertoast.showToast(
                                          msg: "Student Data Updated!");
                                    }));
                          } else {
                            Text("Invalid Value!");
                          }
                        });
                      });
                },
              ),
              SizedBox(
                height: 10,
              ),
              MyListTile(
                icon: Icon(Icons.drive_file_rename_outline_rounded,
                    color: Colors.black),
                name: 'Change Father Income',
                onTap: () {
                  _AlertMessage(
                      controller: income_controler,
                      text: widget.fincome,
                      maxLines: 1,
                      onpressed: () {
                        setState(() {
                          if (_formkey.currentState!.validate()) {
                            loading = true;
                            FirebaseFirestore.instance
                                .collection("admission_form")
                                .doc(widget.user_id)
                                .update({
                              "father income": income_controler.text,
                            }).then((value) => setState(() {
                                      loading = false;
                                      Navigator.pop(context);
                                      Fluttertoast.showToast(
                                          msg: "Student Data Updated!");
                                    }));
                          } else {
                            Text("Invalid Value!");
                          }
                        });
                      });
                },
              ),
              SizedBox(
                height: 10,
              ),
              MyListTile(
                icon: Icon(Icons.drive_file_rename_outline_rounded,
                    color: Colors.black),
                name: 'Change Education Category',
                onTap: () {
                  _AlertMessage(
                      controller: edu_cat_controler,
                      text: widget.educat,
                      maxLines: 1,
                      onpressed: () {
                        setState(() {
                          if (_formkey.currentState!.validate()) {
                            loading = true;
                            FirebaseFirestore.instance
                                .collection("admission_form")
                                .doc(widget.user_id)
                                .update({
                              "education category": edu_cat_controler.text,
                            }).then((value) => setState(() {
                                      loading = false;
                                      Navigator.pop(context);
                                      Fluttertoast.showToast(
                                          msg: "Student Data Updated!");
                                    }));
                          } else {
                            Text("Invalid Value!");
                          }
                        });
                      });
                },
              ),
              SizedBox(
                height: 10,
              ),
              MyListTile(
                icon: Icon(Icons.drive_file_rename_outline_rounded,
                    color: Colors.black),
                name: 'Change Education Sub Category',
                onTap: () {
                  _AlertMessage(
                      controller: edu_sub_cat_controler,
                      text: widget.edusubcat,
                      maxLines: 1,
                      onpressed: () {
                        setState(() {
                          if (_formkey.currentState!.validate()) {
                            loading = true;
                            FirebaseFirestore.instance
                                .collection("admission_form")
                                .doc(widget.user_id)
                                .update({
                              "education sub category":
                                  edu_sub_cat_controler.text,
                            }).then((value) => setState(() {
                                      loading = false;
                                      Navigator.pop(context);
                                      Fluttertoast.showToast(
                                          msg: "Student Data Updated!");
                                    }));
                          } else {
                            Text("Invalid Value!");
                          }
                        });
                      });
                },
              ),
              SizedBox(
                height: 10,
              ),
              MyListTile(
                icon: Icon(Icons.drive_file_rename_outline_rounded,
                    color: Colors.black),
                name: 'Change Passing Year',
                onTap: () {
                  _AlertMessage(
                      controller: year_controler,
                      text: widget.year,
                      maxLines: 1,
                      onpressed: () {
                        setState(() {
                          if (_formkey.currentState!.validate()) {
                            loading = true;
                            FirebaseFirestore.instance
                                .collection("admission_form")
                                .doc(widget.user_id)
                                .update({
                              "passing year": year_controler.text,
                            }).then((value) => setState(() {
                                      loading = false;
                                      Navigator.pop(context);
                                      Fluttertoast.showToast(
                                          msg: "Student Data Updated!");
                                    }));
                          } else {
                            Text("Invalid Value!");
                          }
                        });
                      });
                },
              ),
              SizedBox(
                height: 10,
              ),
              MyListTile(
                icon: Icon(Icons.drive_file_rename_outline_rounded,
                    color: Colors.black),
                name: 'Change Borad',
                onTap: () {
                  _AlertMessage(
                      controller: board_controler,
                      text: widget.board,
                      maxLines: 1,
                      onpressed: () {
                        setState(() {
                          if (_formkey.currentState!.validate()) {
                            loading = true;
                            FirebaseFirestore.instance
                                .collection("admission_form")
                                .doc(widget.user_id)
                                .update({
                              "board": board_controler.text,
                            }).then((value) => setState(() {
                                      loading = false;
                                      Navigator.pop(context);
                                      Fluttertoast.showToast(
                                          msg: "Student Data Updated!");
                                    }));
                          } else {
                            Text("Invalid Value!");
                          }
                        });
                      });
                },
              ),
              SizedBox(
                height: 10,
              ),
              MyListTile(
                icon: Icon(Icons.drive_file_rename_outline_rounded,
                    color: Colors.black),
                name: 'Change result',
                onTap: () {
                  _AlertMessage(
                      controller: result_controler,
                      text: widget.result,
                      maxLines: 1,
                      onpressed: () {
                        setState(() {
                          if (_formkey.currentState!.validate()) {
                            loading = true;
                            FirebaseFirestore.instance
                                .collection("admission_form")
                                .doc(widget.user_id)
                                .update({
                              "result": result_controler.text,
                            }).then((value) => setState(() {
                                      loading = false;
                                      Navigator.pop(context);
                                      Fluttertoast.showToast(
                                          msg: "Student Data Updated!");
                                    }));
                          } else {
                            Text("Invalid Value!");
                          }
                        });
                      });
                },
              ),
              SizedBox(
                height: 10,
              ),
              MyListTile(
                icon: Icon(Icons.drive_file_rename_outline_rounded,
                    color: Colors.black),
                name: 'Change College/School Name',
                onTap: () {
                  _AlertMessage(
                      controller: college_controler,
                      text: widget.cname,
                      maxLines: 1,
                      onpressed: () {
                        setState(() {
                          if (_formkey.currentState!.validate()) {
                            loading = true;
                            FirebaseFirestore.instance
                                .collection("admission_form")
                                .doc(widget.user_id)
                                .update({
                              "college school name": college_controler.text,
                            }).then((value) => setState(() {
                                      loading = false;
                                      Navigator.pop(context);
                                      Fluttertoast.showToast(
                                          msg: "Student Data Updated!");
                                    }));
                          } else {
                            Text("Invalid Value!");
                          }
                        });
                      });
                },
              ),
              SizedBox(
                height: 10,
              ),
              MyListTile(
                icon: Icon(Icons.drive_file_rename_outline_rounded,
                    color: Colors.black),
                name: 'Change Course Name',
                onTap: () {
                  _AlertMessage(
                      controller: course_controler,
                      text: widget.coursename,
                      maxLines: 1,
                      onpressed: () {
                        setState(() {
                          if (_formkey.currentState!.validate()) {
                            loading = true;
                            FirebaseFirestore.instance
                                .collection("admission_form")
                                .doc(widget.user_id)
                                .update({
                              "course name": course_controler.text,
                            }).then((value) => setState(() {
                                      loading = false;
                                      Navigator.pop(context);
                                      Fluttertoast.showToast(
                                          msg: "Student Data Updated!");
                                    }));
                          } else {
                            Text("Invalid Value!");
                          }
                        });
                      });
                },
              ),
              SizedBox(
                height: 10,
              ),
              MyListTile(
                icon: Icon(Icons.drive_file_rename_outline_rounded,
                    color: Colors.black),
                name: 'Change Semester/Standard',
                onTap: () {
                  _AlertMessage(
                      controller: sem_controler,
                      text: widget.semester,
                      maxLines: 1,
                      onpressed: () {
                        setState(() {
                          if (_formkey.currentState!.validate()) {
                            loading = true;
                            FirebaseFirestore.instance
                                .collection("admission_form")
                                .doc(widget.user_id)
                                .update({
                              "semester standard": sem_controler.text,
                            }).then((value) => setState(() {
                                      loading = false;
                                      Navigator.pop(context);
                                      Fluttertoast.showToast(
                                          msg: "Student Data Updated!");
                                    }));
                          } else {
                            Text("Invalid Value!");
                          }
                        });
                      });
                },
              ),
              SizedBox(
                height: 10,
              ),
              loading == true
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Text(""),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
