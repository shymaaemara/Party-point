import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/Adecor.dart';
import 'package:untitled5/Anser.dart';
class Shoehagz extends StatefulWidget {
  const Shoehagz({super.key});

  @override
  State<Shoehagz> createState() => _ShoehagzState();
}

class _ShoehagzState extends State<Shoehagz> {


  CollectionReference hagz = FirebaseFirestore.instance.collection("hagz");

  @override
  Widget build(BuildContext context) {
    return
      Directionality(textDirection: TextDirection.rtl, child:
      Scaffold(
        appBar: AppBar(backgroundColor: Colors.greenAccent,),
        body: Container(child: StreamBuilder(
            stream: hagz.limit(1).snapshots(),
            builder: (context, snopshot) {
              if (snopshot.hasError) {
                return Text("has error");
              }
              if (snopshot.connectionState == ConnectionState.waiting) {
                return Center(child: Container(
                    padding: EdgeInsets.all(100),
                    color: Colors.orangeAccent,

                    child: Text("جاري الرد", style: TextStyle(fontSize: 30),)));
              }
              if (snopshot.hasData) {
                return ListView.builder(
                    itemCount: snopshot.data?.docs.length,
                    itemBuilder: (context, i) {
                      return Card(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(child: Text(
                              "نوع الحفله:${ snopshot.data?.docs[i]['type']}",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black)),),
                          Container(height: 20,),
                          Container(child: Text(
                              "رقم الهاتف:${ snopshot.data?.docs[i]['phone']} ",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black)),),
                          Container(height: 20,),
                          Container(child: Text("تاريخ المناسبه:${ snopshot.data
                              ?.docs[i]['history']}", style: TextStyle(
                              fontSize: 20, color: Colors.black)),),
                          Container(height: 20,),
                          Container(child: Text("وصف المناسبه: ${ snopshot.data
                              ?.docs[i]['desc']}", style: TextStyle(
                              fontSize: 20, color: Colors.black)),),
                          Container(height: 20,),
                          Container(
                              padding: EdgeInsets.all(20),
                              child: Center(child: MaterialButton(
                                shape: RoundedRectangleBorder(

                                ),
                                color: Colors.greenAccent,
                                onPressed: () async {

                                  Navigator.of(context).push
                                    (MaterialPageRoute(builder: (context){
                                    return Adecor();
                                  }));
                                }
                                , child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("الرد", style: TextStyle(
                                      fontSize: 20, color: Colors.white),),
                                  Icon(Icons.arrow_forward_ios,
                                    color: Colors.white,)
                                ],
                              ),),)),
                        ],),);
                    });
              }
              return Text("loading");
            }


        ),),
      ));
  }
}