import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Homepage.dart';
import 'Logo.dart';
class Showshaqa extends StatefulWidget {
  const Showshaqa({super.key});

  @override
  State<Showshaqa> createState() => _ShowshaqaState();
}

class _ShowshaqaState extends State<Showshaqa> {
  List data=[];
    bool isloading =true;

  getshoqa()async{
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("shaqa").get();
    isloading =false;
    data.addAll(querySnapshot.docs);
    setState(() {

    });

  }
  @override
  void initState() {
    getshoqa();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
      Directionality(textDirection: TextDirection.rtl, child:
      Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        leading: InkWell(
          onTap: (){
            AwesomeDialog(
              context: context,
              dialogType: DialogType.warning,
              headerAnimationLoop: false,
              animType: AnimType.bottomSlide,
              title: 'تحزير',
              desc: 'هل تريد الخروج من التطبيق',
              buttonsTextStyle: const TextStyle(color: Colors.black),
              showCloseIcon: true,
              btnCancelOnPress: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return Homepage(username: '', phone: '', email: '',);
                }));
              },
              btnOkOnPress: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                  return Logo();
                }));
              },
            ).show();
          },
          child: Icon(Icons.exit_to_app,color: Colors.white,),) ,

      ),
      body:


      ListView.builder(
          itemCount: data.length,
          itemBuilder: (context,i){
        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [


            Container(height: 20,),
            Container(
color: Colors.greenAccent,
              padding: EdgeInsets.all(50),
              child: Row(
                children: [
                  Text("الشكوي:",style: TextStyle(fontSize: 20,color: Colors.pinkAccent),),
                  Text("${data[i]['shaqa']}",style: TextStyle(fontSize: 20),),
                ],
              ),)
          ],),);
      })
    ));
  }
}
