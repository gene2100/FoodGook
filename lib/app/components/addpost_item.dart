import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';

class AddRecipeScreen extends StatefulWidget {
  // final Recipe recipe;

  AddRecipeScreen({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final tagController = TextEditingController();
  String dropdownValue = '';
  // List<String> _dynamicChips = [];
  File imageFile;
  var isSubmiting = false;

  @override
  void initState() {
    super.initState();
    /* nameController..text = widget.recipe != null ? widget.recipe.name : '';
    servesController..text = widget.recipe != null ? widget.recipe.serves : '';
    linkController..text = widget.recipe != null ? widget.recipe.ytUrl : '';
    prepareTimeController
      ..text = widget.recipe != null ? widget.recipe.preparationTime : '';
    dropdownValue = widget.recipe != null ? widget.recipe.complexity : '';
    _setMetaTags(); */
  }

  @override
  void dispose() {
    super.dispose();
    tagController.dispose();
  }

  //fix deprecated
  @override
  Widget build(BuildContext context) {
    _openGallery(BuildContext context) async {
      var imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        this.imageFile = imageFile;
      });
      Navigator.of(context).pop();
    }

    _openCamera(BuildContext context) async {
      var imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
      setState(() {
        this.imageFile = imageFile;
      });
      Navigator.of(context).pop();
    }

    Widget _decideImageView() {
      if (imageFile != null) {
        return Image.file(
          imageFile,
          fit: BoxFit.cover,
        );
      } else {
        return Image.asset(
          'assets/images/recipe_place_holder.jpg',
          fit: BoxFit.cover,
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

    // dynamicChips() {
    //   return Wrap(
    //     spacing: 6.0,
    //     runSpacing: 6.0,
    //     children: List<Widget>.generate(_dynamicChips.length, (int index) {
    //       return Chip(
    //         label: Text(_dynamicChips[index]),
    //         onDeleted: () {
    //           setState(() {
    //             _dynamicChips.removeAt(index);
    //           });
    //         },
    //         deleteIcon: Icon(Icons.delete),
    //       );
    //     }),
    //   );
    // }

    // change to TransformerPageView
    return Scaffold(
      body: SafeArea(
        child: ListView(
          //wrap
          // key: _formKey,
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(left: 10, right: 20, top: 20, bottom: 10),
              child: Column(
                children: <Widget>[
                  // Align(
                  //   alignment: Alignment.topCenter,
                  //   child: Text(
                  //     'Add recipe',
                  //     style: TextStyle(
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.w800,
                  //       color: Colors.black,
                  //       fontFamily: 'Rublik',
                  //     ),
                  //   ),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        //change button position //on photo
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        'Add recipe',
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          // fontWeight: FontWeight.w800,
                          color: Colors.black,
                          fontFamily: 'Rublik',
                        ),
                      ),
                      // SizedBox(
                      //   width: 215,
                      // ),

                      // Icon(
                      //   Icons.settings_outlined,
                      //   color: Colors.grey,
                      //   size: 24,
                      // ),
                    ],
                  ),
                ],
              ),
            ),
            // Row(
            //   children: [
            //     IconButton(
            //       //change button position //on photo
            //       icon: const Icon(Icons.close),
            //       onPressed: () {
            //         Navigator.pop(context);
            //       },
            //     ),
            //     Text(
            //       'Add recipe',
            //       style: TextStyle(fontSize: 18.0),
            //       textAlign: TextAlign.center,
            //     ),
            //   ],
            // ),

            // SizedBox(
            //   height: 60,
            // ),
            GestureDetector(
              child: Container(
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: _decideImageView(),
                ),
              ),
              onTap: () {
                _showPickerDialog(context);
              },
            ),
            Expanded(
              child: Scrollbar(
                child: ListView(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  //input form
                  children: <Widget>[
                    Form(
                      child: Padding(
                        // padding: const EdgeInsets.all(25.0),
                        padding: const EdgeInsets.only(
                            top: 10, left: 20, right: 20, bottom: 30),
                        child: Column(
                          children: <Widget>[
                            //Menu
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: TextFormField(
                                // textInputAction: TextInputAction.newline,
                                keyboardType: TextInputType.text,

                                decoration: const InputDecoration(
                                    hintText: "Menu: Teriyaki Salmon",
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xffff6240)),
                                    ),
                                    errorStyle: TextStyle(
                                        color: Colors.yellow,
                                        decorationColor: Colors.yellow),
                                    contentPadding: const EdgeInsets.only(
                                        left: 15, right: 15)),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please Enter Count!';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            //Description
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                    hintText: "Desciption",
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xffff6240)),
                                    ),
                                    errorStyle: const TextStyle(
                                        color: Colors.yellow,
                                        decorationColor: Colors.yellow),
                                    contentPadding: const EdgeInsets.only(
                                        left: 15, right: 15)),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please Enter Your Name!';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            //Tag
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                    hintText:
                                        "Add food tag e.g. #salmon, #dinner",
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xffff6240)),
                                    ),
                                    errorStyle: const TextStyle(
                                        color: Colors.yellow,
                                        decorationColor: Colors.yellow),
                                    contentPadding: const EdgeInsets.only(
                                        left: 15, right: 15)),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please Enter Your Name!';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Time",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.text,
                                    decoration: const InputDecoration(
                                        hintText: "2 hours",
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffff6240)),
                                        ),
                                        errorStyle: const TextStyle(
                                            color: Colors.yellow,
                                            decorationColor: Colors.yellow),
                                        contentPadding: const EdgeInsets.only(
                                            left: 15, right: 15)),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Skill",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.text,
                                    decoration: const InputDecoration(
                                      hintText: "Easy",
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xffff6240)),
                                      ),
                                      errorStyle: const TextStyle(
                                          color: Colors.yellow,
                                          decorationColor: Colors.yellow),
                                      contentPadding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Tooltip(message: "NEXT"),
                                  // child:
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //Next button
            SizedBox(width: 320),

            Row(
              children: [
                SizedBox(width: 340),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
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
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.all(15.0),
                          primary: Colors.white,
                        ),
                        onPressed: () {},
                        child: Text('NEXT'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
