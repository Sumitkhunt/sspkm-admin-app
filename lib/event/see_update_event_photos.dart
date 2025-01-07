import 'dart:io';

import 'package:admin/event/add_photo.dart';
import 'package:admin/rout/routing_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class event_function extends StatefulWidget {
  const event_function({Key? key}) : super(key: key);

  @override
  _CustomTabBarsPageState createState() => _CustomTabBarsPageState();
}

class _CustomTabBarsPageState extends State<event_function> {
  Widget buildevent24_function(
      {required Stream<QuerySnapshot<Map<String, dynamic>>>? stream}) {
    return StreamBuilder(
      stream: stream,
      builder: (context, AsyncSnapshot<QuerySnapshot> streamsnapshort) {
        if (!streamsnapshort.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return streamsnapshort.data!.docs.isEmpty
            ? Center(
                child: Text("Not Image Found !!",style: TextStyle(fontSize: 25)),
              )
            : Padding(
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: streamsnapshort.data!.docs.length,
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      var data = streamsnapshort.data!.docs[index];

                      return Padding(
                          padding: EdgeInsets.only(bottom: 10.sp),
                          child: Stack(
                            children: [
                              Image.network(data["event_img"]),
                              Positioned(
                                  top: 1,
                                  right: 1,
                                  child: IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                "Delete Photo",
                                                style: TextStyle(fontSize: 24),
                                              ),
                                              content: Text(
                                                "Are you sure you want to Delete this Photo?",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: Text(
                                                    "CANCEL",
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
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
                                                      setState(() {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "event_2024")
                                                            .where("event_img",
                                                                isEqualTo: data[
                                                                    "event_img"])
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
                                                                            event_function()));
                                                          });
                                                        });
                                                      });
                                                    }),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                        size: 33,
                                      )))
                            ],
                          ));
                    }));
      },
    );
  }

  Widget buildevent23_function(
      {required Stream<QuerySnapshot<Map<String, dynamic>>>? stream}) {
    return StreamBuilder(
      stream: stream,
      builder: (context, AsyncSnapshot<QuerySnapshot> streamsnapshort) {
        if (!streamsnapshort.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return Padding(
            padding: EdgeInsets.all(10),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: streamsnapshort.data!.docs.length,
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  var data = streamsnapshort.data!.docs[index];
                  return Padding(
                      padding: EdgeInsets.only(bottom: 10.sp),
                      child: Padding(
                          padding: EdgeInsets.only(bottom: 10.sp),
                          child: Stack(
                            children: [
                              Image.network(data["event_img"]),
                              Positioned(
                                  top: 1,
                                  right: 1,
                                  child: IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                "Delete News",
                                                style: TextStyle(fontSize: 24),
                                              ),
                                              content: Text(
                                                "Are you sure you want to Delete this Photo?",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: Text(
                                                    "CANCEL",
                                                    style:
                                                    TextStyle(fontSize: 20),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
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
                                                      setState(() {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                            "event_2023")
                                                            .where("event_img",
                                                            isEqualTo: data[
                                                            "event_img"])
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
                                                                    event_function()));
                                                          });
                                                        });
                                                      });
                                                    }),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                        size: 33,
                                      )))
                            ],
                          )));
                }));
      },
    );
  }

  Widget buildevent22_function(
      {required Stream<QuerySnapshot<Map<String, dynamic>>>? stream}) {
    return StreamBuilder(
      stream: stream,
      builder: (context, AsyncSnapshot<QuerySnapshot> streamsnapshort) {
        if (!streamsnapshort.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return Padding(
            padding: EdgeInsets.all(10),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: streamsnapshort.data!.docs.length,
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  var data = streamsnapshort.data!.docs[index];
                  return Padding(
                      padding: EdgeInsets.only(bottom: 10.sp),
                      child: Padding(
                          padding: EdgeInsets.only(bottom: 10.sp),
                          child: Stack(
                            children: [
                              Image.network(data["event_img"]),
                              Positioned(
                                  top: 1,
                                  right: 1,
                                  child: IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                "Delete News",
                                                style: TextStyle(fontSize: 24),
                                              ),
                                              content: Text(
                                                "Are you sure you want to Delete this Photo?",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: Text(
                                                    "CANCEL",
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
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
                                                      setState(() {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "event_2022")
                                                            .where("event_img",
                                                                isEqualTo: data[
                                                                    "event_img"])
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
                                                                            event_function()));
                                                          });
                                                        });
                                                      });
                                                    }),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                        size: 33,
                                      )))
                            ],
                          )));
                }));
      },
    );
  }

  Widget buildevent21_function(
      {required Stream<QuerySnapshot<Map<String, dynamic>>>? stream}) {
    return StreamBuilder(
      stream: stream,
      builder: (context, AsyncSnapshot<QuerySnapshot> streamsnapshort) {
        if (!streamsnapshort.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return Padding(
            padding: EdgeInsets.all(10),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: streamsnapshort.data!.docs.length,
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  var data = streamsnapshort.data!.docs[index];
                  return Padding(
                      padding: EdgeInsets.only(bottom: 10.sp),
                      child: Padding(
                          padding: EdgeInsets.only(bottom: 10.sp),
                          child: Stack(
                            children: [
                              Image.network(data["event_img"]),
                              Positioned(
                                  top: 1,
                                  right: 1,
                                  child: IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                "Delete News",
                                                style: TextStyle(fontSize: 24),
                                              ),
                                              content: Text(
                                                "Are you sure you want to Delete this Photo?",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: Text(
                                                    "CANCEL",
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
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
                                                      setState(() {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "event_2021")
                                                            .where("event_img",
                                                                isEqualTo: data[
                                                                    "event_img"])
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
                                                                            event_function()));
                                                          });
                                                        });
                                                      });
                                                    }),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                        size: 33,
                                      )))
                            ],
                          )));
                }));
      },
    );
  }

  Widget buildevent20_function(
      {required Stream<QuerySnapshot<Map<String, dynamic>>>? stream}) {
    return StreamBuilder(
      stream: stream,
      builder: (context, AsyncSnapshot<QuerySnapshot> streamsnapshort) {
        if (!streamsnapshort.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return Padding(
            padding: EdgeInsets.all(10),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: streamsnapshort.data!.docs.length,
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  var data = streamsnapshort.data!.docs[index];
                  return Padding(
                      padding: EdgeInsets.only(bottom: 10.sp),
                      child: Padding(
                          padding: EdgeInsets.only(bottom: 10.sp),
                          child: Stack(
                            children: [
                              Image.network(data["event_img"]),
                              Positioned(
                                  top: 1,
                                  right: 1,
                                  child: IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                "Delete News",
                                                style: TextStyle(fontSize: 24),
                                              ),
                                              content: Text(
                                                "Are you sure you want to Delete this Photo?",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: Text(
                                                    "CANCEL",
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
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
                                                      setState(() {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "event_2020")
                                                            .where("event_img",
                                                                isEqualTo: data[
                                                                    "event_img"])
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
                                                                            event_function()));
                                                          });
                                                        });
                                                      });
                                                    }),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                        size: 33,
                                      )))
                            ],
                          )));
                }));
      },
    );
  }

  Widget buildevent19_function(
      {required Stream<QuerySnapshot<Map<String, dynamic>>>? stream}) {
    return StreamBuilder(
      stream: stream,
      builder: (context, AsyncSnapshot<QuerySnapshot> streamsnapshort) {
        if (!streamsnapshort.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return Padding(
            padding: EdgeInsets.all(10),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: streamsnapshort.data!.docs.length,
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  var data = streamsnapshort.data!.docs[index];
                  return Padding(
                      padding: EdgeInsets.only(bottom: 10.sp),
                      child: Padding(
                          padding: EdgeInsets.only(bottom: 10.sp),
                          child: Stack(
                            children: [
                              Image.network(data["event_img"]),
                              Positioned(
                                  top: 1,
                                  right: 1,
                                  child: IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                "Delete News",
                                                style: TextStyle(fontSize: 24),
                                              ),
                                              content: Text(
                                                "Are you sure you want to Delete this Photo?",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: Text(
                                                    "CANCEL",
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
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
                                                      setState(() {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "event_2019")
                                                            .where("event_img",
                                                                isEqualTo: data[
                                                                    "event_img"])
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
                                                                            event_function()));
                                                          });
                                                        });
                                                      });
                                                    }),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                        size: 33,
                                      )))
                            ],
                          )));
                }));
      },
    );
  }

  Widget buildevent18_function(
      {required Stream<QuerySnapshot<Map<String, dynamic>>>? stream}) {
    return StreamBuilder(
      stream: stream,
      builder: (context, AsyncSnapshot<QuerySnapshot> streamsnapshort) {
        if (!streamsnapshort.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return Padding(
            padding: EdgeInsets.all(10),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: streamsnapshort.data!.docs.length,
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  var data = streamsnapshort.data!.docs[index];
                  return Padding(
                      padding: EdgeInsets.only(bottom: 10.sp),
                      child: Padding(
                          padding: EdgeInsets.only(bottom: 10.sp),
                          child: Stack(
                            children: [
                              Image.network(data["event_img"]),
                              Positioned(
                                  top: 1,
                                  right: 1,
                                  child: IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                "Delete News",
                                                style: TextStyle(fontSize: 24),
                                              ),
                                              content: Text(
                                                "Are you sure you want to Delete this Photo?",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: Text(
                                                    "CANCEL",
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
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
                                                      setState(() {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "event_2018")
                                                            .where("event_img",
                                                                isEqualTo: data[
                                                                    "event_img"])
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
                                                                            event_function()));
                                                          });
                                                        });
                                                      });
                                                    }),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                        size: 33,
                                      )))
                            ],
                          )));
                }));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
              child:
                  Text("Events And Functions", style: TextStyle(fontSize: 25))),
          actions: [
            IconButton(
                onPressed: () async {
                  ImagePicker picker = ImagePicker();
                  XFile? file =
                      await picker.pickImage(source: ImageSource.gallery);
                  if (file == null) return;
                  String uniqueFilename =
                      DateTime.now().millisecondsSinceEpoch.toString();
                  Reference reference = FirebaseStorage.instance.ref();
                  Reference refImg =
                      reference.child("event${DateTime.now().year}");
                  Reference refUploadImage = refImg.child(uniqueFilename);

                  try {
                    await refUploadImage.putFile(File(file.path));
                    String imageUrl = await refUploadImage.getDownloadURL();
                    print('Image URL: $imageUrl');

                    await FirebaseFirestore.instance
                        .collection("event_${DateTime.now().year}")
                        .doc()
                        .set({
                      "event_img": imageUrl,
                    }).then((value) => Fluttertoast.showToast(
                              msg: "Photo Added!!!",
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 3,
                              fontSize: 13.sp,
                            ));
                    // Navigator.pop(context);
                  } catch (e) {
                    print('Error updating user data: $e');
                  }
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              margin: EdgeInsets.all(5),
              height: height * 0.89,
              width: width * 1,
              child: Column(children: [
                Container(
                  // color: Colors.blue,
                  child: Center(
                    child: TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      indicator: BoxDecoration(
                          color: Colors.blue[200],
                          borderRadius: BorderRadius.circular(5)),
                      tabs: [
                        Tab(
                          text: "2024",
                        ),
                        Tab(
                          text: "2023",
                        ),
                        Tab(
                          text: "2022",
                        ),
                        Tab(
                          text: "2021",
                        ),
                        Tab(
                          text: "2020",
                        ),
                        Tab(
                          text: "2019",
                        ),
                        Tab(
                          text: "2018",
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: TabBarView(
                  children: [
                    buildevent24_function(
                        stream: FirebaseFirestore.instance
                            .collection("event_2024")
                            .snapshots()),
                    buildevent23_function(
                        stream: FirebaseFirestore.instance
                            .collection("event_2023")
                            .snapshots()),
                    buildevent22_function(
                        stream: FirebaseFirestore.instance
                            .collection("event_2022")
                            .snapshots()),
                    buildevent21_function(
                        stream: FirebaseFirestore.instance
                            .collection("event_2021")
                            .snapshots()),
                    buildevent20_function(
                        stream: FirebaseFirestore.instance
                            .collection("event_2020")
                            .snapshots()),
                    buildevent19_function(
                        stream: FirebaseFirestore.instance
                            .collection("event_2019")
                            .snapshots()),
                    buildevent18_function(
                        stream: FirebaseFirestore.instance
                            .collection("event_2018")
                            .snapshots()),
                  ],
                ))
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}
