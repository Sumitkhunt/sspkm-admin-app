import 'package:admin/all_form_details/today_form.dart';
import 'package:admin/screen/serach.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../accept_reject/accept_reject_form.dart';
import '../admission_form/admission_form1.dart';
import '../all_form_details/all_form.dart';
import '../all_form_details/rejected_form.dart';
import '../all_form_details/yesterday_form.dart';
import '../event/add_photo.dart';
import '../event/see_update_event_photos.dart';
import '../fees/paid_fees.dart';
import '../fees/pending_fees.dart';
import '../rout/routing_page.dart';
import 'contact_us.dart';
import '../news/news.dart';

class admin_home extends StatefulWidget {
  admin_home({Key? key}) : super(key: key);

  @override
  State<admin_home> createState() => _admin_homeState();
}

class _admin_homeState extends State<admin_home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
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
        actions: [
          IconButton(
              onPressed: () {
                Routingpage.gotonext(
                    context: context, navigateto: searchpage());
              },
              icon: Icon(Icons.search))
        ],
      ),
      // drawer: drawer(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // MyListTile(
              //   icon: Icon(
              //     Icons.add_card,
              //     size: 30,
              //     color: Colors.blue, // change the color to blue
              //   ),
              //   name: "Add Student Form",
              //   onTap: () {
              //     Routingpage.gotonext(
              //         context: context, navigateto: admission_form());
              //   },
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              MyListTile(
                icon: Icon(
                  Icons.manage_accounts,
                  size: 30,
                  color: Colors.green, // change the color to green
                ),
                name: "Accept/Reject Admission Form",
                onTap: () {
                  Routingpage.gotonext(
                      context: context, navigateto: accept_reject_form());
                },
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ExpansionTile(
                  leading: Icon(
                    Icons.currency_rupee,
                    size: 30,
                    color: Colors.red, // change the color to red
                  ),
                  title: Text("Fees Details"),
                  children: [
                    listtileforex(
                      title: 'Paid Fees Student List',
                      onTap: () {
                        Routingpage.gotonext(
                            context: context, navigateto: paid_fees());
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    listtileforex(
                      title: 'Pending Fees Student List',
                      onTap: () {
                        Routingpage.gotonext(
                            context: context, navigateto: pending_fees());
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ExpansionTile(
                  leading: Icon(
                    Icons.format_align_justify,
                    size: 30,
                    color: Colors.purple, // change the color to purple
                  ),
                  title: Text("See Forms"),
                  children: [
                    listtileforex(
                      title: 'Today Forms',
                      onTap: () {
                        Routingpage.gotonext(
                            context: context, navigateto: today_form());
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    listtileforex(
                      title: 'Yesterday Forms',
                      onTap: () {
                        Routingpage.gotonext(
                            context: context, navigateto: yesterday_form());
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    listtileforex(
                      title: 'All Forms',
                      onTap: () {
                        Routingpage.gotonext(
                            context: context, navigateto: all_form());
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    listtileforex(
                      title: 'Admission Canceled Form',
                      onTap: () {
                        Routingpage.gotonext(
                            context: context, navigateto: rejected_form());
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              MyListTile(
                icon: Icon(
                  Icons.newspaper,
                  size: 30,
                  color: Colors.pink, // change the color to purple
                ),
                name: "Add/Delete Notice",
                onTap: () {
                  Routingpage.gotonext(
                      context: context, navigateto: add_news_scrren());
                },
              ),
              SizedBox(
                height: 10,
              ),
              MyListTile(
                icon: Icon(
                  Icons.photo_library,
                  size: 30,
                  color: Colors.blue[900], // change the color to purple
                ),
                name: 'Add/Delete Photos',
                onTap: () {
                  Routingpage.gotonext(
                      context: context, navigateto: event_function());
                },
              ),
              SizedBox(
                height: 10,
              ),
              MyListTile(
                icon: Icon(
                  Icons.contact_support_outlined,
                  size: 30,
                  color: Colors.brown, // change the color to purple
                ),
                name: "See User Message",
                onTap: () {
                  Routingpage.gotonext(
                      context: context, navigateto: contact_us());
                },
              ),
              SizedBox(
                height: 10,
              ),
              MyListTile(
                icon: Icon(
                  Icons.exit_to_app,
                  size: 30,
                  color: Colors.red, // change the color to purple
                ),
                name: "Exit App",
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          "Exit App",
                          style: TextStyle(fontSize: 25),
                        ),
                        content: Text("Are you sure you want to exit the app?",
                            style: TextStyle(fontSize: 18)),
                        actions: <Widget>[
                          TextButton(
                            child:
                                Text("CANCEL", style: TextStyle(fontSize: 20)),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: Text("EXIT",
                                style:
                                    TextStyle(fontSize: 22, color: Colors.red)),
                            onPressed: () {
                              Navigator.of(context).pop();
                              SystemNavigator.pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyListTile extends StatelessWidget {
  final Icon? icon;
  final String name;
  final Function() onTap;

  const MyListTile(
      {Key? key, this.icon, required this.name, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        //<-- SEE HERE
        side: BorderSide(width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      leading: icon,
      title: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      onTap: onTap,
      // trailing: icon,
    );
  }
}

class listtileforex extends StatelessWidget {
  final String title;
  final Function() onTap;
  const listtileforex({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: ListTile(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        // leading: icon,
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        onTap: onTap,
        // trailing: icon,
      ),
    );
  }
}
