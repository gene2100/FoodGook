import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:intl/intl.dart';
import 'package:country_code_picker/country_code_picker.dart';
// import 'package:email_validator/email_validator.dart';

String _gender = "Male";
DateTime selectedDOB = DateTime.now();

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final validEmailCharacters = RegExp(r'^[a-zA-Z0-9@\.]+$');
  final validCharacters = RegExp(r'^[a-zA-Z0-9&%=]+$');

  final _formKey = GlobalKey<FormState>();

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDOB,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDOB)
      setState(() {
        selectedDOB = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Form(
          key: _formKey,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child: Text(
                    'Signup',
                    style:
                        TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(295.0, 112.0, 0.0, 0.0),
                  child: Text(
                    '.',
                    style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffff6240)),
                  ),
                )
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'EMAIL',
                        labelStyle: TextStyle(
                            fontFamily: 'Rublik',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        hintText: "example@gmail.com",
                        // hintText: 'EMAIL',
                        // hintStyle: ,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffff6240)))),
                    validator: (value) {
                      if (value == null || value.isEmpty || !validEmailCharacters.hasMatch(value) || !value.contains('@') ){
                        return 'Please enter valid email';
                      }
                      else
                        return null;
                    },
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'USERNAME',
                        labelStyle: TextStyle(
                            fontFamily: 'rublik',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffff6240)))),
                    validator: (value) {
                      if (value == null || value.isEmpty || !validCharacters.hasMatch(value) || value.length < 8 || value.length > 16){
                        return 'Username must contain 8 - 16 letters or numbers';
                      }
                      else
                        return null;
                    },
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'PASSWORD ',
                        labelStyle: TextStyle(
                            fontFamily: 'Rublik',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        hintText: "Must have at least 8 characters",
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffff6240)))),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty || !validCharacters.hasMatch(value) || value.length < 8 || value.length > 16){
                        return 'Password must contain 8 - 16 letters or numbers';
                      }
                      else
                        return null;
                    },
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'CONFIRM PASSWORD ',
                        labelStyle: TextStyle(
                            fontFamily: 'Rublik',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        hintText: "Must have at least 8 characters",
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffff6240)))),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty || !validCharacters.hasMatch(value) || value.length < 8 || value.length > 16){
                        return 'Password must contain 8 - 16 letters or numbers';
                      }
                      else
                        return null;
                    },
                  ),
                  SizedBox(height: 30.0),
                    Container(
                        alignment: Alignment.bottomLeft,
                    child: Text('GENDER',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                      fontFamily: 'rublik',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.grey),)),
                  SizedBox(height: 5.0),
                  Container(
                      alignment: Alignment.bottomLeft,
                  child: DropdownButton<String>(
                    value: _gender,
                    icon: Icon(Icons.arrow_downward),
                      iconSize: 20,
                      elevation: 16,
                      style: TextStyle(color : Color(0xffff6240),
                        fontFamily: 'rublik',
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                      underline: Container(
                        height: 2,
                        color: Color(0xffff6240)
                      ),
                      onChanged: (String newValue){
                        setState(() {
                          _gender = newValue;
                      });
                      },
                      items: <String>["Male", "Female"].map<DropdownMenuItem<String>>
                      ((String value) {
                        return DropdownMenuItem<String>(
                        value: value,
                        child : Text(value),
                        );
                      }
                    ).toList(),
                  )),
                  SizedBox(height: 15.0),
                  Container(
                      alignment: Alignment.bottomLeft,
                      child: Text('DATE OF BIRTH',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontFamily: 'rublik',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.grey),)),
                  SizedBox(height: 10.0),
                  Container(
                      alignment: Alignment.bottomLeft,
                    child: GestureDetector(
                      onTap: () => _selectDate(context),
                      child : Text(
                      "${DateFormat.yMd().format(selectedDOB.toLocal())}",
                         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xffff6240),
                             decoration: TextDecoration.underline,decorationThickness: 2
                         ),
                       ),
                    )),
                  SizedBox(height: 15.0),
                  Container(
                      alignment: Alignment.bottomLeft,
                      child: Text('NATIONALITY',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontFamily: 'rublik',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.grey),)),
                    SizedBox(height: 5.0),
                    CountryCodePicker(
                      padding: EdgeInsets.only(right: 20.0),
                      onChanged: print,
                      initialSelection: 'US',
                      favorite: ['+66'],
                      showCountryOnly: true,
                      showOnlyCountryWhenClosed: true,
                      alignLeft: true,
                  ),
                  SizedBox(height: 50.0),
                  Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.orangeAccent,
                        color: Color(0xffff6240),
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {
                            if (_formKey.currentState.validate()) {
                              print('Complete');
                            }
                            else
                              {
                                print('Error');
                              }
                          },
                          child: Center(
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Rublik'),
                            ),
                          ),
                        ),
                      )),
                  SizedBox(height: 20.0),
                  Container(
                    height: 40.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Center(
                          child: Text('Go Back',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Rublik')),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                ],
              )),
        ]))));

  }
}

