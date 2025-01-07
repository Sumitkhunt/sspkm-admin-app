import 'package:admin/news/news.dart';
import 'package:admin/rout/routing_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class NewsScreen extends StatelessWidget {
  // final List<News> newsList;

  NewsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latest Notice',style: TextStyle(fontSize: 20),),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("News_${DateTime.now().year}")
            .orderBy("utc_time")
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamsnapshort) {
          if (!streamsnapshort.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return streamsnapshort.data!.docs.isEmpty
              ? Center(
                  child: Text("No Notice Found !!",style: TextStyle(fontSize: 25)),
                )
              : Padding(
                  padding: EdgeInsets.all(10),
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: streamsnapshort.data!.docs.length,
                      shrinkWrap: true,
                      itemBuilder: (ctx, index) {
                        var data = streamsnapshort.data!.docs[index];
                        return Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Image.network(data["News_image"]),
                                  Positioned(
                                      top: 1,
                                      right: 1,
                                      child: IconButton(
                                          icon: Icon(
                                            Icons.delete,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text(
                                                    "Delete Notice",
                                                    style:
                                                        TextStyle(fontSize: 24),
                                                  ),
                                                  content: Text(
                                                    "Are you sure you want to Delete this Notice?",
                                                    style:
                                                        TextStyle(fontSize: 18),
                                                  ),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      child: Text(
                                                        "CANCEL",
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                    TextButton(
                                                      child: Text(
                                                        "Delete",
                                                        style: TextStyle(
                                                            color: Colors.red,
                                                            fontSize: 24),
                                                      ),
                                                      onPressed: () {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "News_${DateTime.now().year}")
                                                            .where("News_title",
                                                                isEqualTo: data[
                                                                    "News_title"])
                                                            .get()
                                                            .then((snapshot) {
                                                          snapshot.docs
                                                              .forEach((doc) {
                                                            doc.reference
                                                                .delete()
                                                                .then((value) =>
                                                                    Routingpage.pushreplase(
                                                                        context:
                                                                            context,
                                                                        navigateto:
                                                                            add_news_scrren()));
                                                          });
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }
                                          ))
                                ],
                              ),
                              SizedBox(height: 8),
                              Center(
                                child: Text(data["News_title"],
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(height: 8),
                              Text(data["News_description"]),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(Icons.calendar_today),
                                  SizedBox(width: 4),
                                  Text(data["News_date"]),
                                  SizedBox(height: 4),
                                ],
                              ),
                              SizedBox(height: 8),
                            ],
                          ),
                        );
                      }));
        },
      ),
    );
  }
}
