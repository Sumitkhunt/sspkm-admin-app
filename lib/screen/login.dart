import 'package:admin/common_widget/Comman_TeextFiled.dart';
import 'package:admin/common_widget/comman_button.dart';
import 'package:admin/rout/routing_page.dart';
import 'package:admin/screen/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  GlobalKey<FormState> _formkey=GlobalKey<FormState>();
  TextEditingController password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(right: 15,left: 15),
            child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/logo.png",height:height*0.30 ,width: width*0.70,),
                    SizedBox(height: 10,),
                    Text("Welcome Back Admin",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
                  ],
                )
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                key: _formkey,
                  child:
              Comman_TexxtFiled(
                obscureText: true,
                validator: (v){
                  if(v!="Admin@123"){
                    return "Incorrect Password";
                  }
                  if(v!.length==0){
                    return "Please Enter Password";
                  }
                },
                controller: password,
                prefixicon: Icon(Icons.lock),
                labletext: "Enter Password",
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.black)),
                focouseborder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.blue)),
                FocusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(color: Colors.red),),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.red)),
              )
              ),
              SizedBox(
                height: 20,
              ),
              comman_button(
                color: Colors.blue,
                ontap: (){
                  if(_formkey.currentState!.validate()){
                    Routingpage.pushreplase(context: context, navigateto: admin_home());
                  }
                },
                text: "Login",
              )
            ],

          ),)
        ));
  }
  }
