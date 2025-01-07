import 'dart:io';

import 'package:admin/common_widget/comman_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../common_widget/commen_textfiled.dart';
import '../rout/routing_page.dart';
import '../screen/home.dart';
import 'delete_news.dart';
class add_news_scrren extends StatefulWidget {


  const add_news_scrren(
      {Key? key,
       })
      : super(key: key);

  @override
  State<add_news_scrren> createState() => _add_news_scrrenState();
}

class _add_news_scrrenState extends State<add_news_scrren> {
  bool loading = false;
  String imageurl="";

  // TextEditingController cat_name = TextEditingController();
  TextEditingController news_image = TextEditingController();
  TextEditingController news_des = TextEditingController();
  TextEditingController news_title = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // ProductProvider productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text("Add Notice"),
          elevation: 0,
          actions: [
            IconButton(onPressed: (){
              setState(() {
                Routingpage.gotonext(context: context, navigateto: NewsScreen());
              });
            }, icon: Icon(Icons.delete,color: Colors.white,))
          ],
        ),
        body: Form(
          key: _formkey,
          child: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.01,

                right: 10,
                left: 10),
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text(
                        "Notice Data Form",
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 4,
                  ),
                  Center(
                      child: Text(
                        "Add Notice",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.all(10),child: MyListTile(
                          icon: Icon(
                            Icons.photo_library_sharp,
                            size: 30,
                            color: Colors.pink, // change the color to purple
                          ),
                          name: "Add Notice Photo",
                          onTap: () async {
                            ImagePicker picker = ImagePicker();
                            XFile? file = await picker.pickImage(
                                source: ImageSource.gallery);
                            if (file == null) return;
                            String uniqueFilename =DateTime.now().millisecondsSinceEpoch.toString();
                            Reference reference =
                            FirebaseStorage.instance.ref();
                            Reference refImg = reference.child("News${DateTime.now().year}");
                            Reference refUploadImage =
                            refImg.child(uniqueFilename);

                            try {
                              await refUploadImage.putFile(File(file.path));
                              imageurl =
                              await refUploadImage.getDownloadURL();
                              print('Image URL: $imageurl');
                            } catch (e) {
                              print('Error updating user data: $e');
                            }
                          },
                        ),)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Commen_Textfiled(
                    maxlen: 1,
                    hinttext: "Enter Notice Title",
                    labeltext: "Notice Title",
                    controller: news_title,
                    validator: (v) {
                      if (v.toString().isEmpty) {
                        return "Please Enter Notice Title";
                      }
                    },
                    preficicon: Icon(Icons.title,color: Colors.black54),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Commen_Textfiled(
                    hinttext: "Enter Notice Description",
                    labeltext: "Notice Description",
                    maxlen: 3,
                    controller: news_des,
                    validator: (v) {
                      if (v.toString().isEmpty) {
                        return "Please Enter Notice Description";
                      }
                    },
                    preficicon: Icon(Icons.note_alt_sharp,color: Colors.black54),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.blue,
                      height: 50,
                      width: double.infinity,
                      child: loading == false
                          ? comman_button(
                        text: "Publice",
                        ontap:  () {
                          if (imageurl.isEmpty) {
                            setState(() {
                              Fluttertoast.showToast(
                                msg: "Please Upload Notice/News Photo!!!",
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 3,
                                fontSize: 13,
                              );
                            });
                          } else{
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                            });
                            FirebaseFirestore.instance
                                .collection("News_${DateTime.now().year}")
                                .doc(news_title.text)
                                .set({
                              "News_image":imageurl ,
                              "News_title": news_title.text,
                              "News_description": news_des.text,
                              "News_date": '${DateFormat.yMMMEd().format(DateTime.now())} ${DateFormat.jm().format(DateTime.now())}',
                              "utc_time": DateTime.now(),
                            }).then((value) => setState(() {
                              loading = false;
                              Navigator.pop(context);
                              Fluttertoast.showToast(
                                  msg: "Notice Successfully Added!");
                            }));
                          }
                          else{
                            Navigator.pop(context);
                            Fluttertoast.showToast(
                                msg: "Notice Not Added!");
                          }
                        }},
                      )
                          : Center(
                        child: CircularProgressIndicator(),
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}


