import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../common_widget/commen_textfiled.dart';
import '../rout/routing_page.dart';
import 'admission_form22.dart';

class admission_form extends StatefulWidget {
  const admission_form({Key? key}) : super(key: key);

  @override
  State<admission_form> createState() => _admission_formState();
}

class _admission_formState extends State<admission_form> {
  final gloablekey = GlobalKey<FormState>();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Admission Form",
              style: TextStyle(fontSize: 25, color: Colors.black)),
        ),
        backgroundColor: Colors.blue[600],
        elevation: 0,
      ),
      body: Form(
        key: gloablekey,
        child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 20),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,children: [
                      Text("Personal Information",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                      SizedBox(
                        height: 10,
                      ),
                      Commen_Textfiled(
                        hinttext: "Enter First Name",
                        preficicon: Icon(
                          Icons.man_outlined,
                          color: Colors.black54,
                          size: 30,
                        ),
                        maxlen: 1,
                        obscure: false,
                        labeltext: "First Name",
                        controller: fName_controler,
                        validator: (value) {
                          final bool firstnameValid =
                              RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%A-Z-a-z-]')
                                  .hasMatch(value!);
                          if (firstnameValid) {
                            return null;
                          } else {
                            return "Please enter valid First Name";
                          }
                        },
                        onchange: (value) {
                          gloablekey.currentState!.validate();
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Commen_Textfiled(
                        hinttext: "Enter Middle Name",
                        preficicon: Icon(
                          Icons.man_sharp,
                          color: Colors.black54,
                          size: 30,
                        ),
                        maxlen: 1,
                        obscure: false,
                        // fillcolor: Color(0xffFD683D),
                        labeltext: "Middle Name",
                        controller: mName_controler,
                        validator: (value) {
                          final bool mnameValid =
                              RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%A-Z-a-z-]')
                                  .hasMatch(value!);
                          if (mnameValid) {
                            return null;
                          } else {
                            return "Please enter valid Middle Name";
                          }
                          if (value!.isEmpty) {
                            return "Enter Middle Name";
                          }
                        },
                        onchange: (value) {
                          gloablekey.currentState!.validate();
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      // Radio(value: 1, groupValue: groupValue, onChanged: onChanged)
                      Commen_Textfiled(
                        hinttext: "Enter Last Name",
                        preficicon: Icon(
                          Icons.man_sharp,
                          color: Colors.black54,
                          size: 30,
                        ),
                        maxlen: 1,
                        obscure: false,
                        // fillcolor: Color(0xffFD683D),
                        labeltext: "Last Name",
                        controller: lName_controler,
                        validator: (value) {
                          final bool lnameValid =
                              RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%A-Z-a-z-]')
                                  .hasMatch(value!);
                          if (lnameValid) {
                            return null;
                          } else {
                            return "Please enter valid Last Name";
                          }
                          if (value!.isEmpty) {
                            return "Enter Last Name";
                          }
                        },
                        onchange: (value) {
                          gloablekey.currentState!.validate();
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Commen_Textfiled(
                        hinttext: "Enter DOB",
                        preficicon: Icon(
                          Icons.cake_outlined,
                          color: Colors.black54,
                          size: 30,
                        ),
                        maxlen: 1,
                        obscure: false,
                        controller: _date,
                        validator: (value) {
                          // final bool lnameValid =
                          // RegExp(r'^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\\d\\d$')
                          //     .hasMatch(value!);
                          if (value!.isEmpty) {
                            return "Enter Birth-date";
                          }
                        },
                        onchange: (value) {
                          gloablekey.currentState!.validate();
                        },
                        labeltext: "Date Of Birth",
                        ontap: () async {
                          DateTime? pickeddate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1990),
                              lastDate: DateTime(2025));
                          if (pickeddate != null) {
                            setState(() {
                              _date.text =
                                  DateFormat('dd-MM-yyyy').format(pickeddate);
                            });
                          }
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Commen_Textfiled(
                        hinttext: "Enter Email-id",
                        preficicon: Icon(
                          Icons.email,
                          color: Colors.black54,
                          size: 30,
                        ),
                        maxlen: 1,
                        obscure: false,
                        labeltext: "e-mail",
                        controller: Email_controler,
                        validator: (value) {
                          final bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value!);
                          if (emailValid) {
                            return null;
                          } else {
                            return "Please enter valid Email Id";
                          }
                          if (value!.isEmpty) {
                            return "Enter Number";
                          }
                        },
                        onchange: (value) {
                          gloablekey.currentState!.validate();
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Commen_Textfiled(
                        hinttext: "Enter Contact no",
                        preficicon: Icon(
                          Icons.phone,
                          color: Colors.black54,
                          size: 30,
                        ),
                        maxlen: 1,
                        obscure: false,
                        // fillcolor: Color(0xffFD683D),
                        msxlength: 10,
                        ktype: TextInputType.number,
                        labeltext: "Contact no",
                        controller: phone_controler,
                        validator: (value) {
                          final bool phoneValid =
                              RegExp(r'(^(?:[+0]9)?[0-9]{10,10}$)')
                                  .hasMatch(value!);
                          if (phoneValid) {
                            return null;
                          } else {
                            return "Please enter valid Phone Number";
                          }
                          if (value!.isEmpty) {
                            return "Enter Number";
                          }
                        },
                        onchange: (value) {
                          gloablekey.currentState!.validate();
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Commen_Textfiled(
                        hinttext: "Enter Aadhar no",
                        preficicon: Icon(
                          Icons.perm_identity,
                          color: Colors.black54,
                          size: 30,
                        ),
                        maxlen: 1,
                        msxlength: 12,
                        ktype: TextInputType.number,
                        obscure: false,
                        labeltext: "Aadhar card no",
                        controller: adhar_controler,
                        validator: (value) {
                          final bool adharValid =
                              RegExp(r'(^(?:[+0]9)?[0-9]{12,12}$)')
                                  .hasMatch(value!);
                          if (adharValid) {
                            return null;
                          } else {
                            return "Please enter valid Adhar Number";
                          }
                          if (value!.isEmpty) {
                            return "Enter Number";
                          }
                        },
                        onchange: (value) {
                          gloablekey.currentState!.validate();
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Commen_Textfiled(
                        hinttext: "Enter Address",
                        preficicon: Icon(
                          Icons.home,
                          color: Colors.black54,
                          size: 30,
                        ),
                        maxlen: null,
                        // filed: true,
                        obscure: false,
                        // fillcolor: Color(0xffFD683D),
                        labeltext: "Address",
                        controller: add_controler,
                        validator: (value) {
                          final bool addValid = RegExp(
                                  r'[!@#<>?":_`~;[\]\\|=+)(*&^%A-Z-a-z-0-9-]')
                              .hasMatch(value!);
                          if (addValid) {
                            return null;
                          } else {
                            return "Please enter valid Address";
                          }
                          if (value!.isEmpty) {
                            return "Enter Address";
                          }
                        },
                        onchange: (value) {
                          gloablekey.currentState!.validate();
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Commen_Textfiled(
                        hinttext: "Enter pincode",
                        preficicon: Icon(
                          Icons.location_on,
                          color: Colors.black54,
                          size: 30,
                        ),
                        maxlen: 1,
                        ktype: TextInputType.number,
                        msxlength: 6,
                        obscure: false,
                        // fillcolor: Color(0xffFD683D),
                        labeltext: "Pincode",
                        controller: pincode_controler,
                        validator: (value) {
                          final bool pincodeValid =
                              RegExp(r'(^(?:[+0]9)?[0-9]{6,6}$)')
                                  .hasMatch(value!);
                          if (pincodeValid) {
                            return null;
                          } else {
                            return "Please enter valid Pincode Number";
                          }
                          if (value!.isEmpty) {
                            return "Enter Number";
                          }
                        },
                        onchange: (value) {
                          gloablekey.currentState!.validate();
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Commen_Textfiled(
                        hinttext: "Enter City",
                        preficicon: Icon(
                          Icons.location_city,
                          color: Colors.black54,
                          size: 30,
                        ),
                        maxlen: 1,
                        obscure: false,
                        labeltext: "City",
                        controller: city_controler,
                        validator: (value) {
                          final bool cityValid =
                              RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%A-Z-a-z-]')
                                  .hasMatch(value!);
                          if (cityValid) {
                            return null;
                          } else {
                            return "Please enter valid city Name";
                          }
                          if (value!.isEmpty) {
                            return "Enter city Name";
                          }
                        },
                        onchange: (value) {
                          gloablekey.currentState!.validate();
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Commen_Textfiled(
                        hinttext: "Enter Taluka",
                        preficicon: Icon(
                          Icons.location_city_outlined,
                          color: Colors.black54,
                          size: 30,
                        ),
                        maxlen: 1,
                        obscure: false,
                        labeltext: "Taluka",
                        controller: taluka_controler,
                        validator: (value) {
                          final bool talukaValid =
                              RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%A-Z-a-z-]')
                                  .hasMatch(value!);
                          if (talukaValid) {
                            return null;
                          } else {
                            return "Please enter valid taluka Name";
                          }
                          if (value!.isEmpty) {
                            return "Enter taluka Name";
                          }
                        },
                        onchange: (value) {
                          gloablekey.currentState!.validate();
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Commen_Textfiled(
                        hinttext: "Enter District",
                        preficicon: Icon(
                          Icons.location_city,
                          color: Colors.black54,
                          size: 30,
                        ),
                        maxlen: 1,
                        obscure: false,
                        labeltext: "District",
                        controller: district_controler,
                        validator: (value) {
                          final bool districtValid =
                              RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%A-Z-a-z-]')
                                  .hasMatch(value!);
                          if (districtValid) {
                            return null;
                          } else {
                            return "Please enter valid District Name";
                          }
                          if (value!.isEmpty) {
                            return "Enter District Name";
                          }
                        },
                        onchange: (value) {
                          gloablekey.currentState!.validate();
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Commen_Textfiled(
                        hinttext: "Enter Father's First Name",
                        preficicon: Icon(
                          Icons.man,
                          color: Colors.black54,
                          size: 30,
                        ),
                        // filed: true,
                        obscure: false,
                        // fillcolor: Color(0xffFD683D),
                        labeltext: "Father's First name",
                        controller: ffname_controler,
                        validator: (value) {
                          final bool ffnameValid =
                              RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%A-Z-a-z-]')
                                  .hasMatch(value!);
                          if (ffnameValid) {
                            return null;
                          } else {
                            return "Please enter valid First Name";
                          }
                          if (value!.isEmpty) {
                            return "Enter First Name";
                          }
                        },
                        onchange: (value) {
                          gloablekey.currentState!.validate();
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Commen_Textfiled(
                        hinttext: "Enter Father's Middle Name",
                        preficicon: Icon(
                          Icons.man,
                          color: Colors.black54,
                          size: 30,
                        ),
                        // filed: true,
                        obscure: false,
                        // fillcolor: Color(0xffFD683D),
                        labeltext: "Father's Middle name",
                        controller: fmname_controler,
                        validator: (value) {
                          final bool fmnameValid =
                              RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%A-Z-a-z-]')
                                  .hasMatch(value!);
                          if (fmnameValid) {
                            return null;
                          } else {
                            return "Please enter valid Middle Name";
                          }
                          if (value!.isEmpty) {
                            return "Enter Middle Name";
                          }
                        },
                        onchange: (value) {
                          gloablekey.currentState!.validate();
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Commen_Textfiled(
                        hinttext: "Enter Father's Last Name",
                        preficicon: Icon(
                          Icons.man,
                          color: Colors.black54,
                          size: 30,
                        ),
                        // filed: true,
                        obscure: false,
                        // fillcolor: Color(0xffFD683D),
                        labeltext: "Father's Last name",
                        controller: flname_controler,
                        validator: (value) {
                          final bool flnameValid =
                              RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%A-Z-a-z-]')
                                  .hasMatch(value!);
                          if (flnameValid) {
                            return null;
                          } else {
                            return "Please enter valid Last Name";
                          }
                          if (value!.isEmpty) {
                            return "Enter Last Name";
                          }
                        },
                        onchange: (value) {
                          gloablekey.currentState!.validate();
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Commen_Textfiled(
                        hinttext: "Enter Father's Phone No",
                        preficicon: Icon(
                          Icons.phone,
                          color: Colors.black54,
                          size: 30,
                        ),
                        ktype: TextInputType.number,
                        msxlength: 10,
                        obscure: false,
                        // fillcolor: Color(0xffFD683D),
                        labeltext: "Father's Phone no.",
                        controller: fphone_controler,
                        validator: (value) {
                          final bool fphoneValid =
                              RegExp(r'(^(?:[+0]9)?[0-9]{10,10}$)')
                                  .hasMatch(value!);
                          if (fphoneValid) {
                            return null;
                          } else {
                            return "Please enter valid Phone Number";
                          }
                          if (value!.isEmpty) {
                            return "Enter Number";
                          }
                        },
                        onchange: (value) {
                          gloablekey.currentState!.validate();
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Commen_Textfiled(
                        hinttext: "Enter Father's Occupation",
                        preficicon: Icon(
                          Icons.work,
                          color: Colors.black54,
                          size: 30,
                        ),
                        // filed: true,
                        obscure: false,
                        // fillcolor: Color(0xffFD683D),
                        labeltext: "Father's Occupation",
                        controller: occupation_controler,
                        validator: (value) {
                          final bool occValid =
                              RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%A-Z-a-z-]')
                                  .hasMatch(value!);
                          if (occValid) {
                            return null;
                          } else {
                            return "Please enter valid occupation Name";
                          }
                          if (value!.isEmpty) {
                            return "Enter occupation";
                          }
                        },
                        onchange: (value) {
                          gloablekey.currentState!.validate();
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Commen_Textfiled(
                        hinttext: "Enter Father's Income",
                        preficicon: Icon(
                          Icons.monetization_on_outlined,
                          color: Colors.black54,
                          size: 30,
                        ),
                        ktype: TextInputType.number,
                        obscure: false,
                        // fillcolor: Color(0xffFD683D),
                        labeltext: "Father's Income",
                        controller: income_controler,
                        validator: (value) {
                          final bool incomeValid =
                              RegExp(r'(^(?:[+0]9)?[0-9]{4,12}$)')
                                  .hasMatch(value!);
                          if (incomeValid) {
                            return null;
                          } else {
                            return "Please enter valid income";
                          }
                          if (value!.isEmpty) {
                            return "Enter income";
                          }
                        },
                        onchange: (value) {
                          gloablekey.currentState!.validate();
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 30.sp,
                        width: 250.sp,
                        child: ElevatedButton(
                          onPressed: () {
                            if (gloablekey.currentState!.validate()) {
                              Routingpage.gotonext(context: context, navigateto: admission_form22(
                                  fname: fName_controler.text,
                                  mname: mName_controler.text,
                                  lname: lName_controler.text,
                                  dob: _date.text,
                                  email: Email_controler.text,
                                  address: add_controler.text,
                                  adharno: adhar_controler.text,
                                  city: city_controler.text,
                                  contact:phone_controler.text,
                                  pincode: pincode_controler.text,
                                  taluka: taluka_controler.text,
                                  district: district_controler.text,
                                  ffname: ffname_controler.text,
                                  fmname: fmname_controler.text,
                                  flname: flname_controler.text,
                                  fincome: income_controler.text,
                                  foccupation: occupation_controler.text,
                                  fphoneno: fphone_controler.text),);
                            }
                          },
                          child: Text(
                            "NEXT",
                            style: TextStyle(fontSize: 20.sp),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
    );
  }
}
