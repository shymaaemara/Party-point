import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/Anser.dart';
import 'package:untitled5/Showdecor.dart';


import 'Homepage.dart';
import 'Showhagz.dart';
class Hagz extends StatefulWidget {
  const Hagz({super.key});

  @override
  State<Hagz> createState() => _HagzState();
}

class _HagzState extends State<Hagz> {
  var type,phone,history,password,email,desc,name;

  GlobalKey<FormState> formstate=new GlobalKey<FormState>();








  addhagz(){

    if(formstate.currentState!.validate()) {
      formstate.currentState?.save();
      DocumentReference hagz  =   FirebaseFirestore.instance.collection("hagz").doc();
      hagz.set({
        "type":type,
        "phone":phone,
        "history":history,
        "desc":desc,
            "email":email,
        "name":name,


      },SetOptions(merge: true));

      AwesomeDialog(
        context: context,
        dialogType: DialogType.info,
        headerAnimationLoop: false,
        animType: AnimType.bottomSlide,
        title: 'لقد ادخلت بياتاتك بنجاح ',
        desc: 'انتظر  الرد',
        buttonsTextStyle: const TextStyle(color: Colors.black),
        showCloseIcon: true,

        btnCancelOnPress: () {



        },
          btnOkOnPress: () {
            Navigator .of(context).pushReplacement(MaterialPageRoute(builder: (context){

              return Showdacor();
            }));
          }
      ).show();




    }
  }


  @override
  Widget build(BuildContext context) {
    return
      Directionality(textDirection: TextDirection.rtl, child:
      Scaffold(
        appBar: AppBar(),
        body:  Container(

          padding: EdgeInsets.all(20),
          child: ListView(children: [
            Image.asset("images/OIP (12).jpg",height: 100,),
            Container(height: 20,),

            Form(
              autovalidateMode: AutovalidateMode.always,
                key:  formstate,
                child:Column(children: [

                  Container(height: 20,),
                  TextFormField(
                    onSaved: (val){

                      type=val;
                    }
                    ,
                    validator: (val){
                      if (val!.length<4){
                        return "not valid";
                      }
                      return null;},
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: "نوع المناسبة",
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(



                        )
                    ),
                  ),
                  Container(height: 20,),
                  TextFormField(onSaved: (val){

                    phone=val;
                  }
                    ,
                    validator: (val){
                      if (val!.length<11){
                        return "not valid";
                      }
                      return null;},
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        hintText: "رقم الهاتف",
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(



                        )
                    ),),
                  Container(height: 20,),
                  TextFormField(onSaved: (val){

                    history=val;
                  }
                    ,
                    validator: (val){
                      if (val!.length<4){
                        return "not valid";
                      }
                      return null;},
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.date_range),
                        hintText: "تاريخ المناسبه",
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(



                        )
                    ),),
                  Container(height: 20,),
                  TextFormField(
                    maxLength: 10,
                    onSaved: (val){

                      desc=val;
                    }
                    ,
                    validator: (val) {
                      if (val!.length < 4) {
                        return "not valid";
                      }
                      return null;
                    },
                    decoration: InputDecoration(

                        prefixIcon: Icon(Icons.description_outlined),
                        hintText: "وصف المناسبه",
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(



                        )
                    ),
                  ),
                ],)


            ),
            Container(height: 30,),
            MaterialButton(

                shape: RoundedRectangleBorder(

                ),
                color: Colors.greenAccent,
                onPressed: ()async {
                  addhagz();
                }


                ,child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("    ارسال",style: TextStyle(fontSize: 25
                    ,color: Colors.white),),
                Icon(Icons.arrow_forward_ios,color: Colors.pinkAccent,)
              ],
            )

            ),
            Container(height: 30,),
            MaterialButton(

                shape: RoundedRectangleBorder(

                ),
                color: Colors.greenAccent,
                onPressed: ()async {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                    return Showdacor();
                  }));
                }


                ,child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back_ios_new,color: Colors.pinkAccent,),
                Text("    الرد",style: TextStyle(fontSize: 25
                    ,color: Colors.white),),

              ],
            )

            ),

          ],),),
      ));
  }
}
