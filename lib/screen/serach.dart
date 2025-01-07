
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../all_form_details/form_details.dart';
import '../rout/routing_page.dart';

class searchpage extends StatefulWidget {
  const searchpage({Key? key}) : super(key: key);

  @override
  State<searchpage> createState() => _searchpageState();
}

class _searchpageState extends State<searchpage> {
  String query = "";

  var result;

  searchFunction(query, searchList) {
    result = searchList.where((element) {
      return element["Id"].toLowerCase().contains(query) ||
          element["Id"].toUpperCase().contains(query) ||
          element["Id"].contains(query) ||
          element["Id"].toLowerCase().contains(query) &&
              element["Id"].contains(query) &&
              element["Id"].toUpperCase().contains(query);
    }).toList();
    return result;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Builder(builder: (context) {
          return InkWell(
            child: Image.asset("assets/images/logo.png"),
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        title: Text(
          "SSPKM",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        centerTitle: true,

      ),
      body:  Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              TextFormField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(11),
                ],
                onChanged: (value) {
                  setState(() {
                    query = value;

                  });
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  fillColor: Colors.grey,
                  hintText: "Search Student By Registration Id",
                  filled: false,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),


              query == ""
                  ? Center(
                child: Text(
                  '',
                  style: TextStyle(
                    fontSize: 5,
                  ),
                ),
              )
                  : SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("admission_form")
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> streamsnapshort) {
                      if (!streamsnapshort.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      var varData = searchFunction(query, streamsnapshort.data!.docs);
                      return varData.isEmpty
                          ? Center(
                        child: Text(
                          "No Student Found!",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                          : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount:varData.length,
                          itemBuilder: (context, index) {
                            var data = varData[index];
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
                                            idproof: data["Id proof"],
                                            resultphoto: data["Result photo"],
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
                                        child: Image.network(
                                          data["Student photo"],
                                          height: 140,
                                        ),
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
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//query_cat == ""
//           ? Center(
//         child: Text(
//           '',
//           style: TextStyle(
//             fontSize: Dimensions.h5,
//           ),
//         ),
//       )
//           : SizedBox(
//         height: Dimensions.h100,
//         child: StreamBuilder(
//           stream: FirebaseFirestore.instance.collection("Category").snapshots(),
//           builder: (context, AsyncSnapshot<QuerySnapshot> streamsnapshort) {
//             if (!streamsnapshort.hasData) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//              searchList = streamsnapshort.data!,
//             List<Map<String, dynamic>> cat_result = searchCategoryFunction(query_cat, searchList) as List<Map<String, dynamic>>;
//
//             return cat_result.isEmpty
//                 ? Center(
//               child: Text(
//                 "$query_cat is not in categories",
//                 style: TextStyle(
//                   fontSize: Dimensions.h18,
//                 ),
//               ),
//             )
//                 : ListView.builder(
//               shrinkWrap: true,
//               scrollDirection: Axis.horizontal,
//               physics: const BouncingScrollPhysics(),
//               itemCount: cat_result.length,
//               itemBuilder: (context, index) {
//                 String catName = cat_result[index]["cat_name"].toString();
//                 String id = cat_result[index]["id"].toString();
//
//                 return Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => Listviewwidget(
//                                 subcollection: catName,
//                                 collection: "Category",
//                                 id: id,
//                               ),
//                             ),
//                           );
//                         });
//                       },
//                       child: Container(
//                         padding: EdgeInsets.all(Dimensions.h10),
//                         height: Dimensions.h40,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(Dimensions.h15),
//                           color: Colors.grey[900],
//                         ),
//                         child: Text(
//                           catName,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: Dimensions.w15),
//                   ],
//                 );
//               },
//             );
//           },
//         ),
//       ),