import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/Adecor.dart';


import 'Homepage.dart';
import 'Logo.dart';
import 'Monsqy.dart';
import 'Showhagz.dart';
class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(backgroundColor: Colors.greenAccent, leading: InkWell(
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
          child: Icon(Icons.exit_to_app,color: Colors.white,),) ,),
        body: Container(child: ListView(children: [
          Image.asset("images/OIP (12).jpg",height: 200,),
          Container(height: 50,),
          Container(
              padding: EdgeInsets.all(20),
              child: Center(child: MaterialButton(
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(

                ),
                color: Colors.greenAccent,
                onPressed: ()async {

                  Navigator .of(context).pushReplacement(MaterialPageRoute(builder: (context){

                    return Adecor();
                  }));
                }
                ,child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("اضافه الديكور",style: TextStyle(fontSize: 20,color: Colors.white),),
                  Icon(Icons.arrow_forward_ios,color: Colors.white,)
                ],
              ),),)),
          Container(
              padding: EdgeInsets.all(20),
              child: Center(child: MaterialButton(
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(

                ),
                color: Colors.greenAccent,
                onPressed: ()async {
                  Navigator .of(context).pushReplacement(MaterialPageRoute(builder: (context){

                    return Shoehagz();
                  }));

                }
                ,child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back_ios,color: Colors.white,),
                  Text("   طلب العميل",style: TextStyle(fontSize: 20,color: Colors.white),),

                ],
              ),),)),

        ],),),
      );
  }
}
