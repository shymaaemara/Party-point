import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/Add.dart';
class Adecor extends StatefulWidget {
  const Adecor({super.key});

  @override
  State<Adecor> createState() => _AdecorState();
}

class _AdecorState extends State<Adecor> {
  var namehall1,namehall2,namehall3,typeparty1,typeparty2,typeparty3;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  add1(){
    if(formstate.currentState!.validate()){

      formstate.currentState?.save();
      CollectionReference  has     = FirebaseFirestore.instance.collection("decor");
      has.add({
        "namehall1":namehall1,
        "typeparty1":typeparty1,

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
                      if (val!.length<10){

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
                      typeparty1=val;
                    }
                    ,
                    validator: (val){
                      if (val!.length==null){

                        return "not valid";
                      }},
                    decoration: InputDecoration(

                        hintText: "نوع الحفله:",
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
