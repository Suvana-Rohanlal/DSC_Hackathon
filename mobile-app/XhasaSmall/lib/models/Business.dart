import 'package:flutter/material.dart';

class BusinessDetail extends StatefulWidget {
  dynamic business;


  BusinessDetail({this.business});
  @override
  _BusinessDetailState createState() => _BusinessDetailState();
}

class _BusinessDetailState extends State<BusinessDetail> {

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: Container( 
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Text(widget.business.name),
              Text(widget.business.about),
              Text(widget.business.contact),
              Text(widget.business.tag),
              Container(
                child: RaisedButton(
                color: Colors.black,
                onPressed: () {  },
                child: Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 22,
                        letterSpacing: 1.5,
                      ),
                ),
              ),
              )
            ],
            )
    )
      
    );
  }
}

