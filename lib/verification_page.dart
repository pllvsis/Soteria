import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationPage extends StatefulWidget {
  VerificationPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _VerificationPage createState() => _VerificationPage();
}

class _VerificationPage extends State<VerificationPage> {
  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Soteria',
        style: GoogleFonts.portLligatSans(
          textStyle: Theme.of(context).textTheme.headline1,
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _uploadIDWidget() {
    return Container(
        child: Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
          child: TextButton(
            onPressed: () {
              // uploadImageToFirebase(context),
            },
            child: Text('Upload Valid ID',
                style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
        )
      ],
    ));
  }

  Widget _capturePictureWidget() {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
          child: TextButton(
            onPressed: () {
              // uploadImageToFirebase(context),
            },
            child: Text('Capture Image',
                style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
        )
      ],
    );
  }

  Widget _submitButton() {
    return InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => VerificationPage()));
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xff6a25a6), Color(0xfff7892b)])),
          child: Text(
            'Next',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: height * .2),
                      _title(),
                      SizedBox(height: 50),
                      _uploadIDWidget(),
                      SizedBox(height: 20),
                      _capturePictureWidget(),
                      SizedBox(height: 20),
                      _submitButton()
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
