

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/Hasan.dart';
import 'package:untitled5/Sighin.dart';



import 'Logo.dart';
import 'Omar.dart';
import 'Sead.dart';
class Homepage extends StatefulWidget {
  final String username;
  final String phone;
  final String email;
  const Homepage({super.key, required this.username, required this.phone, required this.email});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List data=[];
  gethagz()async{
    QuerySnapshot querySnapshot =await FirebaseFirestore.instance.collection("hagz").get();
    data.addAll(querySnapshot.docs);
    setState(() {

    });
  }
  Sighin sigh=new Sighin();
  @override
  void initState() {
    gethagz();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
      Directionality(textDirection: TextDirection.rtl, child:
      Scaffold(
        drawer: Drawer(child: Column(children: [
          Container(
            color: Colors.greenAccent,
            child:Center(
              child: Column(
                children: [
                  Container(height: 60,),
                   Image.asset("images/OIP (12).jpg",height: 80,),
                  Container(height: 20,),
                  Text("معلومات المستخدم",style: TextStyle(fontSize: 20,color:Colors.white ),),
                ],
              ),
            ) ,height:250 ,)
          ,ListTile(leading: Icon(Icons.person),title: Text("اسم المستخدم"),subtitle: Text("${widget.username}"),),
            ListTile(leading: Icon(Icons.email),title: Text("الايميل "),subtitle: Text("${widget.email}"),),
          ListTile(leading: Icon(Icons.phone),title: Text("رقم الهاتف"),subtitle: Text("${widget.phone}"),),
          Divider(),
          ListTile(leading: InkWell(
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
                      return Homepage(username: widget.username, phone: widget.phone, email: widget.email,);
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
              child: Icon(Icons.exit_to_app)),title: Text("تسجل الخروج"),),
        ],),),
        appBar: AppBar(backgroundColor: Colors.greenAccent),
        body: Container(child:
        Column(children: [

          Image.asset("images/Copy-of-2016-1.png",height: 350,fit: BoxFit.fill,),

          Container(
              padding: EdgeInsets.all(20),
              child: Center(child: Text("منسق الحفلات ",style: TextStyle(fontSize: 20),),)),

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

                  child: Column(children: [
                    Image.asset("images/OIP (6).jpg",height: 80,),
                    Text(" حسن محمد ",style: TextStyle(fontSize: 20)),
                    Text("منسق حفلات",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.lightBlue[700]))
                  ],),),
              ),
              InkWell(
                onTap: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){

                    return Sead();
                  }));
                },
                child: Card(
                  child: Column(children: [
                    Image.asset("images/avatar.jpg",height: 80,),
                    Text(" سيد محمد  ",style: TextStyle(fontSize: 20)),
                    Text("  منسق حفلات تخرج",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.lightBlue[700]))
                  ],),),
              ),
              InkWell(
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){

                      return Omar();
                    }));
                  },
                  child:  Card(

                    child: Column(children: [
                      Image.asset("images/artworks-000187254853-pg3rfe-t500x500.jpg",height: 80,),
                      Text(" عمرو جمال  ",style: TextStyle(fontSize: 20)),
                      Text("  منسق حفلات واعياد ميلاد",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.lightBlue[700]))
                    ],),)),

            ],),
          )
        ],)


          ,),
      ));
  }
}
