import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_app/screens/disease.dart';

class AddDisease extends StatefulWidget{

  const AddDisease({Key? key}): super(key: key);

  @override
  State<StatefulWidget> createState() => _AddDiseaseState(); 
  
}

class _AddDiseaseState extends State<AddDisease> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _spreadController = TextEditingController();
  final TextEditingController _symptomsController = TextEditingController();
  final TextEditingController _warningController = TextEditingController();

  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();
  FocusNode f4 = FocusNode();
  FocusNode f5 = FocusNode();

  showAlertDialog(BuildContext context){
    Widget okButton = TextButton(
      child: Text("OK",
      style: GoogleFonts.lato(
          fontWeight: FontWeight.bold
        ),
      ),
      onPressed: (){
        // Navigator.pushReplacement(context, 
        // MaterialPageRoute(builder: (_) => const Disease()));
        Navigator.pop(context);
        Navigator.pop(context);
        
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text(
        "Done!",
        style: GoogleFonts.lato(
          fontWeight: FontWeight.bold
        ),
      ),
      content: Text(
        "Add Disease Success",
        style: GoogleFonts.lato(),
      ),
      actions: [okButton],
    );

    showDialog(context: context, builder: (_) => alert);

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Add Disease",
          style: GoogleFonts.lato(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll){
            overscroll.disallowIndicator();
            return true;
          },
          child: ListView(
            shrinkWrap: true,
            children: [
              Form(
                key: _formKey,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      //name disease
                      TextFormField(
                        controller: _nameController,
                        focusNode: f1,
                        validator: (value){
                          if (value!.isEmpty){
                            return "Please enter the name of disease";
                          } 
                          return null;
                        },
                        style: GoogleFonts.lato(
                          fontSize: 18, fontWeight: FontWeight.bold
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 20,top: 10,bottom: 10),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(90)),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[350],
                          hintText: "Disease Name*",
                          hintStyle: GoogleFonts.lato(
                            color: Colors.black26,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        onFieldSubmitted: (value){
                          f1.unfocus();
                          FocusScope.of(context).requestFocus(f2);
                        
                        },
                        textInputAction: TextInputAction.next,

                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // description
                      TextFormField(
                        controller: _descriptionController,
                        focusNode: f2,
                        validator: (value){
                          if (value!.isEmpty){
                            return "Please enter description of the disease";
                          } 
                          return null;
                        },
                        style: GoogleFonts.lato(
                          fontSize: 18, fontWeight: FontWeight.bold
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 20,top: 10,bottom: 10),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(90)),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[350],
                          hintText: "Description*",
                          hintStyle: GoogleFonts.lato(
                            color: Colors.black26,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        onFieldSubmitted: (value){
                          f2.unfocus();
                          FocusScope.of(context).requestFocus(f3);
                        
                        },
                        textInputAction: TextInputAction.next,

                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //spread
                      TextFormField(
                        controller: _spreadController,
                        focusNode: f3,
                        validator: (value){
                          if (value!.isEmpty){
                            return "Please enter how disease spreads";
                          } 
                          return null;
                        },
                        style: GoogleFonts.lato(
                          fontSize: 18, fontWeight: FontWeight.bold
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 20,top: 10,bottom: 10),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(90)),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[350],
                          hintText: "Spread*",
                          hintStyle: GoogleFonts.lato(
                            color: Colors.black26,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        onFieldSubmitted: (value){
                          f3.unfocus();
                          FocusScope.of(context).requestFocus(f4);
                        
                        },
                        textInputAction: TextInputAction.next,

                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // symptoms
                      TextFormField(
                        controller: _symptomsController,
                        focusNode: f4,
                        validator: (value){
                          if (value!.isEmpty){
                            return "Please enter symptoms of disease";
                          } 
                          return null;
                        },
                        style: GoogleFonts.lato(
                          fontSize: 18, fontWeight: FontWeight.bold
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 20,top: 10,bottom: 10),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(90)),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[350],
                          hintText: "Symptoms*",
                          hintStyle: GoogleFonts.lato(
                            color: Colors.black26,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        onFieldSubmitted: (value){
                          f4.unfocus();
                          FocusScope.of(context).requestFocus(f5);
                        
                        },
                        textInputAction: TextInputAction.next,

                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //warning
                      TextFormField(
                        controller: _warningController,
                        focusNode: f5,
                        validator: (value){
                          if (value!.isEmpty){
                            return "Please enter warning about disease - seek medical attention";
                          } 
                          return null;
                        },
                        style: GoogleFonts.lato(
                          fontSize: 18, fontWeight: FontWeight.bold
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 20,top: 10,bottom: 10),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(90)),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[350],
                          hintText: "Warning*",
                          hintStyle: GoogleFonts.lato(
                            color: Colors.black26,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        onFieldSubmitted: (value){
                          f5.unfocus();
                        
                        },
                        textInputAction: TextInputAction.done,

                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 2,
                            primary: Colors.indigo,
                            onPrimary: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              showAlertDialog(context);
                              _addDisease();
                            }
                          },
                          child: Text(
                            "Add Disease",
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
    );
  }

  Future<void> _addDisease() async {
    var disease = {
      'Name': _nameController.text,
      'Description': _descriptionController.text,
      'Spread': _spreadController.text,
      'Symptoms': _symptomsController.text,
      'Warning': _warningController.text
    };

    FirebaseFirestore.instance
      .collection('disease')
      .add(disease);
  }
}