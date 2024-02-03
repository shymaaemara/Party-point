import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/Hagz.dart';
import 'package:untitled5/Homepage.dart';
class Shaqa extends StatefulWidget {
  const Shaqa({super.key});

  @override
  State<Shaqa> createState() => _ShaqaState();
}


class _ShaqaState extends State<Shaqa> {
  var shaqa;
  GlobalKey<FormState> formstate=new GlobalKey<FormState>();

  addahaqa(){

  CollectionReference Shaqa=FirebaseFirestore.instance.collection("shaqa");
  Shaqa.add({
    "shaqa":shaqa,
      "id":FirebaseAuth.instance.currentUser?.uid
    });

  }
  @override
  Widget build(BuildContext context) {
    return
      Directionality(textDirection: TextDirection.rtl, child:

      Scaffold(
      appBar: AppBar(backgroundColor: Colors.greenAccent,),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(children: [
        Container(height: 100,),
        Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(color: Colors.pinkAccent[100],
            borderRadius: BorderRadius.circular(50)
          ),
          child: Column(

            children: [
              Text(" اهلا بك  هل لديك مشكله معينه ",style: TextStyle(fontSize: 20,color: Colors.white),),
              Text("  ان كان لديك ارسلها علي الفور  ",style: TextStyle(fontSize: 20,color: Colors.white),),
            ],
          ),),
        Container(height: 50,),
        Form(
            key: formstate,
            child: Column(children: [
          TextFormField(

            onSaved: (val){
              shaqa=val;
            }
            ,
            validator: (val){
              if (val!.length<1&&val.isEmpty){

                return "not valid";
              }},
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.paste_outlined),
                hintText: "الشكوي",
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),


                )
            ),
          ),
              Container(height: 80,),
              InkWell(
                onTap: (){
    if(formstate.currentState!.validate()){

    formstate.currentState?.save();
                  addahaqa();
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.info,
                    headerAnimationLoop: false,
                    animType: AnimType.bottomSlide,
                    title: 'لقد ارسلت شكوتك ',

                    buttonsTextStyle: const TextStyle(color: Colors.black),
                    showCloseIcon: true,

                    btnOkOnPress: () {
                      Navigator.of(context).pushReplacement
                        (MaterialPageRoute(builder: (context){
                        return  Hagz();
                      }));
                      ;
                    },
                  ).show();

                }},
                child:
                Container(
                    decoration: BoxDecoration(

                      color: Colors.yellow[200],
                    ),
                    padding: EdgeInsets.all(10),

                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("ارسال",style: TextStyle(fontSize: 20,color:Colors.grey),)],)),),
        ],))
      ],),),
    ));
  }
}
