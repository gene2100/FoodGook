
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class EditProfile extends StatefulWidget{

  final String _ImageURL;
  final String _Description;

  EditProfile(
      this._ImageURL,
      this._Description
      );


  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile>{

  File imageFile;
  final TextEditingController _descController = TextEditingController();

  void initState(){
    _descController..text = widget._Description;
  }

  @override
  Widget build(BuildContext context) {
    _openGallery(BuildContext context) async {
      var imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        imageFile = imageFile;
      });
      Navigator.of(context).pop();
    }

    _openCamera(BuildContext context) async {
      var imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
      setState(() {
        imageFile = imageFile;
      });
      Navigator.of(context).pop();
    }

    Widget _decideImageView() {
      if (imageFile != null) {
        print('1');
        return CircleAvatar(
          backgroundColor: Color(
              0xffE6E6E6),
          radius: 50,
          child: Icon(
            Icons.person,
            color: Color(0xffCCCCCC),
          ),
        );
      } else if(widget._ImageURL.isNotEmpty){
        print('2');
        print(imageFile);
        return CircleAvatar(
          backgroundColor: Color(
              0xffE6E6E6),
          radius: 50,
          child: Icon(
            Icons.person,
            color: Color(0xffCCCCCC),
          ),
          foregroundImage: NetworkImage(
            widget._ImageURL,
          ),
        );
      }
      else {
        print('3');
        return CircleAvatar(
          backgroundColor: Color(
              0xffE6E6E6),
          radius: 50,
          child: Icon(
            Icons.person,
            color: Color(0xffCCCCCC),
          ),
        );
      }
    }

    Future<void> _showPickerDialog(BuildContext context) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Select a photo from'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text('Gallery'),
                      onTap: () {
                        _openGallery(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text('Camera'),
                      onTap: () {
                        _openCamera(context);
                      },
                    )
                  ],
                ),
              ),
            );
          });
    }

    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            //profile
            Padding(
              padding: EdgeInsets.only(left: 25, right: 10, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Edit Profile',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                          fontFamily: 'Rublik',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //name+count
            Container(
              //name
                padding: EdgeInsets.only(top: 20, left: screenWidth/2 - 50),
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap : (){
                            _showPickerDialog(context);
                            },
                          child: _decideImageView(),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20, right: 20, left: 20) ,
                  child: Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          maxLines: null,
                          controller: _descController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                              hintText: "Description",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  )
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Color(0xffff6240)),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0)
                                  )
                              ),
                              contentPadding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 25, bottom: 25)),
                        )
                      )],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 50, right: 20, left: 20),
              // alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    child: Stack(
                      //back button
                      children: <Widget>[
                        SizedBox(
                          height: 45,
                          width: 100,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'BACK',
                              style: TextStyle(
                                color: Color(0xffff6240),
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              side: BorderSide(
                                  width: 1, color: Color(0xffff6240)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      //next button
                      children: <Widget>[
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffff6240),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x54000000),
                                  spreadRadius: 10,
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            height: 500,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                        SizedBox(
                          height: 45,
                          width: 100,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.all(15.0),
                              primary: Colors.white,
                            ),
                            onPressed: () {

                            },
                            child: Text('UPDATE'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}