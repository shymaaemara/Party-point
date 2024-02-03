import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


import 'Hasan.dart';

import 'Omar.dart';
import 'Sead.dart';
class Monsqy extends StatefulWidget {
  const Monsqy ({super.key});

  @override
  State<Monsqy > createState() => _MonsqyState();
}

class _MonsqyState extends State<Monsqy > {
  var namehall1,namehall2,namehall3,typeparty1,typeparty2,typeparty3;

  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

add1(){
       CollectionReference  has     = FirebaseFirestore.instance.collection("hasan");
       has.add({
         "namehall1":namehall1,
         "typeparty1":typeparty1,

       });
}
add2(){
  CollectionReference  se    = FirebaseFirestore.instance.collection("sead");
  se.add({
    "namehall2":namehall2,
    "typeparty2":typeparty2,

  });
}
  add3(){
    CollectionReference  omr    = FirebaseFirestore.instance.collection("omar");
    omr .add({
      "namehall3":namehall3,
      "typeparty3":typeparty3,

    });
  }
  @override
  Widget build(BuildContext context) {
    return
      Directionality(textDirection: TextDirection.rtl, child:
      Scaffold(
        appBar: AppBar(backgroundColor: Colors.greenAccent),
        body: Container(
          padding: EdgeInsets.all(10),
          child:
        Column(children: [

          Container(
              padding: EdgeInsets.all(20),
              child: Center(child: Text("منسقى الحفلات ",style: TextStyle(fontSize: 20),),)),

          Expanded(
            flex: 3,
            child: ListView(children: [
              InkWell(
                onTap: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){

                    return Hasan();
                  }));
                },
                child: Card(

                  child: Form(
                    child: Column(children: [
                      Image.asset("images/OIP (6).jpg",height: 100,),
                      Column(
                       children:
                          [
                          TextFormField(
                          onSaved: (val){
                            namehall1=val;
                          }
                          ,
                          validator: (val){
                            if (val!.length<10){

                              return "not valid";
                            }},
                          decoration: InputDecoration(

                              hintText: "اسم القاعه ",
                              filled: true,
                              fillColor: Colors.grey[100],
                              border: OutlineInputBorder(



                              )
                          ),

                        ),

                      Container(height: 10,),
                      TextFormField(
                        onSaved: (val){
                          typeparty1=val;
                        }
                        ,
                        validator: (val){
                          if (val!.length<10){

                            return "not valid";
                          }},
                        decoration: InputDecoration(

                            hintText: "نوع الحفله",
                            filled: true,
                            fillColor: Colors.grey[100],
                            border: OutlineInputBorder(



                            )
                        ),
                      )],


                      ) ],),
                  ),),
              ),
              InkWell(
                onTap: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){

                    return Sead();
                  }));
                },
                child: Card(
                  child: Form(
                    child: Column(children: [
                      Image.asset("images/avatar.jpg",height: 100,),
                      TextFormField(
                        onSaved: (val){
                          namehall2=val;
                        }
                        ,
                        validator: (val){
                          if (val!.length<10){

                            return "not valid";
                          }},
                        decoration: InputDecoration(

                            hintText: "اسم القاعه ",
                            filled: true,
                            fillColor: Colors.grey[100],
                            border: OutlineInputBorder(



                            )
                        ),
                      ),
                      Container(height: 10,),
                      TextFormField(
                        onSaved: (val){
                          typeparty2=val;
                        }
                        ,
                        validator: (val){
                          if (val!.length<10){

                            return "not valid";
                          }},
                        decoration: InputDecoration(

                            hintText: "نوع الحفله ",
                            filled: true,
                            fillColor: Colors.grey[100],
                            border: OutlineInputBorder(



                            )
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.all(20),
                          child: Center(child: MaterialButton(
                            shape: RoundedRectangleBorder(

                            ),
                            color: Colors.greenAccent,
                            onPressed: ()async {


                            }
                            ,child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text("اضافه",style: TextStyle(fontSize: 20,color: Colors.white),),
                              Icon(Icons.arrow_forward_ios,color: Colors.white,),
                            ],
                          ),),)),
                    ],),
                  ),),
              ),

              InkWell(
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){

                      return Omar();
                    }));
                  },
                  child:  Card(

                    child: Form(
                      child: Column(children: [
                        Image.asset("images/artworks-000187254853-pg3rfe-t500x500.jpg",height: 100,),
                        TextFormField(
                          onSaved: (val){
                            namehall3=val;
                          }
                          ,
                          validator: (val){
                            if (val!.length<10){

                              return "not valid";
                            }},
                          decoration: InputDecoration(

                              hintText: "اسم القاعه ",
                              filled: true,
                              fillColor: Colors.grey[100],
                              border: OutlineInputBorder(



                              )
                          ),
                        ),
                        Container(height: 10,),
                        TextFormField(
                          onSaved: (val){
                            typeparty3=val;
                          }
                          ,
                          validator: (val){
                            if (val!.length<10){

                              return "not valid";
                            }},
                          decoration: InputDecoration(

                              hintText: "نوع الحفله ",
                              filled: true,
                              fillColor: Colors.grey[100],
                              border: OutlineInputBorder(



                              )
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.all(20),
                            child: Center(child: MaterialButton(
                              shape: RoundedRectangleBorder(

                              ),
                              color: Colors.greenAccent,
                              onPressed: ()async {


                              }
                              ,child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Text("اضافه",style: TextStyle(fontSize: 20,color: Colors.white),),
                                Icon(Icons.arrow_forward_ios,color: Colors.white,),
                              ],
                            ),),)),
                      ],),
                    )
                    ,)),

       ] ),
          )
        ],)



    ))) ;
  }
}
