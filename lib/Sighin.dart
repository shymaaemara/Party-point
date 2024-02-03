import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/Homepage.dart';

import 'Login.dart';
class Sighin extends StatefulWidget {
  const Sighin({super.key});

  @override
  State<Sighin> createState() => _SighinState();
}

class _SighinState extends State<Sighin> {
  var username,phone,email,password;
  GlobalKey<FormState> formstate=new GlobalKey<FormState>();
  bool showpassword=false;
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child:
    Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
      ),
      body: Container(

        padding: EdgeInsets.all(20),
        child: ListView(children: [
          Image.asset("images/OIP (12).jpg",height: 150,),
          Container(height: 20,),

          Form(
              key:  formstate,
              child:Column(children: [
                TextFormField(
                  onSaved: (val){

                    username=val;
                  }
                  ,
                  validator: (val){
                    if (val!.length<4){
                      return "not valid";
                    }
                    return null;},
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "اسم المستخدم",
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),


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
                        borderRadius: BorderRadius.circular(50),


                      )
                  ),),
                Container(height: 20,),
                TextFormField(onSaved: (val){

                  email=val;
                }
                  ,
                  validator: (val){
                    if (val!.length<4){
                      return "not valid";
                    }
                    return null;},
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: "الايميل",
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),


                      )
                  ),),
                Container(height: 20,),
                TextFormField(
                  obscureText: !showpassword,
                  onSaved: (val){

                    password=val;
                  }
                  ,
                  validator: (val) {
                    if (val!.length < 4) {
                      return "not valid";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      suffixIcon:  IconButton(
                        icon: Icon(
                            showpassword?
                            Icons.visibility:
                            Icons.visibility_off
                        ), onPressed: () {
                        setState(() {
                          showpassword=!showpassword;
                        });
                      },
                      ),
                      prefixIcon: Icon(Icons.lock),
                      hintText: "كلمه السر",
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),


                      )
                  ),
                ),
              ],)


          ),
          Container(height: 30,),
          MaterialButton(

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),
              color: Colors.greenAccent,
              onPressed: ()async {


                if(formstate.currentState!.validate()){

                  formstate.currentState?.save();
                  try {
                    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );


                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.success,
                      headerAnimationLoop: false,
                      animType: AnimType.bottomSlide,
                      title: 'success',
                      desc: '  لقد تم تسجسل الجساب بنجاح',
                      buttonsTextStyle: const TextStyle(color: Colors.black),
                      showCloseIcon: true,
                      btnCancelOnPress: () {

                      },
                      btnOkOnPress: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                          return Homepage(username: username, phone: phone, email: email);
                        }));
                      },
                    ).show();

                  } on FirebaseAuthException catch (e) {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.warning,
                      headerAnimationLoop: false,
                      animType: AnimType.bottomSlide,
                      title: 'تحزير',
                      desc: 'الايميل موجود بالفعل',
                      buttonsTextStyle: const TextStyle(color: Colors.black),
                      showCloseIcon: true,
                      btnCancelOnPress: () {

                      },
                      btnOkOnPress: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                          return Sighin();
                        }));
                      },
                    ).show();

                    if (e.code == 'weak-password') {

                    } else if (e.code == 'email-already-in-use') {

                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }

                }else{
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    headerAnimationLoop: false,
                    animType: AnimType.bottomSlide,
                    title: 'تحزير',
                    desc: 'هنا خطا في انشاء الحساب ',
                    buttonsTextStyle: const TextStyle(color: Colors.black),
                    showCloseIcon: true,
                    btnCancelOnPress: () {

                    },
                    btnOkOnPress: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return Sighin();
                      }));
                    },
                  ).show();
                }


              }
              ,child: Text("تسجيل حساب",style: TextStyle(fontSize: 25
              ,color: Colors.white),)

          ),
          Container(height: 30,),
          MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),
              color: Colors.pinkAccent,
              onPressed: ()async {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){

                  return Login();
                }));

              }
              ,child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text("عوده",style: TextStyle(fontSize: 25
                  ,color: Colors.black),),
              Icon(Icons.arrow_forward_ios),
            ],
          )

          ),
        ],),),
    ));
  }
}
