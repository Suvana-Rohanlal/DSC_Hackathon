import 'package:XhasaSmall/Shared/Constants.dart';
import 'package:XhasaSmall/services/api.dart';
import 'package:flutter/material.dart';

import 'SignIn.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final customerNameController = TextEditingController(); // where we will get user input
  final customerPasswordController = TextEditingController();
  final customerEmailContactController = TextEditingController();

  String registerFailed = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset:false,
//      appBar: AppBar(
//        title:Text("Register"),
//        centerTitle: true,
//        backgroundColor: Colors.deepPurpleAccent[200],
//
//      ),
      body:Container(
        //color:Colors.transparent,
        width:MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    "assets/images/background.jpg"
                ),

                fit: BoxFit.cover
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
//            SizedBox(
//              height:20
//            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height:100,
                width:200,
                color:Colors.white,
                child: Image(
                  image:AssetImage("assets/images/logo.png"),
                  fit:BoxFit.fill,

                ),
              ),
            ),
            SizedBox(
              height:30
            ),
            Text(
              registerFailed,
              style:TextStyle(
                color:Colors.red,
              )
            ),
            SizedBox(
              height:10
            ),
            Container(
              child:Text(
                  "Register",
                style: TextStyle(
                  fontSize: 22,
                  letterSpacing: 1.5,
                ),
              )
            ),
            SizedBox(
              height:20
            ),
            Expanded(
            child:Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 12),
              child: TextFormField(
                controller: customerNameController,
                decoration: textInputDecoration.copyWith(hintText: "Name"),
              ),
            ),),
            Expanded(
            child: Padding(
               padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 12),
               child: TextFormField(
                 controller: customerPasswordController,
                 decoration: textInputDecoration.copyWith(hintText: "Password"),
               ),
             ),),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 12),
                child: TextFormField(
                  controller: customerEmailContactController,
                  decoration: textInputDecoration.copyWith(hintText: "Email"),
                ),
              ),
            ),
            SizedBox(
              height:50,
            ),
            Expanded(
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    Navigator.pop(context); // so that it doesn't return to registration
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignIn())
                    );
                  });
                },
                child: Container(
                  height:250,
                  width:250,
                  child: Text(
                      "Already have an account? Sign in",
                    style:TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 15,
                    )
                  ),
                ),
              ),
            ),
            SizedBox(
              height:60
            ),
            Container(
              height:50,
              width:150,
              child: FlatButton(
                onPressed: ()async{
                  if(customerNameController.value.text =="" ||customerEmailContactController.value.text ==""||customerPasswordController.value.text ==""){
                    setState(() {
                      registerFailed = "Please don't leave any fields empty";
                    });

                  }
                  else {
                    bool registrationSuccesful = await signUp(
                        name: customerNameController.value.text,
                        email: customerEmailContactController.value.text,
                        password: customerPasswordController.value.text);
                    if (registrationSuccesful) {
                      setState(() {
                        Navigator.pop(
                            context); // so that it doesn't return to registration
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignIn())
                        );
                      });
                    }
                    else {
                      registerFailed =
                      "Was not able to register, check email/password!";
                    }
                  }
                },
                child: Text("Register"),
                color:Colors.deepPurpleAccent,
              ),
            )

          ],
        ),
      )
    );
  }
}
