import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/Add.dart';
import 'package:untitled5/Hagz.dart';
class Adecor extends StatefulWidget {
  const Adecor({super.key});

  @override
  State<Adecor> createState() => _AdecorState();
}

class _AdecorState extends State<Adecor> {
  var namehall1,namehall2,namehall3,typeparty1,typeparty2,typeparty3,numberperson;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  Hagz hagz=new Hagz();

  add1(){
    if(formstate.currentState!.validate()){

      formstate.currentState?.save();
    CollectionReference  adec    = FirebaseFirestore.instance.collection("adecor");
      adec.add({
      "namehall1":namehall1,
      "numberperson":numberperson,
        "email":FirebaseAuth.instance.currentUser?.email,
    });
  }}
  @override
  Widget build(BuildContext context) {
    return
      Directionality(textDirection: TextDirection.rtl, child:
      Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView( children:[ Form(
          autovalidateMode: AutovalidateMode.always,
          key: formstate,
          child: Column(children: [
            Container(height: 10,),
            Image.asset("images/OIP (12).jpg",height: 100,),
            Container(height: 50,),
            Column(
              children:
              [
                TextFormField(
                  onSaved: (val){
                    namehall1=val;
                  }
                  ,
                  validator: (val){
                    if (val!.length<5){
        
                      return "not valid";
                    }},
                  decoration: InputDecoration(
        
                      hintText: "اسم القاعه: ",
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
        
        
        
                      )
                  ),
        
                ),
        
                Container(height: 10,),
                TextFormField(
                  onSaved: (val){
                    numberperson=val;
                  }
                  ,
                  validator: (val){
                    if (val!.length==null){
        
                      return "not valid";
                    }},
                  decoration: InputDecoration(
        
                      hintText: "عدد الافراد",
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
        
        
        
                      )
                  ),
                )],


            ) ],),
        ),
          Container(height: 50,),
          InkWell(
            onTap: (){
              add1();
              Navigator .of(context).pushReplacement(MaterialPageRoute(builder: (context){

                return  Add();
              }));
            },
            child:
            Container(

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.greenAccent
                ),
                padding: EdgeInsets.all(10),

                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("اضافه",style: TextStyle(fontSize: 20,color: Colors.white),)],)),),
        ],),
      ),
    ));
  }
}
