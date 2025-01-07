import 'package:admin/all_form_details/form_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../rout/routing_page.dart';
import '../screen/home.dart';

class yesterday_form extends StatefulWidget {
  const yesterday_form({Key? key}) : super(key: key);

  @override
  State<yesterday_form> createState() => _yesterday_formState();
}

class _yesterday_formState extends State<yesterday_form> {
  DateTime yesterday = DateTime.now().subtract(Duration(days: 1));


  @override
  Widget build(BuildContext context) {
    DateTime startOfDay = DateTime(yesterday.year, yesterday.month, yesterday.day, 0, 0, 0);
    DateTime endOfDay = DateTime(yesterday.year, yesterday.month, yesterday.day, 23, 59, 59);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Routingpage.pushreplase(
                    context: context, navigateto: admin_home());
              },
              icon: Icon(
                Icons.home,
                size: 29,
              )),
        ],
        title: Text("Yesterday's Forms"),
        elevation: 0,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("admission_form")
            .where("utc_time", isGreaterThanOrEqualTo: startOfDay)
            .where("utc_time", isLessThanOrEqualTo: endOfDay)
            .orderBy("utc_time", descending: true)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamsnapshort) {
          // print(FirebaseAuth.instance.currentUser!.uid);
          if (!streamsnapshort.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return streamsnapshort.data!.docs.isEmpty
              ? Center(
              child: Text(
                "No Student Form Found!",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ))
              : ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: streamsnapshort.data!.docs.length,
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                var data = streamsnapshort.data!.docs[index];
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => view_form(
                                educat: data["education category"],
                                edusubcat:
                                data["education sub category"],
                                year: data["passing year"],
                                board: data["board"],
                                result: data["result"],
                                cname: data["college school name"],
                                coursename: data["course name"],
                                semester: data["semester standard"],
                                fname: data["first name"],
                                mname: data["middle name"],
                                lname: data["last name"],
                                email: data["email"],
                                dob: data["DOB"],
                                contact: data["contact no"],
                                address: data["address no"],
                                adharno: data["aadhar no"],
                                pincode: data["pincode no"],
                                city: data["city"],
                                taluka: data["taluka"],
                                district: data["district"],
                                ffname: data["father first name"],
                                fmname: data["father middle name"],
                                flname: data["father last name"],
                                fphoneno: data["father contact no"],
                                foccupation: data["father occupatioin"],
                                fincome: data["father income"],
                                stdphoto: data["Student photo"],
                                resultphoto: data["Result photo"],
                                idproof: data["Id proof"],
                                date_time:
                                data["Form_Submit_date_time"],
                                fees_status: data["Payment_status"],
                                id: data["Id"],
                                user_id: data["user_id"],
                                conformation: data["conformation"],
                              )));
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(1),
                              blurRadius: 7,
                            )
                          ]),
                      // height: Dimensions.h150 ,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Center(
                              child: data["Student photo"] == null
                                  ? Image.network(
                                "https://i.pinimg.com/736x/de/59/4e/de594ec09881da3fa66d98384a3c72ff.jpg",
                                fit: BoxFit.cover,
                                height: 200,
                                width: 200,
                              )
                                  : Image.network(
                                data["Student photo"],
                                fit: BoxFit.cover,
                                height: 200,
                                width: 200,
                              )
                          ),
                          SizedBox(height: 5),
                          Center(
                            child: Text(
                              "  Registration Id :  " +
                                  data["Id"],
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "  Name :  " +
                                data["first name"] +
                                " " +
                                data["last name"],
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: 10),
                          data["Payment_status"]==""?
                          SizedBox():
                          Text(
                            "  Payment_status :  " +
                                data["Payment_status"] ,
                            style: TextStyle(fontSize: 20,
                                color: data["Payment_status"]=="Done"?
                                Colors.green
                                    :data["Payment_status"] == 'cancel'
                                    ? Colors.red[900]
                                    : Colors.orange
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ));
              });
        },
      ),
    );
  }
}
