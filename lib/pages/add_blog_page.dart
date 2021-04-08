import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddBlogPage extends StatefulWidget {
  @override
  _AddBlogState createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0.3,
        brightness: Brightness.dark,
        automaticallyImplyLeading: false,
        title: Text(
          'EBT blog',
          style: GoogleFonts.roboto(
              color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            width: 120,
            height: 20,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: TextButton(
              onPressed: () {},
              child: Text('Upload', style: GoogleFonts.roboto()),
              style: TextButton.styleFrom(
                  primary: Colors.teal,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  backgroundColor: Colors.red),
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Stack(alignment: Alignment.bottomCenter, children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: MediaQuery.of(context).size.height / 3.0,
                  image: NetworkImage(
                      'https://randomuser.me/api/portraits/men/73.jpg'),
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
            ]),
            SizedBox(height: 30),
            TextFormField(
              style: GoogleFonts.nunito(color: Colors.red, fontSize: 16.0),
              decoration: InputDecoration(
                labelStyle:
                    GoogleFonts.nunito(color: Colors.green, fontSize: 16),
                labelText: 'Title',
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.pink, width: 3)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.pink, width: 3)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
