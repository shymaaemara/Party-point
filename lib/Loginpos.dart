import 'package:flutter/material.dart';
import 'package:untitled5/Shoshaqa.dart';

import 'Logo.dart';
class Loginpos extends StatefulWidget {
  const Loginpos({super.key});

  @override
  State<Loginpos> createState() => _LoginposState();
}

class _LoginposState extends State<Loginpos> {
  var password,email;
  GlobalKey<FormState> formstate=new GlobalKey<FormState>();
  bool showpassword=false;
  @override
  Widget build(BuildContext context) {
    return
      Directionality(textDirection: TextDirection.rtl, child:
      Scaffold(
      appBar: AppBar(backgroundColor: Colors.greenAccent,),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(children: [

          Image.asset("images/OIP (12).jpg",height: 150,),
          Container(height: 100,),
          Form(
            autovalidateMode: AutovalidateMode.always,
            key: formstate,
            child: Column(
              children: [
                TextFormField(



                  validator: (val){
                    if (val!.length<10){
                      return "not valid";
                    }
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: "الايميل",
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),


                      )
                  ),
                ),
              ],
            ),
          ),
          Container(height: 20,),
          TextFormField(

            obscureText:  !showpassword,

            validator: (val){
              if (val!.length<5){
                return "not valid";
              }
            },
            decoration: InputDecoration(
                suffixIcon:  IconButton(onPressed: (){
                  setState(() {
                    showpassword=!showpassword;
                  });
                }, icon: Icon(
                    showpassword?Icons.visibility:Icons.visibility_off
                )),
                prefixIcon: Icon(Icons.lock),
                hintText: "كلمه المرور ",
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),


                )
            ),
          ),
          Container(height: 60,),

          MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),
              color: Colors.pinkAccent,
              onPressed: ()async {
                if(formstate.currentState!.validate()){


                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){

                    return Showshaqa();
                  }));

                }}
              ,child: Text("تسجيل الدخول",style: TextStyle(fontSize: 20,color: Colors.white),)

          ),
          Container(height: 20,),
          MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),

              onPressed: ()async {

                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                  return Logo ();
                }));


              }
              ,child: Text("عوده",style: TextStyle(fontSize: 20,color: Colors.black),)
          )
        ],),),
    ));

  }
}



