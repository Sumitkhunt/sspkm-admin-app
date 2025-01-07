import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? educat;
  final String? edusubcat;
  final String? year;
  final String? board;
  final String? result;
  final String? cname;
  final String? coursename;
  final String? semester;
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
  final File? imageurl;
  UserModel({required this.educat, required this.edusubcat, required this.year, this.board, this.result, this.cname, this.coursename, this.semester, this.fname, this.mname, this.lname, this.dob, this.email, this.contact, this.adharno, this.address, this.pincode, this.city, this.taluka, this.district, this.ffname, this.fmname, this.flname, this.fphoneno, this.foccupation, this.fincome, this.imageurl,
  });
  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(educat: doc["education category"],
        edusubcat: doc["education sub category"], year: doc["passing year"],

    );
  }
}