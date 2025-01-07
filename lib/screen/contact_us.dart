import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class contact_us extends StatefulWidget {
  const contact_us({Key? key}) : super(key: key);

  @override
  State<contact_us> createState() => _contact_usState();
}

class _contact_usState extends State<contact_us> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Messages"),
        elevation: 0,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Contact Page")
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamsnapshort) {
          if (!streamsnapshort.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return streamsnapshort.data!.docs.isEmpty
              ? Center(
              child: Text(
                "No Messages Found!",
                style: TextStyle(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ))
              : ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: streamsnapshort.data!.docs.length,
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                var data = streamsnapshort.data!.docs[index];
                return Container(
                  margin: EdgeInsets.all(10),

                  decoration:
                  BoxDecoration(color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
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
                      Text(
                        "   Email ID.  :  " + data["Email"],
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "   user Messages  :  " + data["message"],
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "   Date Time  :  " + data["date-time"],
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),

                );
              });
        },
      ),
    );
  }
}


