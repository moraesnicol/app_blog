import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class AddBlogPage extends StatefulWidget {
  @override
  _AddBlogState createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlogPage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  bool _isLoading = false;

  File _image;
  final picker = ImagePicker();

  // ignore: unused_element
  Future _getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0.3,
        brightness: Brightness.dark,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 30, color: Colors.red),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'EBT blog',
          style: GoogleFonts.roboto(
              color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
              width: 120,
              height: 20,
              child: IconButton(
                onPressed: () => _getImage(),
                icon: Icon(Icons.add, size: 30, color: Colors.red),
              )),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            _image != null
                ? Stack(alignment: Alignment.bottomCenter, children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image(
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: MediaQuery.of(context).size.height / 3.0,
                        image: FileImage(_image),
                        fit: BoxFit.cover,
                        // filterQuality: FilterQuality.medium,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.transparent, Colors.black87],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                    ),
                  ])
                : Container(width: 0, height: 0),
            SizedBox(height: 30),
            Container(
              height: 45,
              child: TextFormField(
                controller: _titleController,
                style: GoogleFonts.nunito(color: Colors.red, fontSize: 16.0),
                decoration: InputDecoration(
                  labelStyle:
                      GoogleFonts.nunito(color: Colors.green, fontSize: 16),
                  labelText: 'Título',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.pink, width: 3)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.pink, width: 3)),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 45,
              child: TextFormField(
                controller: _descriptionController,
                style: GoogleFonts.nunito(color: Colors.red, fontSize: 16.0),
                decoration: InputDecoration(
                  labelStyle:
                      GoogleFonts.nunito(color: Colors.green, fontSize: 16),
                  labelText: 'Digite aqui o que você pensa',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.pink, width: 3)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.pink, width: 3)),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: Text('Postar', style: GoogleFonts.roboto()),
              style: TextButton.styleFrom(
                  primary: Colors.teal,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  backgroundColor: Colors.red),
            ),
            SizedBox(height: 30),
            !_isLoading
                ? Container(width: 0.0, height: 0.0)
                : Container(
                    margin: EdgeInsets.symmetric(horizontal: 60),
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.pink,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
