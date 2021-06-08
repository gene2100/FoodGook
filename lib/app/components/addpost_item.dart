import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'addpost_item2.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pop(context);
          },
          child: Icon(Icons.close, color: Colors.grey[700], size: 24),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Text(
            'Menu',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          //wrap
          // key: _formKey,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      StepProgressIndicator(
                        totalSteps: 3,
                        currentStep: 1,
                        // selectedColor: Colors.green[400],
                        selectedColor: Color(0xffff6240),
                        unselectedColor: Colors.grey[200],
                      )
                    ],
                  ),
                ),
                Container(
                  //image and close icon
                  decoration: new BoxDecoration(color: Colors.white),
                  child: Stack(
                    children: <Widget>[
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
                      // Positioned(
                      //   //close
                      //   top: 10,
                      //   left: 20,
                      //   child: IconButton(
                      //     //change button position //on photo
                      //     icon: const Icon(Icons.close),
                      //     color: Colors.grey,
                      //     iconSize: 24,
                      //     onPressed: () {
                      //       Navigator.pop(context);
                      //     },
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Next button
            Padding(
              padding: EdgeInsets.only(top: 20, right: 20, left: 20),
              // alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // SizedBox(width: 340),
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AddRecipe2Screen()), //addpost_item.dart
                              );
                            },
                            child: Text('NEXT'),
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
